package org.jeecgframework.web.system.service.impl;

import java.math.BigDecimal;
import java.util.Date;

import org.jeecgframework.web.bet.entity.BetOrderEntity;
import org.jeecgframework.web.bet.entity.PointDetailEntity;
import org.jeecgframework.web.system.pojo.base.TSRoleUser;
import org.jeecgframework.web.system.pojo.base.TSType;
import org.jeecgframework.web.system.pojo.base.TSUser;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.web.system.service.UserService;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.ResourceUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 
 * @author  张代浩
 *
 */
@Service("userService")
@Transactional
public class UserServiceImpl extends CommonServiceImpl implements UserService {

    @Autowired
    private SystemService systemService;
    
	public TSUser checkUserExits(TSUser user){
		return this.commonDao.getUserByUserIdAndUserNameExits(user);
	}
	public String getUserRole(TSUser user){
		return this.commonDao.getUserRole(user);
	}
	
	public void pwdInit(TSUser user,String newPwd) {
			this.commonDao.pwdInit(user,newPwd);
	}
	
	public int getUsersOfThisRole(String id) {
		Criteria criteria = getSession().createCriteria(TSRoleUser.class);
		criteria.add(Restrictions.eq("TSRole.id", id));
		int allCounts = ((Long) criteria.setProjection(
				Projections.rowCount()).uniqueResult()).intValue();
		return allCounts;
	}
    /**
     * 描述
     * @author John Zhang
     * @created 2016年12月16日 下午9:44:19
     * @param point
     * @see org.jeecgframework.web.system.service.UserService#savePoint(java.math.BigDecimal)
     */
    @Override
    public void savePoint(BigDecimal point,TSUser user) {
        PointDetailEntity pointDetail = new PointDetailEntity();
        BigDecimal amount = point.subtract(user.getPoint()==null?new BigDecimal(0):user.getPoint());
        pointDetail.setAmount(amount);
        pointDetail.setCreatetime(new Date());
        pointDetail.setCreateuser(ResourceUtil.getSessionUserName().getUserName());
        pointDetail.setCreateuserid(ResourceUtil.getSessionUserName().getId());
        pointDetail.setUserid(user.getId());
        pointDetail.setType("0");//0 充值 或者提现
        BetOrderEntity betOrder = new BetOrderEntity();
        betOrder.setId(0);
        pointDetail.setBetOrder(betOrder);
        pointDetail.setRealname(user.getRealName());
        pointDetail.setUsername(user.getUserName());
        this.saveOrUpdate(pointDetail);
        TSType type= systemService.getType("剩余额度", "10000", 
                systemService.getTypeGroup("pointLimit", "上下分限制"));
        BigDecimal limit = new BigDecimal(type.getTypename()).subtract(amount);
        BigDecimal maxPoint = new BigDecimal(systemService.getType("最大值", "10000", 
                systemService.getTypeGroup("pointLimit", "上下分限制")).getTypename());
        if(limit.compareTo(maxPoint) == 1){
            limit = maxPoint;
        }
        type.setTypename(limit.toString());
        this.saveOrUpdate(type);
        user.setPoint(point);
        this.saveOrUpdate(user);
    }
	
}
