package com.sweethome.sweet.message.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sweethome.sweet.member.vo.MemberVO;
import com.sweethome.sweet.message.service.MessageService;
import com.sweethome.sweet.message.vo.MessageVO;

@Controller("messageController")
@RequestMapping(value="/message")
public class MessageControllerImpl implements MessageController {
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private MessageVO messageVO;
	@Autowired
	private MemberVO memberVO;
	

	@Override		// 쪽지조회 리스트 .do
	@RequestMapping(value = "/listMessage.do", method = RequestMethod.GET)
	public ModelAndView selectAllMessageList(@RequestParam(value = "member_id", required = false) String member_id,
	                                          HttpServletRequest request, HttpServletResponse response) throws Exception {
	    String viewName = (String) request.getAttribute("viewName");
	    ModelAndView mav = new ModelAndView(viewName);
	    HttpSession session = request.getSession();
	    MemberVO memberVO = (MemberVO)session.getAttribute("member");
	    String loggedInMemberId = memberVO.getMember_id();
	    
	    List<MessageVO> listMessage = null;
	    if (member_id != null && !member_id.equals("")) {
	        listMessage = messageService.selectAllMessageList(member_id);
	    } else {
	        listMessage = messageService.selectAllMessageList(loggedInMemberId);
	    }
	    mav.setViewName("/message/listMessage");
	    mav.addObject("listMessage", listMessage);
	    return mav;
	}
					// 쪽지작성 뷰 페이지
	@RequestMapping(value="/messageForm.do", method=RequestMethod.GET)
	public String messageForm() throws Exception{
	return "/message/messageForm";
	}
				// 쪽지작성 매핑
	 @RequestMapping(value="/insert.do", method=RequestMethod.POST)
	 public String insertMessage(MessageVO messageVO) throws Exception {
	     messageService.insertMessage(messageVO);
	     return "redirect:/message/listMessage.do";
	}
	 
	 			// 쪽지 읽음
	 @RequestMapping(value="/read.do", method=RequestMethod.GET)
	 public String noteRead(@RequestParam int no,Model model) throws Exception {
	     MessageVO data = messageService.noteRead(no); // no���� �ѱ�
	     model.addAttribute("data", data); // model�� ������ ���� ��´�
	     return "/message/viewMessage"; // message/viewMessage.jsp�� �̵�
	}
	    
		//쪽지 삭제
	 @RequestMapping(value="/delete.do", method=RequestMethod.GET)
	 public String noteDelete(@RequestParam int no)throws Exception {
		 messageService.deleteNote(no);
		 return "redirect:/message/listMessage.do";
	 }
	 
	 
	
	    
}
