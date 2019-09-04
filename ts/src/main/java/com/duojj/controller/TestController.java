package com.duojj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.duojj.service.UserService;
import com.duojj.vo.UserVO;

@Controller("TestController")
@RequestMapping(value = "/test")
@EnableAspectJAutoProxy
public class TestController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView UserDetals(HttpServletRequest request,HttpServletResponse response) throws Exception {
		List<UserVO> list= userService.selectGoodsList();
		for(UserVO user : list) {
			System.out.println(user.getUser_name());	
		}	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main");
		return mav;
	}
	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public ModelAndView Post(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/post");
		return mav;
	}
	@RequestMapping(value = "/categoires", method = RequestMethod.GET)
	public ModelAndView Categoires(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/categoires");
		return mav;
	}
	
	@RequestMapping(value = "/classinsert", method = RequestMethod.GET)
	public ModelAndView Classinsert(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/classinsert");
		return mav;
	}
}
