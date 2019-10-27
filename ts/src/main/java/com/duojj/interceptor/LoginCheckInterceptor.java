package com.duojj.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.duojj.service.UserService;
import com.duojj.vo.UserVO;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "LOGIN";

	@Inject
	private UserService userService;

	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		String query = req.getQueryString();

		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		if (req.getMethod().equals("GET")) {
			req.getSession().setAttribute("destinataion", uri + query);
		}
	}

	/*
	 * 현재 사용자가 HttpSession에 'loginCookie' attribute를 가지고 있는지 체크한다.
	 * 만일 과거에 보관한 쿠키가 있다면 UserService 객체를 이용해서 사용자의 정보를 가져온다. 
	 * 만일 사용자의 정보가 존재한다면 HttpSession에 다시 사용자의 정보를 넣어준다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute(LOGIN) == null) {
			saveDest(request);
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				UserVO userVO = userService.checkUserWithSessionKey(loginCookie.getValue());
				if (userVO != null) {
					session.setAttribute(LOGIN, userVO);
					return true;
				}
			}
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}

}
