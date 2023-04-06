package com.sweethome.sweet.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.goods.vo.GoodsVO;

public interface GoodsDAO {
	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException;
}

