package com.sweethome.sweet.memberB.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.memberB.vo.*;
import com.sweethome.sweet.memberB.order.vo.*;

public interface OrderDAOB {
	public List selectMyOrderInfoB(int goodscon_id) throws DataAccessException;
}
