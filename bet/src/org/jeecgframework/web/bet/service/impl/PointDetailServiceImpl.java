package org.jeecgframework.web.bet.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.web.bet.service.PointDetailServiceI;

@Service("pointDetailService")
@Transactional
public class PointDetailServiceImpl extends CommonServiceImpl implements PointDetailServiceI {
	
}