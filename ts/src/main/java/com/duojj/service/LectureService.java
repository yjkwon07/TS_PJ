package com.duojj.service;

import java.util.List;

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
	public LectureVO getDetailLectureClass(Integer class_id)throws Exception;
	
	//튜터id로 이 튜터의 다른 강좌 List 조회
	public List<LectureVO> getTutorLectureList(String user_id)throws Exception;
}
