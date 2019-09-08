package com.duojj.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	
	/*
	 * 인터셉터 처리 순서 
	 * 1. interceptor의 prehandle 호출 -> true 이면 컨트롤러 메소드 호출
	 * 2. controller의 메소드 실행
	 * 3. interceptor의 posthandle처리
	 * 
	 * LoginInterceptor는 로그인한 사용자에 대해서 postHandle()을 이용해서
	 * HttpSession에 보관처리를 담당
	 */
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN)!= null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		
		if(userVO != null) {
			
			logger.info("new login success");
			session.setAttribute(LOGIN, userVO);
			
			
			//자동 로그인을 선택한 경우 쿠키를 생성하고 쿠키의 이름 'loginCookie'로 저장, 값에는 세션 쿠키의 값
//			쿠키의 사용 범위를 지정해주지 않으면 쿠키를 보낸 서블릿의 경로에
//		    한정. 따라서 쿠키의 사용 범위를 현재 웹 어플리케이션 전체로
//		    지정해야함
			if(request.getParameter("useCookie") != null) {
				
				logger.info("remember me..........");
				Cookie loginCookie = new Cookie("loginCookie",session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7); //1주일간 브라우저에 보관
				response.addCookie(loginCookie); // 만들어진 쿠키는 반드시 HttpServletResponse에 담겨서 전송
			}
			
			response.sendRedirect("/test/main");
//			Object dest = session.getAttribute("dest");
//			response.sendRedirect(dest != null ? (String)dest:"/");
		}
	}

}
