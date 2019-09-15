package com.duojj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.duojj.dto.CategoriesDTO;
import com.duojj.service.UserService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/test")
@EnableAspectJAutoProxy
public class TestController {
	@Autowired
	UserService userService;
	
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request,HttpServletResponse response)throws Exception{
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
		CategoriesDTO categories = new CategoriesDTO();
		Gson gson = new Gson();
		Map<String, String[]> map = new HashMap();
		map.put("design",categories.s[0]);
		map.put("it",categories.s[1]);
		map.put("video",categories.s[2]);
		map.put("forLanguage",categories.s[3]);
		map.put("beauty",categories.s[4]);
		map.put("music",categories.s[5]);
		String json = gson.toJson(map);
		
		mav.addObject("categories_dict", json);
		mav.setViewName("/classinsert");
		return mav;
	}

}
