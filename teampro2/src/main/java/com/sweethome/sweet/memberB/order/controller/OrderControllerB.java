package com.sweethome.sweet.memberB.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface OrderControllerB {
	public ModelAndView myOrderDetailB(@RequestParam("goodscon_id")  int goodscon_id, HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
