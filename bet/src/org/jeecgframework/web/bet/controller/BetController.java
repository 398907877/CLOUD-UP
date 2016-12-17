/*
 * Copyright (c) 2005, 2016, EVECOM Technology Co.,Ltd. All rights reserved.
 * EVECOM PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package org.jeecgframework.web.bet.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.util.DateUtils;
import org.jeecgframework.core.util.JSONHelper;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.web.bet.entity.BetOrderEntity;
import org.jeecgframework.web.bet.job.RefreshLotteryTask;
import org.jeecgframework.web.bet.service.BetOrderServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
    public static final long FP_TIME = 40000;
    public static final long JG_TIME = 5*60*1000;
    @Autowired
    private BetOrderServiceI betOrderService;
    
    @RequestMapping(params="raceView")
    public String raceView(HttpServletRequest request){
        request.setAttribute("phaseInfo", getPhaseInfo());
        long kjTime = DateUtils.str2Date(RefreshLotteryTask.currentLottery.get("next_time").toString(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).getTime();
        long curTime = System.currentTimeMillis();
        if((kjTime-curTime)>6*60*1000){
            request.setAttribute("IS_STOP", "true");
        }
        return "website/main/race-view";
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
        Map<String,Object> currentLottery = RefreshLotteryTask.currentLottery;
        long kjTime = DateUtils.str2Date(currentLottery.get("next_time").toString(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).getTime();
        long curTime = System.currentTimeMillis();
        long difTime = 0;
        if(kjTime <= curTime){
            difTime = JG_TIME+kjTime-curTime;
            phaseInfo.put("nextPhase", Integer.parseInt(currentLottery.get("next_phase").toString())+1); 
        }else{
            difTime = kjTime - curTime;
            phaseInfo.put("nextPhase", currentLottery.get("next_phase"));
        }
        phaseInfo.put("openResult", currentLottery.get("open_result").toString().split(","));
        phaseInfo.put("openPhase", currentLottery.get("open_phase"));
        phaseInfo.put("kjTime", difTime);//距离开奖时间
        phaseInfo.put("fpTime", difTime - FP_TIME);//封盘时间
        return phaseInfo;
    }
    
    @RequestMapping(params="comfirmBetOrder")
    public String comfirmBetOrder(){
        return "website/main/comfirmBetOrder";
    }
    @RequestMapping(params="betOrder")
    @ResponseBody
    public AjaxJson betOrder(HttpServletRequest request){
        AjaxJson result = new AjaxJson();
        long kjTime = DateUtils.str2Date(RefreshLotteryTask.currentLottery.get("next_time").toString(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).getTime();
        if((kjTime-BetController.FP_TIME)<System.currentTimeMillis()){
            result.setMsg("该期已封盘！请重新投注");
            result.setSuccess(false);
        }
        List<BetOrderEntity> betOrders = JSONHelper.toList(JSONHelper.toJSONArray(request.getParameter("betList")), BetOrderEntity.class);
        try {
            int i = betOrderService.saveBetOrders(betOrders);
            if(i == 0){
                result.setMsg("投注成功!");
                result.setSuccess(true);
            }else if(i == 1){
                result.setMsg("注单中存在不属于本期的投注，请检查。");
                result.setSuccess(false);
            }else if(i==2){
                result.setMsg("您的积分不足，请返回重新投注！");
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
        request.setAttribute("betInfo", betOrderService.findForJdbc("SELECT sum(t.result) as result,sum(t.amount) as amount FROM T_BET_ORDER t where t.userid=?",
                ResourceUtil.getSessionUserName().getId()));
        request.setAttribute("betOrderList", betOrderService.findForJdbc("SELECT * FROM T_BET_ORDER t where t.userid=? order by t.createtime desc",
                ResourceUtil.getSessionUserName().getId()));
        return "website/main/myBetOrder";
    }
    
    @RequestMapping(params ="phaseHistory")
    public String phaseHistory(HttpServletRequest request){
        request.setAttribute("phaseHistory", betOrderService.findForJdbc("SELECT * FROM T_BET_PHASE t order by t.phase desc"));
        return "website/main/phaseHistory";
    }
    
    
    
    
    @RequestMapping(params ="online")
    public String online(HttpServletRequest request){
       
        return "website/main/online";
    }
    
    
    
}
