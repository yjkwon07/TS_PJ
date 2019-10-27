package com.duojj.dao;

import java.util.List;

import com.duojj.vo.LectureVO;

public interface LectureDAO {

	public void postInitLectureRegister(LectureVO lectureVO) throws Exception;

	public void postLectureRegister(LectureVO lectureVO) throws Exception;

	public int currentLectureCount() throws Exception;

	public void postLectureUpdate(LectureVO lectureVO) throws Exception;

	public LectureVO getDetailLectureClass(int class_id) throws Exception;

	public List<LectureVO> getTutorLectureList(String user_id) throws Exception;

	public List<LectureVO> getLatestLectureList(int minCnt, int maxCnt) throws Exception;
}
