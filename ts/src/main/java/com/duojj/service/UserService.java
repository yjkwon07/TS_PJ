package com.duojj.service;

import java.util.Date;

import com.duojj.dto.LoginDTO;
import com.duojj.vo.UserVO;

public interface UserService {

	public UserVO login(LoginDTO dto)throws Exception;
	
	public void keepLogin(String user_id, String user_sessionid, Date next);
	
	public UserVO checkLoginBefore(String value);
	
	public Integer checkUserTutorAuth(String value);
}
