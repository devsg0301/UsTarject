package com.ustarject.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	// 메인페이지 이동
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String displayMain(){
		logger.info("main page stert");
		System.out.println("main page stert");
		return "defaults/main";
	}
	
}
