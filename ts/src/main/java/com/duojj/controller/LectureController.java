package com.duojj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value = "/lecture")
public class LectureController {

	@RequestMapping(value="/form", method=RequestMethod.GET)
	public ModelAndView getLectureRegister()throws Exception{	
	    // 데이터와 뷰를 동시에 설정이 가능
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("/home"); // 뷰의 이름
	    mv.addObject("data", "12341234"); // 뷰로 보낼 데이터 값
	    return mv;
	}
	

}
