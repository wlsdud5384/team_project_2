package com.sweethome.sweet.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sweethome.sweet.goods.dao.GoodsDAO;
import com.sweethome.sweet.goods.vo.GoodsVO;

@Service("goodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDAO goodsDAO;
	
	
	public GoodsVO goodsDetail(int _goods_id) throws Exception {
	    return goodsDAO.selectGoodsDetail(_goods_id);
	}

	
	
	
}

