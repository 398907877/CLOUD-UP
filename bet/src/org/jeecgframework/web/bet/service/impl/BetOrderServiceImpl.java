package org.jeecgframework.web.bet.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.LogUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.web.bet.entity.BetOrderEntity;
import org.jeecgframework.web.bet.entity.BetPhaseEntity;
import org.jeecgframework.web.bet.entity.PointDetailEntity;
import org.jeecgframework.web.bet.job.RefreshLotteryTask;
import org.jeecgframework.web.system.manager.ClientManager;
import org.jeecgframework.web.system.pojo.base.Client;
import org.jeecgframework.web.system.pojo.base.TSUser;

@Service("betOrderService")
@Transactional
public class BetOrderServiceImpl extends CommonServiceImpl implements org.jeecgframework.web.bet.service.BetOrderServiceI {

    /**
     * 描述
     * @author John Zhang
     * @created 2016年12月15日 下午8:19:59
     * @param betOrders
     * @see org.jeecgframework.web.bet.service.BetOrderServiceI#saveBetOrders(java.util.List)
     */
    @Override
    public int saveBetOrders(List<BetOrderEntity> betOrders) {
        TSUser user = ResourceUtil.getSessionUserName();
        BigDecimal totalAmmount = new BigDecimal(0);
        List<PointDetailEntity> pointDetailList = new ArrayList<PointDetailEntity>();
        for (BetOrderEntity betOrderEntity : betOrders) {
            if(!RefreshLotteryTask.currentLottery.get("next_phase").toString().equals(betOrderEntity.getPhase())){
                return 1;
            }
            Date currDate = new Date();
            totalAmmount = totalAmmount.add(betOrderEntity.getAmount());
            betOrderEntity.setCreatetime(currDate);//TODO 后期检查倍数  投注额
            betOrderEntity.setWinamount(betOrderEntity.getAmount().multiply(betOrderEntity.getOdds()).subtract(betOrderEntity.getAmount()));
            betOrderEntity.setState("1");
            betOrderEntity.setResulttype("");
            betOrderEntity.setUserid(user.getId());
            betOrderEntity.setUsername(user.getUserName());
            PointDetailEntity pointDetail = new PointDetailEntity();
            pointDetail.setAmount(betOrderEntity.getAmount().multiply(new BigDecimal(-1)));
            pointDetail.setCreatetime(currDate);
            pointDetail.setCreateuser(user.getUserName());
            pointDetail.setCreateuserid(user.getId());
            pointDetail.setUserid(user.getId());
            pointDetail.setType("1");//投注
            pointDetailList.add(pointDetail);
        }
        if (totalAmmount.compareTo(user.getPoint())==1) {
            return 2;
        }
        this.batchSave(betOrders);
        this.batchSave(pointDetailList);
        user.setPoint(user.getPoint().subtract(totalAmmount));
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
            for (BetOrderEntity order : orders) {//TODO 先按一种玩法结算
                List<BetPhaseEntity> phase = this.findByProperty(BetPhaseEntity.class,
                        "phase", Integer.valueOf(order.getPhase()));
                if(phase.size() != 0){
                    BetPhaseEntity p = phase.get(0);
                    String[] result = p.getResult().split(",");
                    int openResult = Integer.valueOf(result[Integer.valueOf(order.getType())-1]);
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
                        this.saveOrUpdate(pointDetail);
                        TSUser user = this.get(TSUser.class, order.getUserid());
                        user.setPoint(user.getPoint().add(point));
                        this.saveOrUpdate(user);
                        try {
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
                        order.setResulttype("2");
                        order.setResult(order.getAmount().multiply(new BigDecimal(-1)));
                    }
                    order.setState("2");
                    this.saveOrUpdate(order);
                }else{
                    continue;
                }
            }
        }
    }
	
}