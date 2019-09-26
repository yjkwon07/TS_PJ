package com.duojj.controller;

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
import com.duojj.service.LectureService;
import com.duojj.service.UserService;
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
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public ModelAndView getLectureRegister()throws Exception{
		
	    // 데이터와 뷰를 동시에 설정이 가능
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("/home");
	    
	    return mv;

	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView postLectureRegister(LectureVO vo)throws Exception{
		ModelAndView mv = new ModelAndView();
		lectureService.postLectureRegister(vo);
		mv.setViewName("/"+vo.getClass_id()); // 뷰의 이름 -> 강의 상세 페이지로 들어가야함
		
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
	
	@RequestMapping(value="/{class_id}", method=RequestMethod.GET)
	public ModelAndView getDetailLectureClassId(@PathVariable Integer class_id)throws Exception{
		ModelAndView mv = new ModelAndView();
		LectureVO lectureVO = lectureService.getDetailLectureClass(class_id);
		mv.addObject("lectureVO", lectureVO);
		mv.addObject("userVO", userService.getUserInfoFromTutorId(lectureVO.getUser_id()));
		mv.setViewName("/classinfo");
		
		return mv;
	}
	

	
}
