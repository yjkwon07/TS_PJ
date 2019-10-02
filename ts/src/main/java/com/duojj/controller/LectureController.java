package com.duojj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duojj.dto.CategoriesDTO;
import com.duojj.service.EnrolmentService;
import com.duojj.service.LectureService;
import com.duojj.service.UserService;
import com.duojj.vo.EnrolmentVO;
import com.duojj.vo.LectureVO;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/lecture")
public class LectureController {
	@Inject
	private LectureService lectureService;

	@Inject
	private UserService userService;

	@Inject
	private EnrolmentService enrolmentService;
	
	@InitBinder
	public void InitBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST, headers = ("content-type=*"))
	@ResponseBody
	public ResponseEntity<Map<String, String>> postLectureRegister(LectureVO vo) throws Exception {
		try {
			lectureService.postLectureRegister(vo);
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "강의 개설 성공");
			return new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
			System.out.println(e.getMessage());
			Map<String, String> map = new HashMap<String, String>();
			map.put("message", "강의 개설 실패");
			return new ResponseEntity<Map<String, String>>(map, HttpStatus.BAD_REQUEST);
		}
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView Classinsert(LectureVO vo, RedirectAttributes rttr) throws Exception {
		ModelAndView mv = new ModelAndView();
		try {
			lectureService.postInitLectureRegister(vo);
			CategoriesDTO categories = new CategoriesDTO();
			Map<String, Map> map = categories.getCategories();
			Gson gson = new Gson();
			String json = gson.toJson(map);
			mv.addObject("categories_dict", json);
			mv.addObject("class_id", vo.getClass_id());
			mv.setViewName("/classinsert");
			return mv;
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
			System.out.println(e.getMessage());
			rttr.addFlashAttribute("msg", "다시 시도해 주세요");
			mv.setViewName("redirect:/main");
			return mv;
		}
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
