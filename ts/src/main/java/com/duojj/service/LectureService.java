package com.duojj.service;

import java.util.List;
import java.util.Map;

import com.duojj.vo.FileImageVO;
import com.duojj.vo.LectureVO;

public interface LectureService {
	
	// tbl_class InitInsert
	public void postInitLectureRegister(LectureVO vo)throws Exception;
	
	// tbl_class insert
	public void postLectureRegister(LectureVO vo)throws Exception;

	// tbl_image insert
	public void insertImage(FileImageVO vo) throws Exception;

	// tbl_image delete
	public void deleteImage(FileImageVO vo) throws Exception;

	// tbl_image select
	public List<FileImageVO> getLectureImageList(LectureVO vo) throws Exception;
	
	//강의번호로 강의조회
	public LectureVO getDetailLectureClass(int class_id)throws Exception;
	
	//튜터id로 이 튜터의 다른 강좌 List 조회
	public List<LectureVO> getTutorLectureList(String user_id)throws Exception;

	// 강의번호 요청시 가져올 데이터 map으로 json 반환
	public Map<String, Object> getDetailLectureClassId(int class_id)throws Exception;
	
	//최근 개설한 강의 가져오기(범위)
	public List<LectureVO> getLatestLectureList(Integer minCnt, Integer maxCnt)throws Exception;
}
