package com.sweethome.sweet.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.member.vo.MemberVO;


public interface MemberDAO {
	 public List selectAllMemberList() throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public int deleteMember(String id) throws DataAccessException;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 public MemberVO selectMemberById(String id) throws DataAccessException;
	 public int updateMember(MemberVO memberVO) throws DataAccessException;
	 public List selectAllGoodsList() throws DataAccessException;
	 public String selectOverlappedID(String id) throws DataAccessException;

}
