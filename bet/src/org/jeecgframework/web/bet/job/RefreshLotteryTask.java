/*
 * Copyright (c) 2005, 2016, EVECOM Technology Co.,Ltd. All rights reserved.
 * EVECOM PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package org.jeecgframework.web.bet.job;

import java.io.InputStream;
import java.io.InputStreamReader;
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
import org.jeecgframework.core.util.JSONHelper;
import org.jeecgframework.core.util.LogUtil;
import org.jeecgframework.web.bet.entity.BetPhaseEntity;
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

    @Autowired
    private BetPhaseServiceI betPhaseService;
    
    public static final Map<String, Object> currentLottery = new HashMap<String, Object>();
    public void run() {
        LogUtil.info("===================刷新开奖信息定时任务开始===================");
        try {
            HttpClient client = new DefaultHttpClient();  
            HttpGet get = new HttpGet(URL) ;
            HttpResponse response = client.execute(get);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {  
               InputStream is = response.getEntity().getContent();  
               JSONObject json = new JSONObject(new JSONTokener(new InputStreamReader(is,HTTP.UTF_8)));
               List<Map<String, Object>> data = JSONHelper.toList((JSONHelper.json2Map(json.toString()).get("data").toString()));
               String open_phase = data.get(0).get("open_phase").toString();
               String next_phase = data.get(0).get("next_phase").toString();
               if (currentLottery.keySet().size()==0||!next_phase.equals((String)currentLottery.get("next_phase"))
                       ||!open_phase.equals((String)currentLottery.get("open_phase"))) {
                   for (int i = 0; i < data.get(0).keySet().size(); i++) {
                       String key = (String) data.get(0).keySet().toArray()[i];
                       currentLottery.put(key, data.get(0).get(key));
                   }
                   currentLottery.put("IS_INSERT", "false");
               }
              
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
                   }
                   currentLottery.put("IS_INSERT", "true");
               }
            }  
        } catch (Exception e) {
            LogUtil.error(e.getMessage());
            e.printStackTrace();
        }
        LogUtil.info("===================刷新开奖信息定时任务结束===================");
    }
}
