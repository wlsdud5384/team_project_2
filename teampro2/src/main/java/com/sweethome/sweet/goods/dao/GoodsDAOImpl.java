package com.sweethome.sweet.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.sweethome.sweet.goods.vo.GoodsVO;

@Repository("goodsDAO")
public class GoodsDAOImpl  implements GoodsDAO{
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public GoodsVO selectGoodsDetail(int goods_id) throws DataAccessException{
	    GoodsVO goodsVO = (GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail",goods_id);
	    return goodsVO;
	}

	
	
}

