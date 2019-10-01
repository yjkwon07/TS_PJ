package com.duojj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.duojj.dao.LectureDAO;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;

@Service
public class LectureServiceImpl implements LectureService{
	
	@Inject
	private LectureDAO dao;
	
	@Override
	public void postLectureRegister(LectureVO vo) throws Exception {
		
		dao.postLectureRegister(vo);
	}
	
	@Override
	public LectureVO getDetailLectureClass(Integer class_id) throws Exception {

		return dao.getDetailLectureClass(class_id);
	}
	
	@Override
	public List<LectureVO> getTutorLectureList(String user_id) throws Exception {
		
		return dao.getTutorLectureList(user_id);
	}
	
	@Override
	public Integer lastColumnClassId() throws Exception {
		
		return dao.lastColumnClassId();
	}
}
