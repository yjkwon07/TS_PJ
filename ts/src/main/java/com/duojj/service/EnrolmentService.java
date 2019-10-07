package com.duojj.service;

import com.duojj.vo.EnrolmentVO;

public interface EnrolmentService {
	
	//튜티가 등록한 강좌 insert 기능
	public void tuteeLectureRegister(EnrolmentVO vo)throws Exception;
	
	public Integer checkLecture(EnrolmentVO vo)throws Exception;
}
