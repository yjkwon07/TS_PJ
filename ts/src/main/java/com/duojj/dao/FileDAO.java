package com.duojj.dao;

import java.util.List;

import com.duojj.vo.FileImageVO;
import com.duojj.vo.LectureVO;

public interface FileDAO {
	public void insertImage(FileImageVO vo)throws Exception;
	
	public void deleteImage(FileImageVO vo)throws Exception;

	public List<FileImageVO> getLectureImageList(LectureVO vo)throws Exception;
}
