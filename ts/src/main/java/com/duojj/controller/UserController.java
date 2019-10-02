package com.duojj.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.duojj.dto.LoginDTO;
import com.duojj.service.UserService;
import com.duojj.vo.UserVO;
import com.duojj.controller.UserController;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	/*
	 * 인터셉터 처리 순서 
	 * 1. interceptor의 prehandle 호출 -> true 이면 컨트롤러 메소드 호출
	 * 2. controller의 메소드 실행
	 * 3. interceptor의 posthandle처리
	 */
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	static String LOGIN = "login";
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView getLogin()throws Exception{
		
		logger.info("call loginForm");
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("/login"); 
	    
	    return mv;

	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public ModelAndView postLogin(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr)throws Exception{
	
		logger.info("call loginPost");
		ModelAndView mv = new ModelAndView();
		UserVO vo = service.login(dto);
		
		if(vo == null) {
			mv.setViewName("redirect:login");
			//비동기?status
			return mv;
		} else {
			mv.setViewName("/main");
			mv.addObject("userVO", vo);

			if (dto.isUseCookie()) {

				int amount = 60 * 60 * 5;// 5시간

				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

				service.keepLogin(vo.getUser_id(), session.getId(), sessionLimit);
			}
			return mv;
		}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.POST)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		Object obj = session.getAttribute(LOGIN);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main");
		if(obj != null) {
			UserVO vo = (UserVO) obj;
			
			session.removeAttribute(LOGIN);
			session.invalidate();
			mv.setViewName("redirect:/test/main");
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUser_id(), session.getId(), new Date());
			}
		}

		//status
		return mv;
	}
	
	
}
