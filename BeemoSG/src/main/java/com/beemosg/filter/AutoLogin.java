package com.beemosg.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.beemosg.common.ComUtils;
import com.beemosg.common.Const;
import com.beemosg.main.controller.MainController;

public class AutoLogin implements Filter {
	
	private static final Logger logger = LoggerFactory.getLogger(AutoLogin.class);
	
	private FilterConfig config;
	private ServletContext context;

	public void init(FilterConfig config) throws ServletException {
		context = config.getServletContext();
	}

	public void destroy() {
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest 	req 			= (HttpServletRequest) request;
		HttpServletResponse res 			= (HttpServletResponse) response;
		HttpSession 		session 		= req.getSession();
		
		String 				autoLoginStatus = (String)session.getAttribute("AutoLoginStatus");
		String 				autoID			= null;
		String 				autoPW			= null;
		String				forwardPath		= null;
		
		logger.info("login doFilter start!");
		if(session.getAttribute(Const.USER_KEY) == null){
			if(null == autoLoginStatus || "".equals(autoLoginStatus)){
				session.setAttribute("AutoLoginStatus", "1");
				
				autoID = ComUtils.NVL(ComUtils.getCookie(req, "saveid"), "");
				autoPW = ComUtils.NVL(ComUtils.getCookie(req, "beemosgautoL"), "");
				logger.info("autoID : " + autoID + ", autoPW : " + autoPW);
				if(!"".equals(autoID) && !"".equals(autoPW)){
					//ForwardURL Setting
					if(Const.AUTOLOGIN_LOCAL_YN){
						if(null != req.getQueryString()){
							forwardPath = req.getRequestURI() + "?" + req.getQueryString().replaceAll("&", "%26");
						}else{
							forwardPath = req.getRequestURI();
						}
					}else{
						if(null != req.getQueryString()){
							forwardPath = req.getRequestURI().replace(req.getContextPath(), "") + "?" + req.getQueryString().replaceAll("&", "%26");
						}else{
							forwardPath = req.getRequestURI().replace(req.getContextPath(), "");
						}
					}
					
					request.setAttribute("cust_id", autoID);
					request.setAttribute("password", autoPW);
					request.setAttribute("autochk", 1);
					request.setAttribute("keep_login", 1);
					//context.getRequestDispatcher("/defaults/loginProcess.do?forwardUrl=" + forwardPath).forward(request, response);
					context.getRequestDispatcher("/defaults/loginProcess.do?cust_id=" + autoID + "&password=" + autoPW + "&autochk=1&keep_login=1&forwardUrl=" + forwardPath).forward(request, response);
					
				}else{
					chain.doFilter(request, response);
				}
			}else{
				chain.doFilter(request, response);
			}
		}else{
			chain.doFilter(request, response);
		}
	}
}