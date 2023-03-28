package com.sweethome.sweet.admin.member.controller;

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

import com.sweethome.sweet.admin.member.service.AdminMemberService;
import com.sweethome.sweet.member.vo.MemberVO;




@Controller("adminMemberController")
//@EnableAspectJAutoProxy
public class AdminMemberControllerImpl   implements AdminMemberController {
	@Autowired
	private AdminMemberService adminMemberService;
	@Autowired
	private MemberVO memberVO ;
	
	
	@Override				// 관리자 회원관리 회원 목록들 listMembers.do 하면여기로 
	@RequestMapping(value="/admin/listMembers.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String)request.getAttribute("viewName");
		List membersList = adminMemberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}

	@Override
	@RequestMapping(value="/admin/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		int result = 0;
		result = adminMemberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/admin/listMembers.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/admin/removeMember.do" ,method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		adminMemberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/admin/listMembers.do");
		return mav;
	}
	/*
	@RequestMapping(value = { "/member/loginForm.do", "/member/memberForm.do" }, method =  RequestMethod.GET)
	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	*/
	
	@Override
	@RequestMapping(value = "/admin/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	memberVO = adminMemberService.login(member);
	if(memberVO != null) {
	    HttpSession session = request.getSession();
	    session.setAttribute("member", memberVO);
	    session.setAttribute("isLogOn", true);
	    //mav.setViewName("redirect:/member/listMembers.do");
	    String action = (String)session.getAttribute("action");
	    session.removeAttribute("action");
	    if(action!= null) {
	       mav.setViewName("redirect:"+action);
	    }else {
	       mav.setViewName("redirect:/main.do");	
	    }

	}else {
	   rAttr.addAttribute("result","loginFailed");
	   mav.setViewName("redirect:/member/loginForm.do");
	}
	return mav;
	}
	
	@Override	 // 회원수정 페이지 로 오게되면 여기 실행 modMember.do 여기
	@RequestMapping(value="/admin/modMember.do", method=RequestMethod.GET)
	public ModelAndView modMember(@RequestParam("id") String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("Call modMember-method of control");
		request.setCharacterEncoding("utf-8");
	    String viewName = (String)request.getAttribute("viewName");
		System.out.println("viewName : "+viewName);
		MemberVO memberVO = adminMemberService.modMember(member_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",memberVO);
		mav.setViewName(viewName);
		return mav;	
	}

	@Override
	@RequestMapping(value = "/admin/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}	

	@RequestMapping(value = "/admin/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
							  @RequestParam(value= "action", required=false) String action,
						       HttpServletRequest request, 
						       HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);  
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}
	

	@Override				// 회원 수정을 위해서 여기를 들린다. 
	@RequestMapping(value="/admin/updateMember.do", method = RequestMethod.POST)
	public ModelAndView updateMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response)throws Exception{
		System.out.println("Call updateMember-method of control");
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = adminMemberService.updateMember(member);
		ModelAndView mav = new ModelAndView("redirect:/admin/listMembers.do");
		return mav;
	}
	
	// 여기는 회원정지 하기 위함 회원 정지 누를시 여기로 오게된다. .do 실행되면
	@Override
	@RequestMapping(value="/admin/stopMember.do", method = RequestMethod.POST)
	public ModelAndView stopMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response)throws Exception {
		System.out.println("여기 스탑 멤버 컨트롤 이게 보이면 여기까지는 오는거다. stopMember-method of control");
		request.setCharacterEncoding("utf-8");
		member.setStatus("정지");		// 컨트롤러 실행되면 memberVO의 Status가 저걸로 정지 가 저장됨
		int result = 0;
		result = adminMemberService.stopMember(member);
		ModelAndView mav = new ModelAndView("redirect:/admin/listMembers.do"); //여기 페이지로 이동된다.
		return mav;
	}
	

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}


}
