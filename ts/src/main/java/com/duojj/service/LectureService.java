package com.duojj.service;

import com.duojj.vo.LectureVO;

public interface LectureService {
	
	//강의 업로드 기능
	public void postLectureRegister(LectureVO vo)throws Exception;
	
	//강의번호로 강의조회
	public LectureVO getDetailLectureClass(Integer class_id)throws Exception;
}
