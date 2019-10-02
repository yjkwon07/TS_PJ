package com.duojj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.duojj.dao.FileDAO;
import com.duojj.dao.LectureDAO;
import com.duojj.vo.FileImageVO;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;

@Service
public class LectureServiceImpl implements LectureService{
	
	@Inject
	private LectureDAO lectureDao;
	@Inject
	private FileDAO fileDao;
	
	@Override
	public void postInitLectureRegister(LectureVO vo) throws Exception {
		int class_id = lectureDao.currentLectureCount() + 1;
		vo.setClass_id(class_id);
		lectureDao.postInitLectureRegister(vo);
	}
	
	@Override
	public void postLectureRegister(LectureVO vo) throws Exception {
		lectureDao.postLectureUpdate(vo);
	}

	@Override
	public void insertImage(FileImageVO vo) throws Exception {
		fileDao.insertImage(vo);
	}

	@Override
	public void deleteImage(FileImageVO vo) throws Exception {
		fileDao.deleteImage(vo);
	}
	
	@Override
	public LectureVO getDetailLectureClass(Integer class_id) throws Exception {

		return dao.getDetailLectureClass(class_id);
	}
	
	@Override
	public List<LectureVO> getTutorLectureList(String user_id) throws Exception {
		
		return dao.getTutorLectureList(user_id);
	}
}
