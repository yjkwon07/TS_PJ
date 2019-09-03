package com.duojj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.duojj.dao.LectureDAO;
import com.duojj.vo.LectureVO;

@Service
public class LectureServiceImpl implements LectureService{
	
	@Inject
	private LectureDAO dao;
	
	@Override
	public void postLectureRegister(LectureVO vo) throws Exception {
		
		dao.postLectureRegister(vo);
	}
}
