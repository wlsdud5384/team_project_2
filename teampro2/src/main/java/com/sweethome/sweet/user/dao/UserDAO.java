package com.sweethome.sweet.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.member.vo.MemberVO;

public interface UserDAO {
	
	//ȸ����ȸ
	public MemberVO selectMyDetailInfo(String member_id)throws Exception;
	//ȸ��Ż��
		public void memberDelete(MemberVO memberVO)throws Exception;
}
