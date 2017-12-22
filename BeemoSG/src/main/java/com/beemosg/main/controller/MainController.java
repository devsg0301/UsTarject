package com.beemosg.main.controller;

import java.util.List;

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

import com.beemosg.main.service.MainService;
import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tcustomer;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="mainService")
	private MainService mainService;
	
	
	// 메인페이지 이동
	@RequestMapping(value = "/defaults/main.do", method = RequestMethod.GET)
	public String displayMain(HttpSession session, Model model) throws Exception {
//		if(session.getAttribute("userLoginInfo") == null || "".equals(session.getAttribute("userLoginInfo"))){
//			logger.info("You don't login.");
//			return "defaults/login";
//		}
		logger.info("start page main");
		
		List<Tbroadcast> broadcastList 	= null;
		List tvFolderList 				= null;
		List movieFolderList		 	= null;
		List dreamFolderList 			= null;
		List entertainmentFolderList 	= null;
		
		try{
			broadcastList 			= this.mainService.getBroadcastList();
			tvFolderList 			= this.mainService.getFolderList("%TV%","%%");
			movieFolderList 		= this.mainService.getFolderList("%MOVIE%","%%");
			dreamFolderList 		= this.mainService.getFolderList("%TV%","드라마%");
			entertainmentFolderList = this.mainService.getFolderList("%TV%","예능%");
			
			model.addAttribute("broadcastList", 			broadcastList);
			model.addAttribute("tvFolderList", 				tvFolderList);
			model.addAttribute("movieFolderList", 			movieFolderList);
			model.addAttribute("dreamFolderList", 			dreamFolderList);
			model.addAttribute("entertainmentFolderList", 	entertainmentFolderList);
		}
		catch(Exception e){
			logger.error("defaults/main.do ERROR, " + e.getMessage());
		}
		return "defaults/main";
	}
	
	// 로그인 처리
    @RequestMapping(value="/defaults/loginProcess.do", method = RequestMethod.POST)
    public ModelAndView loginProcess(Model model, Tcustomer customer, HttpSession session, HttpServletRequest request) throws Exception{
    	logger.info("login start!");
    	String forwardUrl = "";
    	ModelAndView mav = null;
    	try{
	    	mav = new ModelAndView();
	        Tcustomer loginUser = mainService.getCustomer(customer.getCust_id(), customer.getPassword());
	 
	        if (loginUser != null) {
	        	logger.info("login sucess!");
	            session.setAttribute("userLoginInfo", loginUser);
	            forwardUrl = request.getParameter("forwardUrl");
	            if(forwardUrl == null){
	            	mav.setViewName("redirect:/defaults/main.do");
	            }else{
	            	mav.setViewName("redirect:" + forwardUrl);
	            }
	        }else{
	        	logger.info("login fail!");
	        	model.addAttribute("fail", "fail");
	        	mav.setViewName("defaults/login");
	        }
    	}
    	catch(Exception e){
			logger.error("defaults/loginProcess.do ERROR, " + e.getMessage());
		}
        return mav;
    }
    
    // 로그아웃 처리
    @RequestMapping(value="/defaults/logout.do", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception{
    	logger.info("logout!");
    	try{
    		session.setAttribute("userLoginInfo", null);
    	}
    	catch(Exception e){
			logger.error("defaults/logout.do ERROR, " + e.getMessage());
		}
    	return "defaults/login";
    }
	
}
