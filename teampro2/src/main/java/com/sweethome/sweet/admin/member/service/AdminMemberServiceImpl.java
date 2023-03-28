package com.sweethome.sweet.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sweethome.sweet.admin.member.dao.AdminMemberDAO;
import com.sweethome.sweet.member.vo.MemberVO;



@Service("adminMemberService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;

	@Override		// 목록이다
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = adminMemberDAO.selectAllMemberList();
		return membersList;
	}
	
	

	@Override		//수정이다
	public MemberVO modMember(String member_id) throws DataAccessException {
		MemberVO memberVO = new MemberVO();
		memberVO = adminMemberDAO.selectMemberById(member_id);
		return memberVO;
	}



	@Override			//추가다
	public int addMember(MemberVO member) throws DataAccessException {
		return adminMemberDAO.insertMember(member);
	}

	@Override			// 지우는거다
	public int removeMember(String id) throws DataAccessException {
		return adminMemberDAO.deleteMember(id);
	}
	
	@Override		// 로그인
	public MemberVO login(MemberVO memberVO) throws Exception{
		return adminMemberDAO.loginById(memberVO);
	}



	@Override				// 업데이트 멤버 수정 하려고
	public int updateMember(MemberVO member)throws DataAccessException{
		return adminMemberDAO.updateMember(member);
	}
	
	@Override
	public int stopMember(MemberVO member) throws DataAccessException {
		return adminMemberDAO.stopMember(member);
	}
	

}
