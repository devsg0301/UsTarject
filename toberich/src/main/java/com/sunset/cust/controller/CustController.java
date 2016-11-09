package com.sunset.cust.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sunset.cust.service.CustService;
import com.sunset.model.Tcustomer;

@Controller
public class CustController {

	private static final Logger logger = LoggerFactory.getLogger(CustController.class);
	
	@Resource(name="custService")
	private CustService custService;
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/cust/custJoin.do", method = RequestMethod.GET)
	public String custJoinForm(){
		logger.info("custJoin input page");
		System.out.println("custJoin input page");
		return "cust/custJoinForm";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value = "/cust/custJoinOk.do", method = RequestMethod.POST)
	public String custJoinOk(@ModelAttribute("tcustomer") Tcustomer tcustomer){
		logger.info("custJoinOk start");
		System.out.println("custJoinOk start");
		
		String strDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
		
		String cust_no = strDate + String.format("%02d", custService.getMaxCustNo(strDate + "%"));
		System.out.println("cust_no : " + cust_no );
		
		tcustomer.setCust_no(cust_no);
		
		custService.insertCust(tcustomer);
		
		return "defaults/login";
	}
	
}
