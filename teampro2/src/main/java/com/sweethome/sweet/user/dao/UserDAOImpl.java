package com.sweethome.sweet.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.sweethome.sweet.member.vo.MemberVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException{

		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.user.selectMyDetailInfo",member_id);
		return memberVO;
		
	}
	
	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {

		sqlSession.delete("mapper.user.memberDelete", memberVO);
		
	}
}
