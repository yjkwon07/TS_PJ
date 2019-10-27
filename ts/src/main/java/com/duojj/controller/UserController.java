package com.duojj.controller;

import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.duojj.dto.LoginDTO;
import com.duojj.service.UserService;
import com.duojj.vo.UserVO;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	private static final String LOGIN = "LOGIN";
	private static final String VIEW_MAIN ="/main";
	private static final String VIEW_LOGIN_FORM = "/login";
	private static final String VIEW_USER_INSERT_FORM = "/register";
	private static final String VIEW_USER_PROFILE_FORM = "/userprofile";

	@Inject
	private UserService userService;

	@InitBinder
	public void InitBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@GetMapping("/login")
	public String getLogin() throws Exception {
		return VIEW_LOGIN_FORM;
	}

	@PostMapping("/login")
	public ModelAndView postLogin(LoginDTO dto, RedirectAttributes rttr) throws Exception {
		ModelAndView mv = new ModelAndView(VIEW_MAIN);
		UserVO vo = userService.login(dto);
		if (vo == null) {
			rttr.addFlashAttribute("msg", "등록된 정보가 없습니다");
			mv.setViewName(VIEW_LOGIN_FORM);
			return mv;
		} else {
			mv.addObject("userVO", vo);
			if (dto.isUseCookie()) {
				int amount = 60 * 60 * 5;
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
				vo.setUser_sessionlimit(sessionLimit);
				userService.keepLogin(vo);
			}
			return mv;
		}
	}
	
	@PostMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main");
		rttr.addFlashAttribute("msg", "로그아웃 되었습니다.");
		UserVO vo = (UserVO)session.getAttribute(LOGIN);
		if (vo != null) {
			session.removeAttribute(LOGIN);
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				vo.setUser_sessionlimit(new Date());
				userService.keepLogin(vo);
			}
		}
		return mv;
	}

	@GetMapping("/register")
	public String register() throws Exception {
		return VIEW_USER_INSERT_FORM;
	}

	@PostMapping("/register")
	public String postRegister(UserVO userVO, RedirectAttributes rttr) throws Exception {
		try {
			userService.RegistertUser(userVO);
			rttr.addFlashAttribute("msg", "TS 회원이 되신걸 축하합니다!");
			return "redirect:/main";
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "아이디를 만들수 없습니다");
			return "redirect:/main";
		}
	}

	@GetMapping("/profile/{user_id}")
	public ModelAndView getUserprofile(@PathVariable String user_id, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) {
		ModelAndView mv = new ModelAndView(VIEW_USER_PROFILE_FORM);
		UserVO userVO = (UserVO) request.getSession().getAttribute(LOGIN);
		try {
			Map<String, Object> map = userService.getUserprofile(user_id);
			if (map != null && user_id.equals(userVO.getUser_id())) {
				mv.addObject("userprofileVO", map);
				return mv;
			} else {
				rttr.addFlashAttribute("msg", "등록된 사용자가 없습니다");
				mv.setViewName("redirect:/main");
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "등록된 사용자가 없습니다");
			mv.setViewName("redirect:/main");
			return mv;
		}
	}

}
