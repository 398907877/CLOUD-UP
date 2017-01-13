package org.jeecgframework.web.bet.service;

import java.util.List;
import java.util.Map;

import org.jeecgframework.core.common.service.CommonService;
import org.jeecgframework.web.bet.entity.BetOrderEntity;
import org.jeecgframework.web.bet.entity.BetPhaseEntity;

public interface BetOrderServiceI extends CommonService{
    /**
     * 描述 用户下注
     * @author John Zhang
     * @created 2016年12月15日 下午8:19:53
     * @param betOrders
     */
    public int saveBetOrders(List<BetOrderEntity> betOrders,Map<String,Object> lottery);
    /**
     * 结算注单
     * 描述
     * @author John Zhang
     * @created 2017年1月13日 下午10:43:38
     */
    public void betAccount();
    
    /**
     * 获取玩法押注类型
     * 描述
     * @author John Zhang
     * @created 2017年1月13日 下午10:43:10
     * @param game
     * @return
     */
    public Map<String, Object> getGameList(String game);
    

    /**
     * 手动保存注单
     * 描述
     * @author John Zhang
     * @created 2017年1月13日 下午10:43:00
     * @param berOrder
     * @return
     */
    public int saveOrder(BetOrderEntity berOrder);
    
    /**
     * 描述 保存结果
     * @author John Zhang
     * @created 2017年1月13日 下午10:42:44
     * @param phase
     * @return
     */
    public int saveResult(BetPhaseEntity phase);
}
