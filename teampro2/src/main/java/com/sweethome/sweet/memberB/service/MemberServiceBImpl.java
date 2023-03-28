package com.sweethome.sweet.memberB.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sweethome.sweet.memberB.dao.MemberDAOB;
import com.sweethome.sweet.memberB.vo.MemberVOB;
import com.sweethome.sweet.memberB.vo.ContractVO;

@Service("memberServiceB")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceBImpl implements MemberServiceB {
	@Autowired
	private MemberDAOB memberDAOB;

	@Override
	public MemberVOB loginB(MemberVOB memberVOB) throws Exception{
		return memberDAOB.loginByIdB(memberVOB);
	}
	
	@Override
	public MemberVOB modMemberB(String bp_id) throws DataAccessException {
		MemberVOB memberVOB = new MemberVOB();
		memberVOB = memberDAOB.selectMemberByIdB(bp_id);
		return memberVOB;
	}
	
	@Override
	public int updateMemberB(MemberVOB memberB)throws DataAccessException{
		return memberDAOB.updateMemberB(memberB);
	}
	
	@Override
	public List listContractB() throws DataAccessException {
		List contractListB = null;
		contractListB = memberDAOB.selectContractByIdB();
		return contractListB;
	}
	
}
