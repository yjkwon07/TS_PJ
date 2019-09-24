package com.duojj.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.duojj.dao.UserDAO;
import com.duojj.dto.LoginDTO;
import com.duojj.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		
		return dao.login(dto);
	}
	
	@Override
	public void keepLogin(String user_id, String user_sessionid, Date next) {
		
		dao.keepLogin(user_id, user_sessionid, next);
	}
	
	@Override
	public UserVO checkLoginBefore(String value) {
		
		return dao.checkUserWithSessionKey(value);
	}
	
	@Override
	public Integer checkUserTutorAuth(String value) {
		
		return dao.checkUserTutorAuth(value);
	}
}
