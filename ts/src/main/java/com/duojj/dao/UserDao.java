package com.duojj.dao;

import java.util.Date;

import com.duojj.dto.LoginDTO;
import com.duojj.vo.UserVO;

public interface UserDAO {
	
	//로그인
	public UserVO login(LoginDTO dto)throws Exception;
	
	//로그인한 사용자의 sessionkey와 sessionLimit를 업데이트하는 기능
	public void keepLogin(String user_id, String sessionId, Date next);
	
	//기록된 값으로 사용자의 정보를 조회하는 기능
	public UserVO checkUserWithSessionKey(String value);
	
}
