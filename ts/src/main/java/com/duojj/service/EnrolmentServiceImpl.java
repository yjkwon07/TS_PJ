package com.duojj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.duojj.dao.EnrolmentDAO;
import com.duojj.dao.LectureDAO;
import com.duojj.vo.EnrolmentVO;

@Service
public class EnrolmentServiceImpl implements EnrolmentService{
	
	@Inject
	private EnrolmentDAO enrolmentDAO;
	
	@Override
	public void tuteeLectureRegister(EnrolmentVO vo) throws Exception {
		enrolmentDAO.tuteeLectureRegister(vo);
	}
	
	@Override
	public EnrolmentVO checkLecture(EnrolmentVO vo) throws Exception {
		return enrolmentDAO.checkLecture(vo);
	}
	
}
