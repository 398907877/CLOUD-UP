/*
 * Copyright (c) 2005, 2016, EVECOM Technology Co.,Ltd. All rights reserved.
 * EVECOM PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 */
package org.jeecgframework.web.bet.job;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.jeecgframework.core.util.JSONHelper;
import org.jeecgframework.core.util.LogUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.web.bet.entity.BetOrderEntity;
import org.jeecgframework.web.bet.entity.BetPhaseEntity;
import org.jeecgframework.web.bet.entity.PointDetailEntity;
import org.jeecgframework.web.bet.service.BetOrderServiceI;
import org.jeecgframework.web.system.manager.ClientManager;
import org.jeecgframework.web.system.pojo.base.Client;
import org.jeecgframework.web.system.pojo.base.TSUser;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 描述
 * @author John Zhang
 * @version 1.0
 * @created 2016年12月16日 上午9:04:18
 */
@Service("orderAccountTask")
public class OrderAccountTask {
    @Autowired
    private BetOrderServiceI betOrderSerivce;
    
    public void run() {
        LogUtil.info("===================注单结算定时任务开始===================");
        try {
            betOrderSerivce.betAccount();
        } catch (Exception e) {
            LogUtil.error(e.getMessage());
            e.printStackTrace();
        }
        LogUtil.info("===================注单结算定时任务结束===================");
    }
}
