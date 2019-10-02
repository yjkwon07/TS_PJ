package com.duojj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.duojj.dto.CategoriesDTO;
import com.duojj.service.LectureService;
import com.duojj.service.UserService;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/test")
@EnableAspectJAutoProxy
public class TestController {
	@Autowired
	UserService userService;

	@Inject
	LectureService service;

	// input 스트링으로 들어오는 String 데이터들의 white space를 trim해주는 역할을 한다.
	// 모든 요청이 들어올때마다 해당 method를 거침 (node의 middleware 같은 것 )
	@InitBinder
	public void InitBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	private static final String LOGIN = "login";
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute(LOGIN);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main");
		mav.addObject("userVO", userVO);
		return mav;
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public ModelAndView Post(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/post");
		return mav;
	}

	@RequestMapping(value = "/categoires", method = RequestMethod.GET)
	public ModelAndView Categoires(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/categoires");
		return mav;
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/classinsert", method = RequestMethod.POST)
	public ModelAndView Classinsert(LectureVO vo, RedirectAttributes rttr) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			service.postInitLectureRegister(vo);
			CategoriesDTO categories = new CategoriesDTO();
			Map<String, Map> map = categories.getCategories();
			Gson gson = new Gson();
			String json = gson.toJson(map);
			mav.addObject("categories_dict", json);
			mav.addObject("class_id", vo.getClass_id());
			mav.setViewName("/classinsert");
			return mav;
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
			System.out.println(e.getMessage());
			rttr.addFlashAttribute("msg", "다시 시도해 주세요.");
			mav.setViewName("redirect:/test/main");
			return mav;
		}
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST, headers = ("content-type=*"))
	@ResponseBody
	public ResponseEntity<Map<String, String>> postLectureRegister(LectureVO vo) throws Exception {
		try {
			service.postLectureRegister(vo);
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

}
