package com.duojj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import com.duojj.dao.EnrolmentDAO;
import com.duojj.dao.LectureDAO;
import com.duojj.dao.UserDAO;
import com.duojj.dto.LoginDTO;
import com.duojj.vo.LectureVO;
import com.duojj.vo.UserVO;

import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO userDAO;

	@Inject 
	private LectureDAO lectureDAO;

	@Inject 
	private EnrolmentDAO enrolmentDAO;
	
	private UUID uuid = UUID.randomUUID();

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return userDAO.login(dto);
	}

	@Override
	public void keepLogin(UserVO userVO) {
		userDAO.keepLogin(userVO);
	}

	@Override
	public UserVO checkUserWithSessionKey(String user_sessionkey) {
		return userDAO.checkUserWithSessionKey(user_sessionkey);
	}

	@Override
	public Integer checkUserTutorAuth(String user_sessionkey) {
		return userDAO.checkUserTutorAuth(user_sessionkey);
	}

	@Override
	public UserVO getUserInfoFromTutorId(String user_id) throws Exception {
		return userDAO.getUserInfoFromTutorId(user_id);
	}

	@Override
	public Map<String, Object> getUserprofile(String user_id) throws Exception {
		Map<String , Object> map = new HashMap<String,Object>();
		UserVO userVO = userDAO.getUserInfoFromTutorId(user_id);
		int user_auth = userVO.getUser_auth();
		List<LectureVO> enrolmentLectureVO = enrolmentDAO.getEnrolmentLecture(user_id); 
		if(user_auth == 2){
			List<LectureVO> tutorLectureVO = lectureDAO.getTutorLectureList(user_id);
			map.put("tutorLectureVO", tutorLectureVO);
		}
		map.put("userVO", userVO);
		map.put("enrolmentLectureVO", enrolmentLectureVO);
		return map;
	}

	@Override
	public void RegistertUser(UserVO userVO) throws Exception {
		userVO.setUser_sessionkey(uuid.toString());
		userDAO.RegistertUser(userVO);
	}

}
