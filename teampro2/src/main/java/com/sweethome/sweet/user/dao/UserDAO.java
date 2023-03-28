package com.sweethome.sweet.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.member.vo.MemberVO;

public interface UserDAO {
	
	//È¸¿øÁ¶È¸
	public MemberVO selectMyDetailInfo(String member_id)throws Exception;
	//È¸¿øÅ»Åð
		public void memberDelete(MemberVO memberVO)throws Exception;
}
