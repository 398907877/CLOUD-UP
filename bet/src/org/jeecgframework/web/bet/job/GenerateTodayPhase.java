/*
 * Copyright (c) 2005, 2017, EVECOM Technology Co.,Ltd. All rights reserved.
 * EVECOM PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package org.jeecgframework.web.bet.job;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

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
import org.jeecgframework.web.bet.service.BetPhaseServiceI;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 描述
 * 
 * @author John Zhang
 * @version 1.0
 * @created 2017年1月4日 下午8:56:42
 */
@Service("generateTodayPhase")
public class GenerateTodayPhase {
    public static final String START_DATE = "2017-01-01";
    public static final Integer START_PHASE = 595162;
    
    public static final String START_TIME = "09:02:30";

    public static final String END_TIME = "23:57:30";
    
    public static final String URL = "http://c.apiplus.net/daily.do?token=e9e0077e87038c71&code=bjpk10&format=json&date=";

    @Autowired
    private BetPhaseServiceI betPhaseService;

    public void run() {
        LogUtil.info("===================自动生成今天所有开奖信息任务开始===================");
        try {
            HttpClient client = new DefaultHttpClient();
            String curDate = DateUtils.formatDate("yyyy-MM-dd ");
            //Date lastDate = org.apache.commons.lang3.time.DateUtils.addDays(new Date(), -1);
            //HttpGet get = new HttpGet(URL+DateUtils.formatDate(lastDate,"yyyy-MM-dd"));
            //HttpResponse response = client.execute(get);
            //if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                //InputStream is = response.getEntity().getContent();
                //JSONObject json = new JSONObject(new JSONTokener(new InputStreamReader(is, HTTP.UTF_8)));
                //List<Map<String, Object>> data = JSONHelper.toList((JSONHelper.json2Map(json.toString()).get("data")
                        //.toString()));
                //String last_phase = data.get(0).get("expect").toString();
                GregorianCalendar curC  = new GregorianCalendar();
                curC.setTime(DateUtils.str2Date(curDate, new SimpleDateFormat("yyyy-MM-dd ")));
                GregorianCalendar startC  = new GregorianCalendar();
                startC.setTime(DateUtils.str2Date(START_DATE, new SimpleDateFormat("yyyy-MM-dd")));
                int diffDay = DateUtils.dateDiff('d', curC, startC);
                int lastPhase = START_PHASE+diffDay*179-1;
                Date date = DateUtils.str2Date(curDate+START_TIME, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
                for (int i = 1; i <= 179; i++) {
                    int curPhase = lastPhase + i;
                    List<BetPhaseEntity> phases = betPhaseService.findByProperty(BetPhaseEntity.class, "phase",curPhase);
                    if(phases.size()>0){
                        continue;
                    }
                    Date opentime = org.apache.commons.lang3.time.DateUtils.addMinutes(date, i * 5);
                    String opentimeStr = DateUtils.formatDate(opentime, "yyyy-MM-dd HH:mm:ss");
                    BetPhaseEntity phase = new BetPhaseEntity();
                    phase.setCreatetime(new Date());
                    phase.setOpentime(opentimeStr);
                    phase.setPhase(curPhase);
                    betPhaseService.save(phase);
                }
            //}
        } catch (Exception e) {
            LogUtil.error(e.getMessage());
            e.printStackTrace();
        }
        LogUtil.info("===================自动生成今天所有开奖信息任务结束===================");
    }
}
