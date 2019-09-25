package com.duojj.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.duojj.dto.CategoriesDTO;
import com.duojj.service.UserService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/main")
@EnableAspectJAutoProxy
public class MainController {
	@Inject
	UserService userService;
	
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main");
		return mav; 
	}

}
