package com.duojj.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.duojj.service.UserService;

@Controller
@RequestMapping(value = "/test")
@EnableAspectJAutoProxy
public class TestController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/categoires", method = RequestMethod.GET)
	public ModelAndView Categoires(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/categoires");
		return mav;
	}

}
