package com.duojj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.duojj.dao.EnrolmentDAO;
import com.duojj.vo.EnrolmentVO;

@Service
public class EnrolmentServiceImpl implements EnrolmentService{
	
	@Inject
	private EnrolmentDAO dao;
	
	@Override
	public void tuteeLectureRegister(EnrolmentVO vo) throws Exception {
		
		dao.tuteeLectureRegister(vo);
	}
	
}
