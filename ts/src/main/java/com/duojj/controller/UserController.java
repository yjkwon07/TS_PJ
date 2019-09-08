package com.duojj.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
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

@Controller
@RequestMapping(value = "/user")
@EnableAspectJAutoProxy
public class UserController {
	/*
	 * 인터셉터 처리 순서 
	 * 1. interceptor의 prehandle 호출 -> true 이면 컨트롤러 메소드 호출
	 * 2. controller의 메소드 실행
	 * 3. interceptor의 posthandle처리
	 */
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView getLogin()throws Exception{
		
	    // 데이터와 뷰를 동시에 설정이 가능
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("/login"); // 뷰의 이름
	    //mv.addObject("data", "12341234"); // 뷰로 보낼 데이터 값
	    
	    return mv;

	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public ModelAndView postLogin(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr)throws Exception{
	
		ModelAndView mv = new ModelAndView();
		UserVO vo = service.login(dto);
		
		if(vo == null) {
			mv.setViewName("redirect:login");
			return mv;

		}
		
		mv.addObject("userVO", vo);
		mv.setViewName("/main");
		
		if(dto.isUseCookie()) {
			
			int amount = 60 * 60 * 24 * 7;//1주일
			
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			
			service.keepLogin(vo.getUser_id(), session.getId(), sessionLimit);
		}
		
		return mv;

	}
	
	
}
