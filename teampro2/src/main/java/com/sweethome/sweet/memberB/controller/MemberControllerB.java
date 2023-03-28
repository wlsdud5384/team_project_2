package com.sweethome.sweet.memberB.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.member.vo.MemberVO;
import com.sweethome.sweet.memberB.vo.MemberVOB;


public interface MemberControllerB {
	public ModelAndView loginB(@ModelAttribute("memberB") MemberVOB memberB,RedirectAttributes rAttr,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logoutB(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView modMemberB(@RequestParam("bp_id") String bp_id, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView updateMemberB(@ModelAttribute("memberB") MemberVOB memberVOB, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView listContractB(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// 사업자 회원가입 위해서 add 추가해준거다 인터페이스에
//	public ResponseEntity addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}