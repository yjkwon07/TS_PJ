package com.duojj.dao;

import java.util.List;

import com.duojj.vo.EnrolmentVO;
import com.duojj.vo.LectureVO;

public interface EnrolmentDAO {
	//튜티가 등록한 강좌 insert 기능
	public void tuteeLectureRegister(EnrolmentVO enrolmentVO)throws Exception;
	
	// 등록한 강좌 select 
	public List<LectureVO> getEnrolmentLecture(String user_id)throws Exception;
	
	//튜티가 등록되어있는지 확인하는 기능 
	public EnrolmentVO checkLecture(EnrolmentVO enrolmentVO)throws Exception;
}
