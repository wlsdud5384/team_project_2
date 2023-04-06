package com.sweethome.sweet.memberB.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sweethome.sweet.member.vo.MemberVO;
import com.sweethome.sweet.memberB.dao.MemberDAOB;
import com.sweethome.sweet.memberB.vo.MemberVOB;
import com.sweethome.sweet.memberB.vo.ContractVO;

@Service("memberServiceB")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceBImpl implements MemberServiceB {
	@Autowired
	private MemberDAOB memberDAOB;

	@Override
	public int addMemberB(MemberVOB memberB) throws DataAccessException {
		return memberDAOB.insertMemberB(memberB);
	}
	
	@Override
	public String overlappedB(String bp_id) {
		return memberDAOB.selectOverlappedIDB(bp_id);
	}
	
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
	
	@Override
	public void memberDeleteB(MemberVOB memberVOB) throws Exception {
		memberDAOB.memberDeleteB(memberVOB);
	}
	
	@Override
    public MemberVOB selectMemberB(String email) throws IOException {
        return memberDAOB.selectMemberB(email);
    }
	
	@Override
    public int pwUpdate(MemberVOB vo) throws IOException{
        return memberDAOB.pwUpdate(vo);
    }
}
