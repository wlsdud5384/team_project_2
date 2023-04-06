package com.sweethome.sweet.memberB.dao;

import java.io.IOException;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.memberB.vo.MemberVOB;
import com.sweethome.sweet.member.vo.MemberVO;
import com.sweethome.sweet.memberB.vo.ContractVO;


public interface MemberDAOB {
	 public int insertMemberB(MemberVOB memberVOB) throws DataAccessException ;
	 public String selectOverlappedIDB(String bp_id) throws DataAccessException;
	 
	 public MemberVOB loginByIdB(MemberVOB memberVOB) throws DataAccessException;
	 
	 public MemberVOB selectMemberByIdB(String bp_id) throws DataAccessException;
	 public int updateMemberB(MemberVOB memberVOB) throws DataAccessException;
	 
	 public List selectContractByIdB() throws DataAccessException;

	 public void memberDeleteB(MemberVOB memberVOB) throws Exception;
	 
	 public MemberVOB selectMemberB(String email) throws IOException;
	 public int pwUpdate(MemberVOB vo) throws IOException;
}
