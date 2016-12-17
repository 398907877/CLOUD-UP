package org.jeecgframework.web.bet.service;

import java.util.List;

import org.jeecgframework.core.common.service.CommonService;
import org.jeecgframework.web.bet.entity.BetOrderEntity;

public interface BetOrderServiceI extends CommonService{
    /**
     * 描述
     * @author John Zhang
     * @created 2016年12月15日 下午8:19:53
     * @param betOrders
     */
    public int saveBetOrders(List<BetOrderEntity> betOrders);
    
    public void betAccount();
}
