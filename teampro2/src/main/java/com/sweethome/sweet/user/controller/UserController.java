package com.sweethome.sweet.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.member.vo.MemberVO;

public interface UserController {
	
	public ModelAndView userMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView userDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public ModelAndView watchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView userContract(HttpServletRequest request, HttpServletResponse response) throws Exception;
}


