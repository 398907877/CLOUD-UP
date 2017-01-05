package org.jeecgframework.web.bet.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.hibernate.qbc.HqlQuery;
import org.jeecgframework.core.common.hibernate.qbc.PageList;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil;
import org.jeecgframework.core.util.DateUtils;
import org.jeecgframework.core.util.JSONHelper;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.bet.entity.BetOrderEntity;
import org.jeecgframework.web.bet.entity.PointDetailEntity;
import org.jeecgframework.web.bet.entity.QueryyingleEntity;
import org.jeecgframework.web.bet.job.GenerateTodayPhase;
import org.jeecgframework.web.bet.service.BetOrderServiceI;
import org.jeecgframework.web.system.manager.ClientManager;
import org.jeecgframework.web.system.pojo.base.Client;
import org.jeecgframework.web.system.pojo.base.TSUser;
import org.jeecgframework.web.system.service.SystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 描述
 * @author John Zhang
 * @version 1.0
 * @created 2016年12月14日 下午11:43:19
 */
@Scope("prototype")
@Controller
@RequestMapping("/betController")
public class BetController extends BaseController{
    /**
     * Logger for this class
     */
    @SuppressWarnings("unused")
    private static final Logger logger = Logger.getLogger(BaseController.class);
    public static final long FP_TIME = 50000;
    public static final long JG_TIME = 5*60*1000;
    private static final Map<String,Object> prizeCount = new HashMap<String,Object>();
    @Autowired
    private BetOrderServiceI betOrderService;
    
	private SystemService systemService;
	@Autowired
	public void setSystemService(SystemService systemService) {
		this.systemService = systemService;
	}
    
    @RequestMapping(params="raceView")
    public String raceView(HttpServletRequest request){
      /*  request.setAttribute("phaseInfo", getPhaseInfo());
        long kjTime = DateUtils.str2Date(RefreshLotteryTask.currentLottery.get("next_time").toString(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).getTime();
        long curTime = System.currentTimeMillis();
        if((kjTime-curTime)>6*60*1000){
            request.setAttribute("IS_STOP", "true");
        }*/
        
        return "website/main/race-view";
    }
    
    @RequestMapping(params="raceView2")
    public String raceView2(HttpServletRequest request){
        //long kjTime = DateUtils.str2Date(RefreshLotteryTask.currentLottery.get("next_time").toString(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).getTime();
        //long curTime = System.currentTimeMillis();
        String  curTime = DateUtils.formatDate("HH:mm:ss");
        if(curTime.compareTo(GenerateTodayPhase.START_TIME)<0||
                curTime.compareTo(GenerateTodayPhase.END_TIME)>=0){
            request.setAttribute("IS_STOP", "true");
        }else{
            request.setAttribute("RANKING", betOrderService.getGameList("1"));
            request.setAttribute("TOP2", betOrderService.getGameList("2"));
            request.setAttribute("TWO", betOrderService.getGameList("3"));
            request.setAttribute("phaseInfo", getPhaseInfo());
        }
        return "website/main/race-view2";
    }
    @RequestMapping(params="getPhaseInfo")
    @ResponseBody
    public Map<String, Object> phaseInfo(){
        return getPhaseInfo();
    }
    /**
     * 
     * @author John Zhang
     * @created 2016年12月15日 下午2:03:32
     * @return
     */
    private Map<String, Object> getPhaseInfo(){
        Map<String,Object> phaseInfo = new HashMap<String, Object>();
        /*Map<String,Object> currentLottery = RefreshLotteryTask.currentLottery;
        */
        String curtime = DateUtils.formatDate("yyyy-MM-dd HH:mm:ss");
        List<Map<String,Object>> phases = betOrderService.findForJdbc("select * from t_bet_phase where opentime > ? order by opentime asc", curtime);
        if(phases.size() <= 0){
            return phaseInfo;
        }
        Map<String,Object> currentLottery = phases.get(0);
        String currentphase = currentLottery.get("phase").toString();
        String lastPhase= String.valueOf(Integer.valueOf(currentphase)-1);
        Map<String,Object> lastLottery = betOrderService.findOneForJdbc("select * from t_bet_phase where phase = ?",
                lastPhase);
        if(lastLottery.get("result") == null){
            lastPhase = String.valueOf(Integer.valueOf(lastPhase)-1);
            lastLottery = betOrderService.findOneForJdbc("select * from t_bet_phase where phase = ?",
                    lastPhase);
        }
        long kjTime = DateUtils.str2Date(currentLottery.get("opentime").toString(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).getTime();
        long curTime = System.currentTimeMillis();
        long difTime = 0;
        /*if(kjTime <= curTime){
            difTime = JG_TIME+kjTime-curTime;
            phaseInfo.put("nextPhase", Integer.parseInt(currentLottery.get("phase").toString())+2); 
        }else{
            difTime = kjTime - curTime;
            phaseInfo.put("nextPhase", currentLottery.get("next_phase"));
        }*/
        difTime = kjTime - curTime;
        phaseInfo.put("nextPhase", currentLottery.get("phase"));
        if(prizeCount.get(lastPhase) == null){
            prizeCount.clear();
            Random rand = new Random();  
            Integer p = rand.nextInt(200)+200;
            prizeCount.put(lastPhase, p);
        }
        phaseInfo.put("prizeCount", lastLottery.get("result")==null?"":prizeCount.get(lastPhase));
        phaseInfo.put("openResult", lastLottery.get("result")==null? new Object[]{}:lastLottery.get("result").toString().split(","));
        phaseInfo.put("openPhase", lastPhase);
        phaseInfo.put("kjTime", difTime);//距离开奖时间
        phaseInfo.put("fpTime", difTime - FP_TIME);//封盘时间
        return phaseInfo;
    }
    
    @RequestMapping(params="comfirmBetOrder")
    public String comfirmBetOrder(){
        return "website/main/comfirmBetOrder";
    }
    @RequestMapping(params="betConf")
    @ResponseBody
    public AjaxJson betConf(HttpServletRequest request){
        AjaxJson result = new AjaxJson();
        List<BetOrderEntity> betOrders = JSONHelper.toList(JSONHelper.toJSONArray(request.getParameter("betList")), BetOrderEntity.class);
        if(betOrders.size() == 0){
            result.setMsg("您的投注内容有误，请返回重新投注！");
            result.setSuccess(false);
            return result;
        }
        Map<String,Object> lottery = betOrderService.findOneForJdbc("select * from t_bet_phase where phase = ?",
                betOrders.get(0).getPhase());
        if(lottery == null){
            result.setMsg("您的投注内容有误，请返回重新投注！");
            result.setSuccess(false);
            return result;
        }
        long kjTime = DateUtils.str2Date(lottery.get("opentime").toString(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).getTime();
        if((kjTime-BetController.FP_TIME)<System.currentTimeMillis()){
            result.setMsg("该期已封盘！请重新投注");
            result.setSuccess(false);
            return result;
        }
        if((kjTime-BetController.JG_TIME)>System.currentTimeMillis()){
            result.setMsg("该期未开盘！请重新投注");
            result.setSuccess(false);
            return result;
        }
        try {
            int i = betOrderService.saveBetOrders(betOrders,lottery);
            if(i == 0){
                result.setMsg("投注成功!");
                result.setSuccess(true);
            }else if(i == 1){
                result.setMsg("注单中存在不属于本期的投注，请检查。");
                result.setSuccess(false);
            }else if(i==2){
                result.setMsg("您的积分不足，请返回重新投注！");
                result.setSuccess(false);
            }else if(i==3){
                result.setMsg("您的投注内容有误，请返回重新投注！");
                result.setSuccess(false);
            }else if(i==4){
                result.setMsg("您的投注额有误，请返回重新投注！");
                result.setSuccess(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("系统异常！");
            result.setSuccess(false);
        }
        return result;
    }
    @RequestMapping(params="myBetOrder")
    public String myBetOrder(HttpServletRequest request){
        request.setAttribute("betInfo", betOrderService.findForJdbc("SELECT IFNULL(sum(t.result),0) as result,IFNULL(sum(t.amount),0) as amount FROM T_BET_ORDER t "
                + "where t.userid=? and t.createTime Between ? and ?",
                ResourceUtil.getSessionUserName().getId(),
                DateUtils.date2Str(new Date(), new SimpleDateFormat("yyyy-MM-dd 00:00:00")),
                DateUtils.date2Str(new Date(), new SimpleDateFormat("yyyy-MM-dd 23:59:59"))));
        request.setAttribute("betOrderList", betOrderService.findForJdbc("SELECT * FROM T_BET_ORDER t where t.userid=? order by t.createtime desc",
                ResourceUtil.getSessionUserName().getId()));
        return "website/main/myBetOrder";
    }
    
    @RequestMapping(params = "betOrdersDataGrid")
    public void betOrdersDataGrid(BetOrderEntity betOrder,HttpServletRequest request,HttpServletResponse response,DataGrid dataGrid){
        betOrder.setUsername(betOrder.getUsername()==null?"":betOrder.getUsername());
        CriteriaQuery cq = new CriteriaQuery(BetOrderEntity.class, dataGrid);
        HqlGenerateUtil.installHql(cq, betOrder);
        cq.eq("state", "1");
        cq.add();
        betOrderService.getDataGridReturn(cq, true);
        TagUtil.datagrid(response, dataGrid);
    }
    
    @RequestMapping(params = "betOrdersDataGridAll")
    public void betOrdersDataGridAll(BetOrderEntity betOrder,HttpServletRequest request,HttpServletResponse response,DataGrid dataGrid){
        betOrder.setUsername(betOrder.getUsername()==null?"":betOrder.getUsername());
        CriteriaQuery cq = new CriteriaQuery(BetOrderEntity.class, dataGrid);
        HqlGenerateUtil.installHql(cq, betOrder);
        String operatetime_begin = request.getParameter("createtime_begin");
        if(operatetime_begin != null) {
            Timestamp beginValue = null;
            try {
                beginValue = DateUtils.parseTimestamp(operatetime_begin, "yyyy-MM-dd");
            } catch (ParseException e) {
                e.printStackTrace();
            }
            cq.ge("createtime", beginValue);
        }
        String operatetime_end = request.getParameter("createtime_end");
        if(operatetime_end != null) {
            if (operatetime_end.length() == 10) {
                operatetime_end =operatetime_end + " 23:59:59";
            }
            Timestamp endValue = null;
            try {
                endValue = DateUtils.parseTimestamp(operatetime_end, "yyyy-MM-dd hh:mm:ss");
            } catch (ParseException e) {
                e.printStackTrace();
            }
            cq.le("createtime", endValue);
        }
        cq.add();
        betOrderService.getDataGridReturn(cq, true);
        TagUtil.datagrid(response, dataGrid);
    }
    
    @RequestMapping(params = "pointDetailDatagrid")
    public void pointDetailDatagrid(PointDetailEntity pointDetail,HttpServletRequest request,HttpServletResponse response,DataGrid dataGrid){
        pointDetail.setUsername(pointDetail.getUsername()==null?"":pointDetail.getUsername());
        CriteriaQuery cq = new CriteriaQuery(PointDetailEntity.class, dataGrid);
        HqlGenerateUtil.installHql(cq, pointDetail);
        cq.eq("type", "0");
        cq.add();
        String operatetime_begin = request.getParameter("createtime_begin");
        if(operatetime_begin != null) {
            Timestamp beginValue = null;
            try {
                beginValue = DateUtils.parseTimestamp(operatetime_begin, "yyyy-MM-dd");
            } catch (ParseException e) {
                e.printStackTrace();
            }
            cq.ge("createtime", beginValue);
        }
        String operatetime_end = request.getParameter("createtime_end");
        if(operatetime_end != null) {
            if (operatetime_end.length() == 10) {
                operatetime_end =operatetime_end + " 23:59:59";
            }
            Timestamp endValue = null;
            try {
                endValue = DateUtils.parseTimestamp(operatetime_end, "yyyy-MM-dd hh:mm:ss");
            } catch (ParseException e) {
                e.printStackTrace();
            }
            cq.le("createtime", endValue);
        }
        cq.add();
        betOrderService.getDataGridReturn(cq, true);
        TagUtil.datagrid(response, dataGrid);
    }
    
    @RequestMapping(params = "pointDetails")
    public String pointDetails(HttpServletRequest request) {
        return "bet/pointDetails";
    }
    
    @RequestMapping(params = "betOrdersAll")
    public String betOrdersAll(HttpServletRequest request) {
        return "bet/betOrdersAll";
    }
    
    @RequestMapping(params = "betOrders")
    public String betOrders(HttpServletRequest request) {
        return "bet/betOrders";
    }
    
    @RequestMapping(params = "onlineUsers")
    public String onlineUsers(HttpServletRequest request) {
        return "bet/onlineUsers";
    }
    @RequestMapping(params = "onlineUsersData")
    public void onlineUsersData(HttpServletRequest request,HttpServletResponse response) {
        Collection<Client> clients = ClientManager.getInstance().getAllClient();
        List<Map<String,Object>> users = new ArrayList<Map<String,Object>>();
        for (Client c : clients) {
            Map<String,Object> user = new HashMap<String,Object>();
            user.put("username", c.getUser().getUserName());
            user.put("realname", c.getUser().getRealName());
            user.put("id", c.getUser().getId());
            user.put("point", c.getUser().getPoint());
            users.add(user);
        }
        this.setListToJsonString(users.size(),"0","0",users,null, true, response);
    }
    @RequestMapping(params = "accountMemberDataGrid")
    public void accountMemberDataGrid(BetOrderEntity betOrder,HttpServletRequest request,HttpServletResponse response,DataGrid dataGrid){
        betOrder.setUsername(betOrder.getUsername()==null?"":betOrder.getUsername());
        String date = request.getParameter("operatetime_begin");
        String andStr = "";
        if((date!=null)&&(date!="")){
            andStr = "and createtime between '"+date+" 00:00:00' and '"+date+" 23:59:59'";
        }
        String sql ="select  u1.*,u2.realname from (select t.userid,t.username,SUM(amount) as amount,SUM(result) as result from t_bet_order t "
                + "where t.username like '%"+betOrder.getUsername()+"%' "+andStr
                + "GROUP BY t.username,t.userid   " +
                ")as u1  left  join t_s_base_user u2 on  u1.userid=u2.ID";
        PageList pg = betOrderService.getPageListBySql(new HqlQuery(QueryyingleEntity.class,
                sql, dataGrid), true);

        String totalSql = "select  IFNULL(SUM(amount),0) as amount,IFNULL(SUM(result),0) as result from t_bet_order t where t.username like '%"+betOrder.getUsername()+"%' "+andStr;
        Map<String,Object> totalMap = betOrderService.findOneForJdbc(totalSql);
        this.setListToJsonString(pg.getCount(), totalMap.get("amount")==null?"0":totalMap.get("amount").toString(),
                totalMap.get("result")==null?"0":totalMap.get("result").toString(),pg.getResultList(),null, true, response);
    }
    
    @RequestMapping(params = "accountMember")
    public String accountMember(HttpServletRequest request) {
        String totalSql = "select  IFNULL(SUM(amount),0) as amount,IFNULL(SUM(result),0) as result from t_bet_order";
        request.setAttribute("total", betOrderService.findOneForJdbc(totalSql)); 
        return "bet/memberAccount";
    }
    @RequestMapping(params ="phaseHistory")
    public String phaseHistory(HttpServletRequest request){
        request.setAttribute("phaseHistory", betOrderService.findForJdbc("SELECT * FROM T_PHASE_ANALYSE t order by t.phase desc"));
        return "website/main/phaseHistory";
    }
    
    
    
    
    @RequestMapping(params ="online")
    public String online(HttpServletRequest request){
       
        return "website/main/online";
    }
    
    
    
    @RequestMapping(params ="rule")
    public String rule(HttpServletRequest request){
       
        return "website/main/rule";
    }
    
    
    @RequestMapping(params ="ihavenothing")
    public String ihavenothing(HttpServletRequest request){
       
        return "website/main/ihavenothing";
    }
    
    
    
    @RequestMapping(params="getUserPoint")
    @ResponseBody
    public Map<String, Object> getUserPoint(HttpServletRequest request,String  userId){
    	TSUser user = systemService.get(TSUser.class, userId);
    	

    	Map<String, Object>  remap=new  HashMap<String, Object>();
    	
    	remap.put("wujiajun", user.getPoint());
    	
    	
    	
        return  remap ;
    }
    
    
    
    
}
