package org.jeecgframework.web.bet.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.web.bet.service.BetPhaseServiceI;

@Service("betPhaseService")
@Transactional
public class BetPhaseServiceImpl extends CommonServiceImpl implements BetPhaseServiceI {
	
}