package com.duojj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.duojj.dao.FileDAO;
import com.duojj.dao.LectureDAO;
import com.duojj.dao.UserDAO;
import com.duojj.vo.FileImageVO;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;

@Service
public class LectureServiceImpl implements LectureService {

	@Inject
	private LectureDAO lectureDAO;

	@Inject
	private FileDAO fileDAO;
	
	@Inject
	private UserDAO userDAO;

	@Override
	public void postInitLectureRegister(LectureVO vo) throws Exception {
		int class_id = lectureDAO.currentLectureCount() + 1;
		vo.setClass_id(class_id);
		lectureDAO.postInitLectureRegister(vo);
	}

	@Override
	public void postLectureRegister(LectureVO vo) throws Exception {
		lectureDAO.postLectureUpdate(vo);
	}

	@Override
	public void insertImage(FileImageVO vo) throws Exception {
		fileDAO.insertImage(vo);
	}

	@Override
	public void deleteImage(FileImageVO vo) throws Exception {
		fileDAO.deleteImage(vo);
	}

	@Override
	public LectureVO getDetailLectureClass(int class_id) throws Exception {
		return lectureDAO.getDetailLectureClass(class_id);
	}

	@Override
	public List<LectureVO> getTutorLectureList(String user_id) throws Exception {
		return lectureDAO.getTutorLectureList(user_id);
	}

	@Override
	public List<FileImageVO> getLectureImageList(LectureVO vo) throws Exception {
		return fileDAO.getLectureImageList(vo);
	}

	@Override
	public Map<String, Object> getDetailLectureClassId(int class_id) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		LectureVO lectureVO = lectureDAO.getDetailLectureClass(class_id);
		String tutorId = lectureVO.getUser_id();
		UserVO tutorVO = userDAO.getUserInfoFromTutorId(tutorId);
		List<LectureVO> lectureList = lectureDAO.getTutorLectureList(tutorId);
		List<FileImageVO> fileList = fileDAO.getLectureImageList(lectureVO);
		map.put("tutorVO", tutorVO);
		map.put("lectureVO", lectureVO);
		map.put("lectureList", lectureList);
		map.put("imageList", fileList);
		return map;
	}
	
	@Override
	public List<LectureVO> getLatestLectureList(Integer minCnt, Integer maxCnt) throws Exception {
		return lectureDAO.getLatestLectureList(minCnt, maxCnt);
	}
}
