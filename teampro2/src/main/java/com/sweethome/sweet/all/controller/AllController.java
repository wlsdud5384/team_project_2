package com.sweethome.sweet.all.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.member.vo.MemberVO;

public interface AllController {
	public ModelAndView customerMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView noticeBoard(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
