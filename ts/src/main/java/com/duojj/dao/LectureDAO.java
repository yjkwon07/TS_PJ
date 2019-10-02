package com.duojj.dao;

import com.duojj.vo.LectureVO;

public interface LectureDAO {
	
	public void postInitLectureRegister(LectureVO vo) throws Exception;
	
	public void postLectureRegister(LectureVO vo)throws Exception;
	
	public int currentLectureCount() throws Exception;
	
	public void postLectureUpdate(LectureVO vo) throws Exception;
	
}
