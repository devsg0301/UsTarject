package com.ustarject.cust.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustController {

	private static final Logger logger = LoggerFactory.getLogger(CustController.class);
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/cust/custJoin.do", method = RequestMethod.GET)
	public String custJoinForm(){
		logger.info("custJoin start");
		System.out.println("custJoin start");
		return "customer/custJoinForm";
	}
	
}
