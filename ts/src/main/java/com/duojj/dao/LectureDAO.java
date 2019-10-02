package com.duojj.dao;

import java.util.List;

import com.duojj.vo.LectureVO;

public interface LectureDAO {
	
	public void postInitLectureRegister(LectureVO vo) throws Exception;
	
	public void postLectureRegister(LectureVO vo)throws Exception;
	
	public int currentLectureCount() throws Exception;
	
	public void postLectureUpdate(LectureVO vo) throws Exception;
	
	public LectureVO getDetailLectureClass(Integer class_id)throws Exception;
	
	public List<LectureVO> getTutorLectureList(String user_id)throws Exception;
}
