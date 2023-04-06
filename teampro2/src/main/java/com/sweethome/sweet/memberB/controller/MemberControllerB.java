package com.sweethome.sweet.memberB.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.member.vo.MemberVO;
import com.sweethome.sweet.memberB.vo.MemberVOB;


public interface MemberControllerB {
	public ResponseEntity addMemberB(@ModelAttribute("info") MemberVOB memberVOB,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlappedB(String bp_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView loginB(@ModelAttribute("memberB") MemberVOB memberB,RedirectAttributes rAttr,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logoutB(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView modMemberB(@RequestParam("bp_id") String bp_id, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView updateMemberB(@ModelAttribute("memberB") MemberVOB memberVOB, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView listContractB(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String memberDeleteB(MemberVOB memberVOB, HttpSession session, RedirectAttributes rttr) throws Exception;
	
	public String pwFindB() throws Exception;
	public ModelAndView sendMailB(HttpSession session, 
			@RequestParam("bp_id") String bp_id,
			@ModelAttribute("email") String email,
            HttpServletRequest request, 
            HttpServletResponse response) throws IOException;
	public ModelAndView checkEmailB(HttpSession session, 
	        @RequestParam(value="email_injeung") String email_injeung) throws IOException;
	public String pwNewB(MemberVOB vo, @RequestParam("pw_new_confirm") String pwNewConfirm, HttpSession session, Model model) throws IOException;
}