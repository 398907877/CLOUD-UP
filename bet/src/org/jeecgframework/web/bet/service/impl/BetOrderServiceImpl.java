package org.jeecgframework.web.bet.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.DateUtils;
import org.jeecgframework.core.util.LogUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.web.bet.entity.BetOrderEntity;
import org.jeecgframework.web.bet.entity.BetPhaseEntity;
import org.jeecgframework.web.bet.entity.PointDetailEntity;
import org.jeecgframework.web.bet.job.RefreshLotteryTask;
import org.jeecgframework.web.system.pojo.base.TSType;
import org.jeecgframework.web.system.pojo.base.TSUser;

@Service("betOrderService")
@Transactional
public class BetOrderServiceImpl extends CommonServiceImpl implements org.jeecgframework.web.bet.service.BetOrderServiceI {

    @Autowired
    private RefreshLotteryTask refreshLotteryTask;
    /**
     * 描述
     * @author John Zhang
     * @created 2016年12月15日 下午8:19:59
     * @param betOrders
     * @see org.jeecgframework.web.bet.service.BetOrderServiceI#saveBetOrders(java.util.List)
     */
    @Override
    public int saveBetOrders(List<BetOrderEntity> betOrders,Map<String,Object> lottery) {
        TSUser user = this.get(TSUser.class, ResourceUtil.getSessionUserName().getId());
        BigDecimal totalAmmount = new BigDecimal(0);
        List<PointDetailEntity> pointDetailList = new ArrayList<PointDetailEntity>();
        for (BetOrderEntity betOrderEntity : betOrders) {
            if(!lottery.get("phase").toString().equals(betOrderEntity.getPhase())){
                return 1;
            }
            String game = betOrderEntity.getGame();
            String type = betOrderEntity.getType();
            String target = betOrderEntity.getTarget();
            List<TSType> tstypes = null;
            if("1".equals(game)){
                tstypes = this.findHql("select t from TSType t where t.TSTypegroup.typegroupcode =? and t.typecode=?", "RANKING"+type,target);
            }else if("2".equals(game)){
                tstypes = this.findHql("select t from TSType t where t.TSTypegroup.typegroupcode =? and t.typecode=?", "TOP2",target);
            }else{
                tstypes = this.findHql("select t from TSType t where t.TSTypegroup.typegroupcode =? and t.typecode=?", "TWO"+type,target);
            }
            if(tstypes == null || tstypes.size()!=1){
                return 3;
            }
            betOrderEntity.setOdds(new BigDecimal(tstypes.get(0).getTypename()));
            Date currDate = new Date();
            BigDecimal amount = betOrderEntity.getAmount();
            if(amount.compareTo(new BigDecimal(1))==-1){
                return 4;
            }
            if(amount.compareTo(new BigDecimal(6000))==1){
                return 4;
            }
            totalAmmount = totalAmmount.add(amount);
            betOrderEntity.setCreatetime(currDate);
            betOrderEntity.setWinamount(amount.multiply(betOrderEntity.getOdds()).subtract(amount));
            betOrderEntity.setState("1");
            betOrderEntity.setResulttype("");
            betOrderEntity.setUser(user);
            betOrderEntity.setUsername(user.getUserName());
            PointDetailEntity pointDetail = new PointDetailEntity();
            pointDetail.setAmount(amount.multiply(new BigDecimal(-1)));
            pointDetail.setCreatetime(currDate);
            pointDetail.setCreateuser(user.getUserName());
            pointDetail.setCreateuserid(user.getId());
            pointDetail.setUserid(user.getId());
            pointDetail.setType("1");//投注
            pointDetail.setBetOrder(betOrderEntity);
            pointDetail.setRealname(user.getRealName());
            pointDetail.setUsername(user.getUserName());
            pointDetailList.add(pointDetail);
        }
        if (totalAmmount.compareTo(user.getPoint())==1) {
            return 2;
        }
        this.batchSave(betOrders);
        this.batchSave(pointDetailList);
        user.setPoint(user.getPoint().subtract(totalAmmount));
        ResourceUtil.getSessionUserName().setPoint(user.getPoint());
        this.saveOrUpdate(user);
        return 0;
    }

    /**
     * 描述
     * @author John Zhang
     * @created 2016年12月16日 上午11:10:45
     * @see org.jeecgframework.web.bet.service.BetOrderServiceI#betAccount()
     */
    @Override
    public void betAccount() {
        List<BetOrderEntity> orders = this.findByProperty(BetOrderEntity.class, 
                "state", "1");
        if (orders.size() > 0) {
            for (BetOrderEntity order : orders) {
                List<BetPhaseEntity> phase = this.findByProperty(BetPhaseEntity.class,
                        "phase", Integer.valueOf(order.getPhase()));
                if(phase.size() != 0){
                    try {
                        BetPhaseEntity p = phase.get(0);
                        Map<String, Object> pa = this.findOneForJdbc("select * from t_phase_analyse where phase=?",
                                p.getPhase());
                        if(p.getResult() == null || pa == null){
                            continue;
                        }
                        String column = "";
                        boolean isWin = false;
                        if ("1".equals(order.getGame())) { // 排名结算
                            column = "ranking" + order.getType();
                            if (order.getTarget().equals(pa.get(column).toString())) {
                                isWin = true;
                            }
                        } else if ("2".equals(order.getGame())) {// 冠亚和结算
                            if ("冠亚大".equals(order.getTarget()) || "冠亚小".equals(order.getTarget())) {
                                column = "top2b";
                            } else if ("冠亚单".equals(order.getTarget()) || "冠亚双".equals(order.getTarget())) {
                                column = "top2d";
                            } else {
                                column = "top2";
                            }
                            if (order.getTarget().contains(pa.get(column).toString()) && !column.equals("top2")) {
                                isWin = true;
                            }else{
                                if(order.getTarget().equals(pa.get(column).toString())){
                                    isWin = true;
                                }
                            }
                        } else {// 两面盘结算
                            column = "ranking" + order.getType();
                            if (!"龙".equals(order.getTarget()) && !"虎".equals(order.getTarget())) {
                                if ("大".equals(order.getTarget())) {
                                    isWin = Integer.valueOf(pa.get(column).toString()) > 5;
                                } else if ("小".equals(order.getTarget())) {
                                    isWin = Integer.valueOf(pa.get(column).toString()) <= 5;
                                } else if ("单".equals(order.getTarget())) {
                                    isWin = Integer.valueOf(pa.get(column).toString()) % 2 != 0;
                                } else if ("双".equals(order.getTarget())) {
                                    isWin = Integer.valueOf(pa.get(column).toString()) % 2 == 0;
                                }
                            } else {
                                column += "lh";
                                if (order.getTarget().equals(pa.get(column).toString())) {
                                    isWin = true;
                                }
                            }
                        }
                        if (isWin) {
                            order.setResulttype("1");
                            order.setResult(order.getWinamount());
                            PointDetailEntity pointDetail = new PointDetailEntity();
                            BigDecimal point = order.getAmount().multiply(order.getOdds());
                            pointDetail.setAmount(point);
                            pointDetail.setCreatetime(new Date());
                            pointDetail.setCreateuser(order.getUsername());
                            pointDetail.setCreateuserid(order.getUser().getId());
                            pointDetail.setUserid(order.getUser().getId());
                            pointDetail.setType("2");// 投注 赢钱
                            pointDetail.setBetOrder(order);
                            this.saveOrUpdate(pointDetail);
                            TSUser user = this.get(TSUser.class, order.getUser().getId());
                            user.setPoint(user.getPoint().add(point));
                            this.saveOrUpdate(user);
                        } else {
                            order.setResulttype("2");
                            order.setResult(order.getAmount().multiply(new BigDecimal(-1)));
                        }
                        order.setState("2");
                        this.saveOrUpdate(order);
                    /*int openResult = Integer.valueOf(result[Integer.valueOf(order.getType())-1]);
                    int orderResult = Integer.valueOf(order.getTarget());
                    if(orderResult == openResult){
                        order.setResulttype("1");
                        order.setResult(order.getWinamount());
                        PointDetailEntity pointDetail = new PointDetailEntity();
                        BigDecimal point = order.getAmount().multiply(order.getOdds());
                        pointDetail.setAmount(point);
                        pointDetail.setCreatetime(new Date());
                        pointDetail.setCreateuser(order.getUsername());
                        pointDetail.setCreateuserid(order.getUserid());
                        pointDetail.setUserid(order.getUserid());
                        pointDetail.setType("2");//投注 赢钱
                        pointDetail.setBetOrder(order);
                        this.saveOrUpdate(pointDetail);
                        TSUser user = this.get(TSUser.class, order.getUserid());
                        user.setPoint(user.getPoint().add(point));
                        this.saveOrUpdate(user);*/
                       
                            //Collection<Client> clients = ClientManager.getInstance().getAllClient();
                            /*for (Client client : clients) {
                                if(client.getUser().getId().equals(user.getId())){
                                    client.getUser().setPoint(user.getPoint());
                                }
                            }*/
                        } catch (Exception e) {
                            e.printStackTrace();
                            LogUtil.error(e.getMessage());
                            continue;
                        }
                   
                }else{
                    continue;
                }
            }
        }
    }

    /**
     * 描述
     * @author John Zhang
     * @created 2016年12月20日 下午10:02:09
     * @return
     * @see org.jeecgframework.web.bet.service.BetOrderServiceI#getGameList()
     */
    @Override
    public Map<String, Object> getGameList(String game) {
        Map<String, Object> result = new LinkedHashMap<String, Object>();
        if("1".equals(game)){
            for(int i=0;i<10;i++){
                List<TSType> types = this.findHql("select t from TSType t where t.TSTypegroup.typegroupcode =?", "RANKING"+(i+1));
                result.put(types.get(0).getTSTypegroup().getTypegroupname(), types);
            }
        }else if("3".equals(game)){
            for(int i=0;i<10;i++){
                List<TSType> types = this.findHql("select t from TSType t where t.TSTypegroup.typegroupcode =?", "TWO"+(i+1));
                result.put(types.get(0).getTSTypegroup().getTypegroupname(), types);
            }
        }else if("2".equals(game)){
            result.put("TOP2", this.findHql("select t from TSType t where t.TSTypegroup.typegroupcode =?", "TOP2"));
        }
        return result;
    }

    /**
     * 描述 手动保存注单
     * @author John Zhang
     * @created 2017年1月12日 下午11:31:16
     * @param berOrder
     * @see org.jeecgframework.web.bet.service.BetOrderServiceI#saveOrder(org.jeecgframework.web.bet.entity.BetOrderEntity)
     */
    @Override
    public int saveOrder(BetOrderEntity berOrder) {
        TSUser user = this.get(TSUser.class,  berOrder.getUser().getId());
        if(user != null){
            if(user.getPoint().compareTo(berOrder.getAmount()) == -1){
                return 2;
            }
            berOrder.setCreatetime(new Date());
            berOrder.setWinamount(berOrder.getAmount().multiply(berOrder.getOdds()).subtract(berOrder.getAmount()));
            berOrder.setState("1");
            berOrder.setResulttype("");
            berOrder.setUser(user);
            berOrder.setUsername(user.getUserName());
            PointDetailEntity pointDetail = new PointDetailEntity();
            pointDetail.setAmount(berOrder.getAmount().multiply(new BigDecimal(-1)));
            pointDetail.setCreatetime(new Date());
            pointDetail.setCreateuser(user.getUserName());
            pointDetail.setCreateuserid(user.getId());
            pointDetail.setUserid(user.getId());
            pointDetail.setType("1");//投注
            pointDetail.setBetOrder(berOrder);
            pointDetail.setRealname(user.getRealName());
            pointDetail.setUsername(user.getUserName());
            this.saveOrUpdate(berOrder);
            this.saveOrUpdate(pointDetail);
            user.setPoint(user.getPoint().subtract(berOrder.getAmount()));
            ResourceUtil.getSessionUserName().setPoint(user.getPoint());
            this.saveOrUpdate(user);
        }else{
            return 1;
        }
        return 0;
    }
    public static final String[] RESULT = new String[]{"1","2","3","4","5","6","7","8","9","10"};
    public int saveResult(BetPhaseEntity phase){
        if(phase.getPhase() == null || phase.getResult() == null){
            return 1;
        }
        String[] result = phase.getResult().split(",");
        if(result.length != 10){
            return 2;
        }
        List<String> resultList = Arrays.asList(result);
        for(int i=0;i<10;i++){
            int count = 0;
            for (String r : resultList) {
                if(RESULT[i].equals(r)){
                    count ++;
                }
            }
            if(count != 1){
                return 2;
            }
        }
        BetPhaseEntity oldPhase = this.findByProperty(BetPhaseEntity.class, "phase", phase.getPhase()).get(0);
        oldPhase.setResult(phase.getResult());
        oldPhase.setLoadtime(DateUtils.date2Str(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
        this.saveOrUpdate(oldPhase);
        refreshLotteryTask.analysePhase(oldPhase);
        this.betAccount();
        return 0;
    }
}