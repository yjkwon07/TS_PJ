package com.duojj.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.duojj.service.UserService;
import com.duojj.vo.UserVO;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	/*
	 * AuthInterceptor는 
	 * 특정 경로에 접근하는 경우 현재 사용자가 로그인한 상태의 사용자인지 체크하는 역할 처리
	 * 안되어 있으면 로그인창으로 이동하고
	 * 로그인하면 사용자가 원하는 URI로 다시 이동!
	 */
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService service;
	
	/*
	 * 원래 사용자가 원하는 페이지정보를 dest에 저장한다. 
	 * get방식의 경우는 URI 정보 뒤의 파라미터들을 함께 보관해야한다. 
	 */
	private void saveDest(HttpServletRequest req) {
		
		String uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";	
		} else {
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")) {
			logger.info("dest: "+ (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			
			logger.info("current user is not logined");
			
			saveDest(request);
			
			//현재 사용자가 HttpSession에 적당한 값이 없는 경우 loginCookie를 가지고 있는지 체크한다.(3번 상황)
			//만일 과거에 보관한 쿠키가 있다면 UserService 객체를 이용해서 사용자의 정보가 존재하는지 확인한다.
			//만일 사용자의 정보가 존재한다면 HttpSession에 다시 사용자의 정보를 넣어준다.
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				UserVO userVO = service.checkLoginBefore(loginCookie.getValue());
				
				logger.info("USERVO: " +userVO);
				
				if(userVO != null) {
					session.setAttribute("login", userVO);
					return true;
				}
			}
			
			response.sendRedirect("/user/login");
			return false;
		}
		
		return true;
	}
	

}
