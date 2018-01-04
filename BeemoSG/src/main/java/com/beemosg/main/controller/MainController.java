package com.beemosg.main.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.beemosg.common.AESCrypto;
import com.beemosg.common.ComUtils;
import com.beemosg.common.Const;
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
//		if(session.getAttribute("Const.USER_KEY") == null || "".equals(session.getAttribute("Const.USER_KEY"))){
//			logger.info("You don't login.");
//			return "defaults/login";
//		}
//		logger.info("start page main");
		
		Tcustomer loginUser 			= null;
		List<Tbroadcast> broadcastList 	= null;
		List tvFolderList 				= null;
		List movieFolderList		 	= null;
		List dreamFolderList 			= null;
		List entertainmentFolderList 	= null;
		
		try{
			if(session.getAttribute("Const.USER_KEY") != null && !"".equals(session.getAttribute("Const.USER_KEY"))){
				loginUser = (Tcustomer)session.getAttribute("Const.USER_KEY");
				loginUser = mainService.getCustomer(loginUser.getCust_id(), loginUser.getPassword());
				if(loginUser.getCust_gb().equals("20")){
					session.removeAttribute(Const.USER_KEY);
					session.setAttribute(Const.USER_KEY, loginUser);
				}
			}
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
    @RequestMapping(value="/defaults/loginProcess.do")
    public ModelAndView loginProcess(Model model, Tcustomer customer, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	logger.info("login start!");
    	String forwardUrl 	= "";
    	String password   	= "";
    	String keep_login 	= "";
    	String passwd_org 	= "";
    	String cust_id 		= "";
    	String autochk 		= "";
    	
    	ModelAndView mav = null;
    	try{
    		keep_login 	= (String)request.getParameter("keep_login");
    		cust_id		= (String)request.getParameter("cust_id");
    		password 	= (String)request.getParameter("password");
    		autochk 	= (String)request.getParameter("autochk");
    		
    		if("1".equals(autochk)){
    			//passwd = VigEnc.decrypt(passwd); 
    			AESCrypto aes = new AESCrypto();
    			aes.setSalt(Const.SHORTCUT_URL_AES_KEY);
    			password = aes.Decrypt(password);
    		}
    		
	    	mav = new ModelAndView();
	        Tcustomer loginUser = mainService.getCustomer(cust_id, password);
	        
	        if("1".equals(keep_login)){
				AESCrypto aes = new AESCrypto();
				aes.setSalt(Const.SHORTCUT_URL_AES_KEY);
				passwd_org = aes.Encrypt(password);
				
				ComUtils.setCookie(response, "beemosgautoL", passwd_org, 60*60*24*9999);
			} else {
				ComUtils.setCookie(response, "beemosgautoL", "", -1);
			}
	 
	        if (loginUser != null) {
	        	logger.info("login sucess!");

	        	AESCrypto aes = new AESCrypto();
				aes.setSalt(Const.SHORTCUT_URL_AES_KEY);
				String enc_mem_id = aes.Encrypt(cust_id);
				
		    	session.setAttribute("enc_mem_id", enc_mem_id);
		    	
		    	session.removeAttribute(Const.USER_KEY);
		    	session.setAttribute(Const.USER_KEY, loginUser);
	            
	            forwardUrl = request.getParameter("forwardUrl");
	            if(forwardUrl == null || forwardUrl == ""){
	            	mav.setViewName("redirect:/defaults/main.do");
	            }else{
	            	mav.setViewName("redirect:" + forwardUrl);
	            }
	        }else{
	        	logger.info("login fail!");
	        	ComUtils.setCookie(response, "beemosgautoL", "", -1);
	        	model.addAttribute("fail", "fail");
	        	mav.setViewName("defaults/login");
	        }
    	}
    	catch(Exception e){
    		ComUtils.setCookie(response, "beemosgautoL", "", -1);
			logger.error("defaults/loginProcess.do ERROR, " + e.getMessage());
		}
        return mav;
    }
    
    // 로그인 처리
    @RequestMapping(value="/defaults/login.do", method = RequestMethod.GET)
    public String login(HttpSession session) throws Exception{
    	logger.info("login!");
    	try{
    		//session.setAttribute(Const.USER_KEY, null);
    	}
    	catch(Exception e){
			logger.error("defaults/login.do ERROR, " + e.getMessage());
		}
    	return "defaults/login";
    }
    
    // 로그아웃 처리
    @RequestMapping(value="/defaults/logout.do", method = RequestMethod.GET)
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	logger.info("logout!");
    	try{
    		session.invalidate();
    		ComUtils.setCookie(response, "beemosgautoL", "", -1);
    	}
    	catch(Exception e){
			logger.error("defaults/logout.do ERROR, " + e.getMessage());
		}
    	return "redirect:/defaults/main.do";
    }
	
}
