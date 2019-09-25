package com.duojj.controller;

import javax.inject.Inject;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.duojj.service.LectureService;
import com.duojj.service.UserService;
import com.duojj.vo.LectureVO;

@Controller
@RequestMapping(value = "/lecture")
@EnableAspectJAutoProxy
public class LectureController {

	@Inject
	private LectureService lectureService;
	@Inject
	private UserService userService;
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public ModelAndView getLectureRegister()throws Exception{
		
	    // 데이터와 뷰를 동시에 설정이 가능
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("/home"); // 뷰의 이름
	    mv.addObject("data", "12341234"); // 뷰로 보낼 데이터 값
	    
	    return mv;

	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView postLectureRegister(LectureVO vo)throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureService.postLectureRegister(vo);
		mv.setViewName("/"+vo.getClass_id()); // 뷰의 이름 -> 강의 상세 페이지로 들어가야함
		
		return mv;
	}
	
	@RequestMapping(value="/{class_id}", method=RequestMethod.GET)
	public ModelAndView postLectureRegister(@PathVariable Integer class_id)throws Exception{
		ModelAndView mv = new ModelAndView();
		LectureVO lectureVO = lectureService.getDetailLectureClass(class_id);
		mv.addObject("lectureVO", lectureVO);
		mv.addObject("userVO", userService.getUserInfoFromTutorId(lectureVO.getUser_id()));
		mv.setViewName("/classinfo");
		
		return mv;
	}
	
}
