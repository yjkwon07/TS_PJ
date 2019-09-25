package com.duojj.dao;

import com.duojj.vo.LectureVO;

public interface LectureDAO {
	public void postLectureRegister(LectureVO vo)throws Exception;
	
	public LectureVO getDetailLectureClass(Integer class_id)throws Exception;
}
