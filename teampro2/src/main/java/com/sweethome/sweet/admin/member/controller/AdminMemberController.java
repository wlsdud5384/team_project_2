package com.sweethome.sweet.admin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.member.vo.MemberVO;


public interface AdminMemberController {
	
						// 회원목록
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
						// 추가 하는거
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
						//지우는거지뭐
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
						// 로그인
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
                              RedirectAttributes rAttr,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;
	
						// 로그아웃
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
						// 여기도 관리자가 수정 페이지 에서 id 갖고올라고
	public ModelAndView modMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
				// 여기 업뎃은 회원수정하려고
	public ModelAndView updateMember(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)throws Exception;
	
				// stop여기는 회원정지 시키려고~
	public ModelAndView stopMember(@ModelAttribute("info") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView dataview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	
	
}