/*package com.sweethome.sweet.memberB.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.sweethome.sweet.memberB.vo.MemberVOB;
import com.sweethome.sweet.memberB.order.vo.OrederVOB;
import com.sweethome.sweet.memberB.order.dao.OrderDAOB;

@Service("orderServiceB")
@Transactional(propagation=Propagation.REQUIRED)
public class OrderServiceBImpl implements OrderServiceB{
	@Autowired
	private OrderDAOB orderDAOB;
	
	public List findMyOrderInfoB(int goodscon_id) throws Exception{
		return OrderDAOB.selectMyOrderInfoB(goodscon_id);
	}
}*/
