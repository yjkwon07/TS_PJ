package com.duojj.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.duojj.service.LectureService;
import com.duojj.service.UserService;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	@Inject
	UserService userService;
	
	@Inject
	LectureService lectureService;
	
	private static final String LOGIN = "login";
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute(LOGIN);
		ModelAndView mav = new ModelAndView();
		List<LectureVO> latestLectureList = lectureService.getLatestLectureList(1,5);
		mav.addObject("latestLectureList", latestLectureList);
		mav.setViewName("/main");
		if(userVO != null) {
			String user_id = userVO.getUser_id();
			Map<String,Object> map = userService.getUserprofile(user_id);
			mav.addObject("userprofileVO", map);
			mav.addObject("userVO", userVO);
		}
		return mav;
	}
}
