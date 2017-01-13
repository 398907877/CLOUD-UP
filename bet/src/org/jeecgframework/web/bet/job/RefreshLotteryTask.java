/*
 * Copyright (c) 2005, 2016, EVECOM Technology Co.,Ltd. All rights reserved.
 * EVECOM PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package org.jeecgframework.web.bet.job;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.jeecgframework.core.util.DateUtils;
import org.jeecgframework.core.util.JSONHelper;
import org.jeecgframework.core.util.LogUtil;
import org.jeecgframework.web.bet.entity.BetPhaseEntity;
import org.jeecgframework.web.bet.entity.PhaseAnalyseEntity;
import org.jeecgframework.web.bet.service.BetOrderServiceI;
import org.jeecgframework.web.bet.service.BetPhaseServiceI;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 描述
 * @author John Zhang
 * @version 1.0
 * @created 2016年12月15日 上午12:02:44
 */
@Service("refreshLotteryTask")
public class RefreshLotteryTask {
    public static final String URL = "http://c.apiplus.net/curly.do?token=e9e0077e87038c71&code=bjpk10&format=json";
    
    public static final String URL_NEWLY = "http://c.apiplus.net/newly.do?token=e9e0077e87038c71&code=bjpk10&format=json&rows=20";

    @Autowired
    private BetPhaseServiceI betPhaseService;
    
    @Autowired
    private BetOrderServiceI betOrderSerivce;
    
    public static final Map<String, Object> currentLottery = new HashMap<String, Object>();
    /*public void run() {
        LogUtil.info("===================刷新开奖信息定时任务开始===================");
        try {
            HttpClient client = new DefaultHttpClient();  
            HttpGet get = new HttpGet(URL) ;
            HttpResponse response = client.execute(get);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {  
               InputStream is = response.getEntity().getContent();  
               JSONObject json = new JSONObject(new JSONTokener(new InputStreamReader(is,HTTP.UTF_8)));
               List<Map<String, Object>> data = JSONHelper.toList((JSONHelper.json2Map(json.toString()).get("data").toString()));
               //String open_phase = data.get(0).get("open_phase").toString();
               //String next_phase = data.get(0).get("next_phase").toString();
               //if (currentLottery.keySet().size()==0||!next_phase.equals((String)currentLottery.get("next_phase"))
                     //  ||!open_phase.equals((String)currentLottery.get("open_phase"))) {
                   for (int i = 0; i < data.get(0).keySet().size(); i++) {
                       String key = (String) data.get(0).keySet().toArray()[i];
                       currentLottery.put(key, data.get(0).get(key));
                   }
                   //currentLottery.put("IS_INSERT", "false");
               //}
              
               if("false".equals(currentLottery.get("IS_INSERT").toString())){
                   List<BetPhaseEntity> phases = betPhaseService.findByProperty(BetPhaseEntity.class, "phase", 
                           Integer.valueOf(currentLottery.get("open_phase").toString()));
                   if(phases.size() == 0){
                       BetPhaseEntity phase = new BetPhaseEntity();
                       phase.setCreatetime(new Date());
                       phase.setOpentime(currentLottery.get("open_time").toString());
                       phase.setResult(currentLottery.get("open_result").toString());
                       phase.setPhase(Integer.valueOf(currentLottery.get("open_phase").toString()));
                       betPhaseService.save(phase);
                       analysePhase(phase);
                   }
                   //currentLottery.put("IS_INSERT", "true");
               }
            }  
        } catch (Exception e) {
            LogUtil.error(e.getMessage());
            e.printStackTrace();
        }
        LogUtil.info("===================刷新开奖信息定时任务结束===================");
    }*/
    
    
    public void run() {
        LogUtil.info("===================刷新开奖信息定时任务开始===================");
        try {
            HttpClient client = new DefaultHttpClient();  
            HttpGet get = new HttpGet(URL_NEWLY) ;
            HttpResponse response = client.execute(get);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {  
               InputStream is = response.getEntity().getContent();  
               JSONObject json = new JSONObject(new JSONTokener(new InputStreamReader(is,HTTP.UTF_8)));
               List<Map<String, Object>> data = JSONHelper.toList((JSONHelper.json2Map(json.toString()).get("data").toString()));
               
               for (Map<String, Object> map : data) {
                   List<BetPhaseEntity> phases = betPhaseService.findByProperty(BetPhaseEntity.class, "phase",
                           Integer.valueOf(map.get("expect").toString()));
                   BetPhaseEntity phase = null;
                   boolean isOpen = false;
                   if (phases.size() == 0) {
                       phase = new BetPhaseEntity();
                       phase.setCreatetime(new Date());
                       phase.setOpentime(map.get("opentime").toString());
                       phase.setResult(map.get("opencode").toString());
                       phase.setLoadtime(map.get("opentime").toString());
                       phase.setPhase(Integer.valueOf(map.get("expect").toString()));
                       betPhaseService.save(phase);
                   }else{
                       phase = phases.get(0);
                       if(phase.getResult() == null){
                           phase.setResult(map.get("opencode").toString());
                           phase.setLoadtime(map.get("opentime").toString());
                           betPhaseService.saveOrUpdate(phase);
                       }else{
                           isOpen = true;
                       }
                   }
                   if(!isOpen){
                       analysePhase(phase);
                       betOrderSerivce.betAccount();
                   }
               }

            }  
        } catch (Exception e) {
            LogUtil.error(e.getMessage());
            e.printStackTrace();
        }
        LogUtil.info("===================刷新开奖信息定时任务结束===================");
    }
    
    public void analysePhase(BetPhaseEntity phase){
        PhaseAnalyseEntity pa = new PhaseAnalyseEntity();
        pa.setPhase(phase.getPhase());
        pa.setOpentime(DateUtils.str2Date(phase.getOpentime(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
        String[] result = phase.getResult().split(",");
        pa.setRanking1(Integer.valueOf(result[0]).toString());
        pa.setRanking2(Integer.valueOf(result[1]).toString());
        pa.setRanking3(Integer.valueOf(result[2]).toString());
        pa.setRanking4(Integer.valueOf(result[3]).toString());
        pa.setRanking5(Integer.valueOf(result[4]).toString());
        pa.setRanking6(Integer.valueOf(result[5]).toString());
        pa.setRanking7(Integer.valueOf(result[6]).toString());
        pa.setRanking8(Integer.valueOf(result[7]).toString());
        pa.setRanking9(Integer.valueOf(result[8]).toString());
        pa.setRanking10(Integer.valueOf(result[9]).toString());
        int gyh = Integer.valueOf(result[0])+Integer.valueOf(result[1]);
        pa.setTop2(String.valueOf(gyh));
        String top2d = gyh%2==0?"双":"单";
        String top2b = gyh>=12?"大":"小";
        pa.setTop2b(top2b);
        pa.setTop2d(top2d);
        String ranking1lh = Integer.valueOf(result[0])>Integer.valueOf(result[9])?"龙":"虎";
        String ranking2lh = Integer.valueOf(result[1])>Integer.valueOf(result[8])?"龙":"虎";
        String ranking3lh = Integer.valueOf(result[2])>Integer.valueOf(result[7])?"龙":"虎";
        String ranking4lh = Integer.valueOf(result[3])>Integer.valueOf(result[6])?"龙":"虎";
        String ranking5lh = Integer.valueOf(result[4])>Integer.valueOf(result[5])?"龙":"虎";
        pa.setRanking1lh(ranking1lh);
        pa.setRanking2lh(ranking2lh);
        pa.setRanking3lh(ranking3lh);
        pa.setRanking4lh(ranking4lh);
        pa.setRanking5lh(ranking5lh);
        List<PhaseAnalyseEntity> pas =betPhaseService.findByProperty(PhaseAnalyseEntity.class, "phase", phase.getPhase());
        if(pas.size()>0){
            
        }else{
            betPhaseService.saveOrUpdate(pa);
        }
    }
}
