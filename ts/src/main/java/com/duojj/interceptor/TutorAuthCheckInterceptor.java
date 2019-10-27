package com.duojj.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.duojj.service.UserService;
import com.duojj.vo.UserVO;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class TutorAuthCheckInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "LOGIN";

	@Inject
	private UserService userService;

	private RedirectAttributes rttr;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute(LOGIN);
		if (userVO != null) {
			String sessionKey = userVO.getUser_sessionkey();
			int tutorCheck = userService.checkUserTutorAuth(sessionKey);
			if (tutorCheck == 1) {
				rttr.addFlashAttribute("msg", "잘못된 접근 입니다");
				response.sendRedirect("/main");
				return false;
			} else if (tutorCheck == 2) {
				return true;
			}
		} else {
			rttr.addFlashAttribute("msg", "로그인인 필요 합니다");
			response.sendRedirect("/user/login");
			return false;
		}
		return false;
	}

}
