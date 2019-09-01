package com.duojj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duojj.dao.UserDao;
import com.duojj.vo.UserVO;

@Service("UserService")
public class UserService {
	@Autowired
	UserDao UserDao;

	public List<UserVO> selectGoodsList() throws Exception {
		List<UserVO> keyList = UserDao.selectGoodsList();
		return keyList;
	}
}
