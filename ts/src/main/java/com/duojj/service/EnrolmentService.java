package com.duojj.service;

import com.duojj.vo.EnrolmentVO;

public interface EnrolmentService {

	// 튜티가 등록한 강좌 insert 기능
	public void tuteeLectureRegister(EnrolmentVO enrolmentVO) throws Exception;

	// 이미 등록된 강좌인지 체크
	public EnrolmentVO checkLecture(EnrolmentVO enrolmentVO) throws Exception;
}
