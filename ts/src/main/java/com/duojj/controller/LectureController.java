package com.duojj.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duojj.dto.CategoriesDTO;
import com.duojj.service.EnrolmentService;
import com.duojj.service.LectureService;
import com.duojj.service.UserService;
import com.duojj.vo.EnrolmentVO;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/lecture")
@EnableAspectJAutoProxy
public class LectureController {

	@Inject
	private LectureService lectureService;
	@Inject
	private UserService userService;
	@Inject
	private EnrolmentService enrolmentService;
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView postLectureRegister(LectureVO vo)throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureService.postLectureRegister(vo);
		int classId = lectureService.lastColumnClassId();
		mv.setViewName("redirect:/lecture/"+classId); 
		
		return mv;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public ModelAndView Classinsert(HttpServletRequest request,HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		ModelAndView mv = new ModelAndView();
		CategoriesDTO categories = new CategoriesDTO();
		Map<String, Map> map = categories.getCategories();
		Gson gson = new Gson();
		String json = gson.toJson(map);
		mv.addObject("categories_dict", json);
		
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("login");
		
		if(userVO != null) {
			mv.setViewName("/classinsert");
		} else {
			System.out.println("로그인이 안되어있습니다.");
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			mv.setViewName("redirect:/user/login");
		}
		
		return mv;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/{class_id}", method=RequestMethod.GET)
	public ModelAndView getDetailLectureClassId(@PathVariable Integer class_id,RedirectAttributes rttr,HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView();
		try {
			LectureVO lectureVO = lectureService.getDetailLectureClass(class_id);
			String tutorId = lectureVO.getUser_id();
			UserVO tutorVO = userService.getUserInfoFromTutorId(tutorId);
			List<LectureVO> lectureList = lectureService.getTutorLectureList(tutorId);
			
			HttpSession session = request.getSession();
			UserVO tuteeVO = (UserVO)session.getAttribute("login");
			
			
			if(lectureVO != null) {
				mv.addObject("lectureVO", lectureVO);
				mv.addObject("tutorVO", tutorVO);
				mv.addObject("tuteeVO", tuteeVO);
				mv.addObject("lectureList", lectureList);
				mv.setViewName("/classinfo");
				return mv;
			} else {
				rttr.addFlashAttribute("msg", "수업이 없습니다.");
				mv.setViewName("redirect:/main");
				return mv;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msg", "수업이 없습니다.");
			mv.setViewName("redirect:/main");
			return mv;
		}
	}
	
	@RequestMapping(value="/tuteeRegister", method=RequestMethod.POST)
	public ModelAndView postTuteeLectureRegister(EnrolmentVO enrolmentVO, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		try {
			enrolmentService.tuteeLectureRegister(enrolmentVO);
			rttr.addFlashAttribute("msg", "강의신청되었습니다.");
			mv.setViewName("redirect:/main");
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("redirect:/user/login");
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return mv;
		}
	}
	

	
}
