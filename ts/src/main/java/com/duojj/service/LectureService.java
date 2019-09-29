package com.duojj.service;

import java.util.List;

import com.duojj.vo.LectureVO;

public interface LectureService {
	
	//강의 업로드 기능
	public void postLectureRegister(LectureVO vo)throws Exception;
	
	//강의번호로 강의조회
	public LectureVO getDetailLectureClass(Integer class_id)throws Exception;
	
	//튜터id로 이 튜터의 다른 강좌 List 조회
	public List<LectureVO> getTutorLectureList(String user_id)throws Exception;
}
