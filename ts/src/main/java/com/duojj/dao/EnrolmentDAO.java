package com.duojj.dao;

import java.util.List;

import com.duojj.vo.EnrolmentVO;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;

public interface EnrolmentDAO {
	//튜티가 등록한 강좌 insert 기능
	public void tuteeLectureRegister(EnrolmentVO vo)throws Exception;
	
	// 등록한 강좌 select 
	public List<LectureVO> getEnrolmentLecture(String user_id)throws Exception;
}
