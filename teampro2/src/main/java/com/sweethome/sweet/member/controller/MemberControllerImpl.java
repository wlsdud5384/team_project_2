package com.sweethome.sweet.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.sweet.member.service.MemberService;
import com.sweethome.sweet.member.vo.KakaoDTO;
import com.sweethome.sweet.member.vo.MemberVO;





@Controller("memberController")
//@EnableAspectJAutoProxy
public class MemberControllerImpl   implements MemberController {
	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberVO memberVO ;
	
	@Autowired
	private KakaoDTO kakaoDTO ;
	
	@Autowired
	private HttpSession session;

	
	
	@Override
	@RequestMapping(value = { "/","/main.do"}, method = RequestMethod.GET)
	public Map<String, Object> main(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("html/text;charset=utf-8");
	    String viewName = (String) request.getAttribute("viewName");
	    Map<String, Object> model = new HashMap<String, Object>();
	    List goodsList = memberService.listGoods();
	    model.put("goodsList", goodsList);
	    model.put("viewName", viewName);
	    return model;
	}
	
	
	@Override			// 이건 관리자가 회원 조회할때 하는 .do 다
	@RequestMapping(value="/member/listMembers.do" ,method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String viewName = (String)request.getAttribute("viewName");
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}

	@Override			// 회원가입할때, 혹은 수정? 인가 여튼 뭐 그럼
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("member") MemberVO memberVO,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			memberService.addMember(memberVO);
			message = "<script>";
			
			message +=" alert('회원가입을 마쳤습니다. 로그인창으로 이동합니다.');";
			message += "location.href='"+request.getContextPath()+"/member/loginForm.do';";
			message += "</script>";
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류 발생 다시 시도해 주세요');";
			message += "location.href='" + request.getContextPath()+"/member/memberForm.do';";
			message += "</script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
		
//		int result = 0;
//		result = memberService.addMember(memberVO);
		
		//ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
	
	}
	
	
	@Override				// 아이디 중복체크 하는부분 컨트롤러 .do 여기로 오게된다.
	@RequestMapping(value="/member/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
		
	}
	
	
	
	
	
	
	@Override
	@RequestMapping(value="/member/removeMember.do" ,method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
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
	
	@Override				// 로그인 .do 해서 여기로 오게됨
	@RequestMapping(value = "/member/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	memberVO = memberService.login(member);
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
	
	@Override
	@RequestMapping(value="/member/modMember.do", method=RequestMethod.GET)
	public ModelAndView modMember(@RequestParam("id") String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("Call modMember-method of control");
		request.setCharacterEncoding("utf-8");
	    String viewName = (String)request.getAttribute("viewName");
		System.out.println("viewName : "+viewName);
		MemberVO memberVO = memberService.modMember(member_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("member",memberVO);
		mav.setViewName(viewName);
		return mav;	
	}

	@Override
	@RequestMapping(value = "/member/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		session.removeAttribute("name");
		session.removeAttribute("email");
		session.removeAttribute("access_token");
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}	
	
	
	@RequestMapping(value = "/member/*Form.do", method =  RequestMethod.GET)
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
	

	@Override
	@RequestMapping(value="/member/updateMember.do", method = RequestMethod.POST)
	public ModelAndView updateMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response)throws Exception{
		System.out.println("Call updateMember-method of control");
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = memberService.updateMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
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
	
	// 카카오 로그인 토큰 받기
		@Override
		@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
		public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model) throws Exception{
	        System.out.println("#########" + code);
	        String access_Token = memberService.getAccessToken(code);
	        KakaoDTO userInfo = memberService.getUserInfo(access_Token);
	        KakaoDTO number = memberService.kakaoNumber(userInfo);
	        session.invalidate();
	        session.setAttribute("name", userInfo.getname());
	        session.setAttribute("email", userInfo.getemail());
	        session.setAttribute("kakaoNumber", number.getnumber());
	        session.setAttribute("isLogOn", true);
	        return "redirect:/main.do";
	    }

		//날씨 정보
		@Override
		@RequestMapping(value = { "/","/weather.do"}, method = RequestMethod.GET)
		public ModelAndView weather(HttpServletRequest request, HttpServletResponse response) throws Exception  {
			request.setCharacterEncoding("utf-8");
			response.setContentType("html/text;charset=utf-8");
			String viewName = (String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			List goodsList = memberService.listGoods();
			mav.addObject("goodsList", goodsList);
			mav.setViewName(viewName);
			return mav;
		}
}
