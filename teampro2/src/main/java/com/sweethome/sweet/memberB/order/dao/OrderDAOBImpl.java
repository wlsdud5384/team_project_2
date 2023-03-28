package com.sweethome.sweet.memberB.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.sweethome.sweet.memberB.vo.*;
import com.sweethome.sweet.memberB.order.vo.*;

@Repository("orderDAOB")
public class OrderDAOBImpl implements OrderDAOB {
	@Autowired
	private SqlSession sqlSession;
	
	public List selectMyOrderInfoB(int goodscon_id) throws DataAccessException{
		List myOrderListB=(List)sqlSession.selectList("mapper.memberB.selectMyOrderInfoB", goodscon_id);
		return myOrderListB;
	}
}
