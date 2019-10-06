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
	private LectureDAO lectureDao;
	@Inject
	private FileDAO fileDao;
	@Inject
	private UserDAO userDao;
	@Inject
	private LectureService LectureService;

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
	public LectureVO getDetailLectureClass(int class_id) throws Exception {
		return lectureDao.getDetailLectureClass(class_id);
	}

	@Override
	public List<LectureVO> getTutorLectureList(String user_id) throws Exception {
		return lectureDao.getTutorLectureList(user_id);
	}

	@Override
	public List<FileImageVO> getLectureImageList(LectureVO vo) throws Exception {
		return fileDao.getLectureImageList(vo);
	}

	@Override
	public Map<String, Object> getDetailLectureClassId(int class_id) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		LectureVO lectureVO = LectureService.getDetailLectureClass(class_id);
		String tutorId = lectureVO.getUser_id();
		UserVO tutorVO = userDao.getUserInfoFromTutorId(tutorId);
		List<LectureVO> lectureList = LectureService.getTutorLectureList(tutorId);
		List<FileImageVO> fileList = LectureService.getLectureImageList(lectureVO);
		map.put("tutorVO", tutorVO);
		map.put("lectureVO", lectureVO);
		map.put("lectureList", lectureList);
		map.put("imageList", fileList);
		return map;
	}


}
