package com.duojj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.duojj.dto.CategoriesDTO;
import com.duojj.service.EnrolmentService;
import com.duojj.service.LectureService;
import com.duojj.vo.EnrolmentVO;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;
import com.google.gson.Gson;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/lecture")
public class LectureController {
	private static final String LOGIN = "LOGIN";

	private static final String VIEW_CLASS_INSERT_FORM = "/classinsert";
	private static final String VIEW_CLASS_INFO = "/classinfo";

	@Inject
	private LectureService lectureService;

	@Inject
	private EnrolmentService enrolmentService;

	@InitBinder
	public void InitBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	@SuppressWarnings("rawtypes")
	@PostMapping("/insert")
	public ModelAndView Classinsert(LectureVO vo, RedirectAttributes rttr) {
		ModelAndView mv = new ModelAndView();
		try {
			lectureService.postInitLectureRegister(vo);
			Map<String, Map> map = new CategoriesDTO().getCategories();
			String json = new Gson().toJson(map);
			mv.addObject("categories_dict", json);
			mv.addObject("class_id", vo.getClass_id());
			mv.setViewName(VIEW_CLASS_INSERT_FORM);
			return mv;
		} catch (Exception e) {
			e.getStackTrace();
			e.getMessage();
			rttr.addFlashAttribute("msg", "다시 시도해 주세요");
			mv.setViewName("redirect:/main");
			return mv;
		}
	}

	@ResponseBody
	@PostMapping("/regist")
	public ResponseEntity<Map<String, String>> postLectureRegister(LectureVO vo) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			lectureService.postLectureRegister(vo);
			map.put("message", "강의 개설 성공");
			return new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.getStackTrace();
			e.getMessage();
			map.clear();
			map.put("message", "강의 개설 실패");
			return new ResponseEntity<Map<String, String>>(map, HttpStatus.BAD_REQUEST);
		}
	}

	@SuppressWarnings("unused")
	@GetMapping("/{class_id}")
	public ModelAndView getDetailLectureClassId(@PathVariable Integer class_id, HttpServletRequest request,
			RedirectAttributes rttr) {
		ModelAndView mv = new ModelAndView(VIEW_CLASS_INFO);
		try {
			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute(LOGIN);
			Map<String, Object> map = lectureService.getDetailLectureClassId(class_id);
			map.put("userVO", userVO);
			if (map != null) {
				mv.addObject("detailLectureVO", map);
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

	@PostMapping("/tuteeRegister")
	public ModelAndView postTuteeLectureRegister(EnrolmentVO enrolmentVO, RedirectAttributes rttr) throws Exception {
		ModelAndView mv = new ModelAndView();
		try {
			int enrolment_class_id = enrolmentVO.getEnrolment_class_id();
			EnrolmentVO checkEnrolmentVO = enrolmentService.checkLecture(enrolmentVO);
			if (checkEnrolmentVO != null) {
				mv.setViewName("redirect:/lecture/" + enrolment_class_id);
				rttr.addFlashAttribute("msg", "이미 등록된 강좌 입니다.");
				return mv;
			}
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
