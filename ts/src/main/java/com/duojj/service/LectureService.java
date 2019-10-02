package com.duojj.service;

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

}
