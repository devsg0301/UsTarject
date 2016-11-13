package com.vicloud.main.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vicloud.main.service.MainService;
import com.vicloud.model.Tcustomer;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="mainService")
	private MainService mainService;
	
	
	// 메인페이지 이동
	@RequestMapping(value = "/defaults/main.do", method = RequestMethod.GET)
	public String displayMain(HttpSession session, Model model){
//		if(session.getAttribute("userLoginInfo") == null || "".equals(session.getAttribute("userLoginInfo"))){
//			logger.info("You don't login.");
//			System.out.println("You don't login.");
//			return "defaults/login";
//		}
		logger.info("main page start");
		System.out.println("main page start");
		model.addAttribute("dropdown", "main");
		
		return "defaults/main";
	}
	
	// 로그인 처리
    @RequestMapping(value="/defaults/loginProcess.do", method = RequestMethod.POST)
    public ModelAndView loginProcess(Model model, Tcustomer customer, HttpSession session, HttpServletRequest request) {
    	logger.info("login start!");
    	System.out.println("login start!");
    	ModelAndView mav = new ModelAndView();
 
        Tcustomer loginUser = mainService.getCustomer(customer.getCust_id(), customer.getPassword());
 
        if (loginUser != null) {
        	logger.info("login sucess!");
        	System.out.println("login sucess!");
            session.setAttribute("userLoginInfo", loginUser);
            mav.setViewName("redirect:/defaults/main.do");
        }else{
        	logger.info("login fail!");
        	System.out.println("login fail!");
        	model.addAttribute("fail", "fail");
        	mav.setViewName("defaults/login");
        }
        return mav;
    }
    
    // 로그아웃 처리
    @RequestMapping(value="/defaults/logout.do", method = RequestMethod.GET)
    public String logout(HttpSession session){
    	logger.info("logout!");
    	System.out.println("logout!");
    	
    	session.setAttribute("userLoginInfo", null);
    	
    	return "defaults/login";
    }
	
}
