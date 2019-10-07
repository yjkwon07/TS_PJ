package com.duojj.service;

import java.util.Date;
import java.util.Map;

import com.duojj.dto.LoginDTO;
import com.duojj.vo.UserVO;

public interface UserService {

	public UserVO login(LoginDTO dto)throws Exception;
	
	public void keepLogin(String user_id, String user_sessionid, Date next);
	
	public UserVO checkLoginBefore(String value);
	
	public Integer checkUserTutorAuth(String value);
	
	//튜터id로 유저정보 가져오는 기능
	public UserVO getUserInfoFromTutorId(String user_id)throws Exception;

	// 유저 프로필 정보 가져오기
	public Map<String, Object> getUserprofile(String user_id)throws Exception;
}
