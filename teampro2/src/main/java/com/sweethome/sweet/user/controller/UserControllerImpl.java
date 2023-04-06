package com.sweethome.sweet.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.user.service.UserService;
import com.sweethome.sweet.member.service.MemberService;
import com.sweethome.sweet.member.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller("userController")
@RequestMapping(value="/user")
public class UserControllerImpl implements UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO ;
   
	@Override
	@RequestMapping(value = "/userMain.do", method = RequestMethod.GET)
	public ModelAndView userMain(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/userDetailInfo.do", method = RequestMethod.GET)
	public ModelAndView userDetailInfo(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/userContract.do", method = RequestMethod.GET)
	public ModelAndView userContract(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/watchList.do", method = RequestMethod.GET)
	public ModelAndView watchList(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//회원탈퇴페이지 get
		@RequestMapping(value="/memberDeleteView.do", method = RequestMethod.GET)
		public String deleteUser() throws Exception{
		return "/user/memberDeleteView";
		}
		
				
	//회원탈퇴 post
	@RequestMapping(value="/memberDelete.do", method = RequestMethod.POST)
	public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception{
					
		MemberVO member = (MemberVO) session.getAttribute("member");
					
		// ��
		String currentPw = member.getMember_pw();
		// ��
		String userInputPw = memberVO.getMember_pw();
					
		if(!(currentPw.equals(userInputPw))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/user/memberDeleteView.do";
			}
			
				userService.memberDelete(memberVO);
				session.invalidate();
				return "redirect:/main.do";
			}

}
