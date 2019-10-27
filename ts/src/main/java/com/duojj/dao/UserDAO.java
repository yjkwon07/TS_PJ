package com.duojj.dao;

import com.duojj.dto.LoginDTO;
import com.duojj.vo.UserVO;

public interface UserDAO {

	// 로그인
	public UserVO login(LoginDTO dto) throws Exception;

	// 로그인한 사용자의 sessionkey와 sessionLimit를 업데이트하는 기능
	public void keepLogin(UserVO userVO);

	// 기록된 값으로 사용자의 정보를 조회하는 기능
	public UserVO checkUserWithSessionKey(String user_sessionkey);

	// 유저가 튜터인지 튜터가 아닌지 user_sessionkey으로 확인하는 기능
	public Integer checkUserTutorAuth(String user_sessionkey);

	// 튜터id로 유저정보 가져오는 기능
	public UserVO getUserInfoFromTutorId(String user_id) throws Exception;

	// 유저 정보 등록
	public void RegistertUser(UserVO userVO) throws Exception;
}
