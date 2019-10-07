package com.duojj.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.duojj.service.UserService;
import com.duojj.vo.UserVO;

public class TutorAuthCheckInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(TutorAuthCheckInterceptor.class);
	@Inject
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute(LOGIN);
		if(userVO != null) {
			String sessionKey = userVO.getUser_sessionkey();
			int tutorCheck = service.checkUserTutorAuth(sessionKey);
			if(tutorCheck == 1) {
				logger.info("튜터가 아닙니다.");
				response.sendRedirect("/test/error");
				return false;
			} else if(tutorCheck == 2) {
				return true;
			}
		} else {
			logger.info("로그인이 안되어있습니다.");
			response.sendRedirect("/user/login");
			return false;
		}
		return false;
		
	}

}
