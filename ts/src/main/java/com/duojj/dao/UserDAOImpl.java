package com.duojj.dao;

import javax.inject.Inject;

import com.duojj.dto.LoginDTO;
import com.duojj.vo.UserVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlsession;

	private static String NAMESPACE = "com.duojj.mapper.userMapper";

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return sqlsession.selectOne(NAMESPACE + ".login", dto);
	}

	@Override
	public void keepLogin(UserVO userVO) {
		sqlsession.update(NAMESPACE + ".keepLogin", userVO);
	}

	@Override
	public UserVO checkUserWithSessionKey(String user_sessionkey) {
		return sqlsession.selectOne(NAMESPACE + ".checkUserWithSessionKey", user_sessionkey);
	}

	@Override
	public Integer checkUserTutorAuth(String user_sessionkey) {
		return sqlsession.selectOne(NAMESPACE + ".checkUserTutorAuth", user_sessionkey);
	}

	@Override
	public UserVO getUserInfoFromTutorId(String user_id) throws Exception {
		return sqlsession.selectOne(NAMESPACE + ".getUserInfoFromTutorId", user_id);
	}

	@Override
	public void RegistertUser(UserVO userVO) throws Exception {
		sqlsession.insert(NAMESPACE + ".RegistertUser", userVO);
	}
}
