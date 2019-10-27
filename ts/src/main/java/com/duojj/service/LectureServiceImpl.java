package com.duojj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.duojj.dao.FileDAO;
import com.duojj.dao.LectureDAO;
import com.duojj.dao.UserDAO;
import com.duojj.vo.FileImageVO;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;

import org.springframework.stereotype.Service;

@Service
public class LectureServiceImpl implements LectureService {

	@Inject
	private LectureDAO lectureDAO;

	@Inject
	private FileDAO fileDAO;

	@Inject
	private UserDAO userDAO;

	@Override
	public void postInitLectureRegister(LectureVO lectureVO) throws Exception {
		int class_id = lectureDAO.currentLectureCount() + 1;
		lectureVO.setClass_id(class_id);
		lectureDAO.postInitLectureRegister(lectureVO);
	}

	@Override
	public void postLectureRegister(LectureVO lectureVO) throws Exception {
		lectureDAO.postLectureUpdate(lectureVO);
	}

	@Override
	public void insertImage(FileImageVO fileImageVO) throws Exception {
		fileDAO.insertImage(fileImageVO);
	}

	@Override
	public void deleteImage(FileImageVO fileImageVO) throws Exception {
		fileDAO.deleteImage(fileImageVO);
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
	public List<FileImageVO> getLectureImageList(LectureVO lectureVO) throws Exception {
		return fileDAO.getLectureImageList(lectureVO);
	}

	@Override
	public Map<String, Object> getDetailLectureClassId(int class_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
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
	public List<LectureVO> getLatestLectureList(int minCnt, int maxCnt) throws Exception {
		return lectureDAO.getLatestLectureList(minCnt, maxCnt);
	}
}
