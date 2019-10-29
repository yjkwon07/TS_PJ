package com.duojj.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.duojj.service.LectureService;
import com.duojj.service.UserService;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	@Inject
	UserService userService;
	
	@Inject
	LectureService lectureService;
	
	private static final String LOGIN = "LOGIN";
	private static final String VIEW_MAIN ="/main";

	@GetMapping("/")
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView(VIEW_MAIN);
    HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute(LOGIN);
		List<LectureVO> latestLectureList = lectureService.getLatestLectureList(0,5);
		mav.addObject("latestLectureList", latestLectureList);
		if(userVO != null) {
			String user_id = userVO.getUser_id();
			Map<String,Object> map = userService.getUserprofile(user_id);
			mav.addObject("userprofileVO", map);
			mav.addObject("userVO", userVO);
		}
		return mav;
	}
}
