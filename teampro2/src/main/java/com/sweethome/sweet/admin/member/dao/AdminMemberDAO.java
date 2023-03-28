package com.sweethome.sweet.admin.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.member.vo.MemberVO;


public interface AdminMemberDAO {
	 public List selectAllMemberList() throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public int deleteMember(String id) throws DataAccessException;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 public MemberVO selectMemberById(String id) throws DataAccessException;
	 
	 			// 회원 수정이다.
	 public int updateMember(MemberVO memberVO) throws DataAccessException;
	
	 			// 회원정지 하려고!
	 public int stopMember(MemberVO memberVO) throws DataAccessException;

}
