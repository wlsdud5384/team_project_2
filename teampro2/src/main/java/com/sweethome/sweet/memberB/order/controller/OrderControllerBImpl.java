/*package com.sweethome.sweet.memberB.order.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sweethome.sweet.memberB.order.service.OrderServiceB;
import com.sweethome.sweet.memberB.order.vo.OrederVOB;
import com.sweethome.sweet.memberB.vo.MemberVOB;

public class OrderControllerBImpl implements OrderControllerB{
	
	@Autowired
	private OrderServiceB orderServiceB;
	
	@Autowired
	private MemberVOB memberVOB;
	
	@Override
	@RequestMapping(value="/myOrderDetail.do" ,method = RequestMethod.GET)
	public ModelAndView myOrderDetailB(@RequestParam("goodscon_id")  int goodscon_id, HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewNameB=(String)request.getAttribute("viewNameB");
		ModelAndView mav = new ModelAndView(viewNameB);
		HttpSession session=request.getSession();
		MemberVOB ordererB=(MemberVOB)session.getAttribute("memberB");
		
		List<OrderVOB> myOrderListB=OrderServiceB.findMyOrderInfoB(goodscon_id);
		mav.addObject("ordererB", ordererB);
		mav.addObject("myOrderListB",myOrderListB);
		return mav;
	}
	
	
}*/
