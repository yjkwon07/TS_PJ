package com.duojj.dao;

import com.duojj.vo.EnrolmentVO;

public interface EnrolmentDAO {
	//튜티가 등록한 강좌 insert 기능
	public void tuteeLectureRegister(EnrolmentVO vo)throws Exception;
	
}
