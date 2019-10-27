package com.duojj.service;

import java.util.Map;

import com.duojj.dto.LoginDTO;
import com.duojj.vo.UserVO;

public interface UserService {
	// user find and then, take user_id, user_name, user_auth, user_sessionke
	public UserVO login(LoginDTO dto)throws Exception;
	
	// user keep session store that update the 'user_sessionlimit'
	public void keepLogin(UserVO userVO);
	
	// check the sessionKey and curdate() if over the time curdate return null
	public UserVO checkUserWithSessionKey(String user_sessionkey);
	
	// check the UserTutor if has not user_sessionkey then null that is not login
	public Integer checkUserTutorAuth(String user_sessionkey);
	
	//튜터id로 유저정보 가져오는 기능
	public UserVO getUserInfoFromTutorId(String user_id)throws Exception;

	// 유저 프로필 정보 가져오기
	public Map<String, Object> getUserprofile(String user_id)throws Exception;

	// 유저 정보 등록 
	public void RegistertUser(UserVO userVO)throws Exception;
}
