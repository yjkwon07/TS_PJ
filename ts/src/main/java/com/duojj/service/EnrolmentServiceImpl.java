package com.duojj.service;

import javax.inject.Inject;

import com.duojj.dao.EnrolmentDAO;
import com.duojj.vo.EnrolmentVO;

import org.springframework.stereotype.Service;

@Service
public class EnrolmentServiceImpl implements EnrolmentService {

	@Inject
	private EnrolmentDAO enrolmentDAO;

	@Override
	public void tuteeLectureRegister(EnrolmentVO enrolmentVO) throws Exception {
		enrolmentDAO.tuteeLectureRegister(enrolmentVO);
	}

	@Override
	public EnrolmentVO checkLecture(EnrolmentVO enrolmentVO) throws Exception {
		return enrolmentDAO.checkLecture(enrolmentVO);
	}

}
