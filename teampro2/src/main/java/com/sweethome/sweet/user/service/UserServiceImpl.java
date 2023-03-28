package com.sweethome.sweet.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.sweethome.sweet.member.dao.MemberDAO;
import com.sweethome.sweet.member.vo.MemberVO;
import com.sweethome.sweet.user.dao.UserDAO;
import com.sweethome.sweet.user.vo.UserVO;

@Service("userService")
@Transactional(propagation=Propagation.REQUIRED)
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
		
	@Override
	public MemberVO userDetailInfo(String member_id) throws Exception{
		return userDAO.selectMyDetailInfo(member_id);
	}
		
	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		userDAO.memberDelete(memberVO);
	}
}
	