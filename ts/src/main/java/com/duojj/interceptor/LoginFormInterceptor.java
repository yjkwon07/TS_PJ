package com.duojj.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.duojj.vo.UserVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginFormInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "LOGIN";
	private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) != null) {
			logger.info("LoginChekInterceptor preHandle");
			logger.info("clear login session data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		logger.info("LoginChekInterceptor postHandle");
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)modelAndView.getModelMap().get("userVO");
		if(userVO != null) {
			logger.info("new login success: "+userVO.getUser_id());
			session.setAttribute(LOGIN, userVO);
			if(request.getParameter("useCookie") != null) {
				logger.info("remember userID..........: "+ userVO.getUser_id());
				Cookie loginCookie = new Cookie("loginCookie", userVO.getUser_sessionkey());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*5); 
				response.addCookie(loginCookie);
			}
			
			String destinataion = (String)session.getAttribute("destinataion");
			if(destinataion == null) {
				response.sendRedirect("/main");
			} else {
				response.sendRedirect(destinataion != null ? destinataion:"/");
			}
		}
	}

}
