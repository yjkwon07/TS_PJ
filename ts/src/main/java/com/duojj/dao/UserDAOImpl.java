package com.duojj.dao;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.duojj.dto.LoginDTO;
import com.duojj.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	private static String namespace = "com.duojj.mapper.userMapper";

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		
		return sqlsession.selectOne(namespace+".login", dto);
	}
	
	@Override
	public void keepLogin(String user_id, String user_sessionId, Date next) {
		Map<String, Object> paraMap = new HashMap<String, Object> ();
		
		paraMap.put("user_id", user_id);
		paraMap.put("user_sessionId", user_sessionId);
		paraMap.put("next", next);
		
		
		sqlsession.update(namespace+ ".keepLogin" ,paraMap);
	}
	
	@Override
	public UserVO checkUserWithSessionKey(String value) {
		
		return sqlsession.selectOne(namespace+".checkUserWithSessionKey",value);
	}
	
	@Override
	public Integer checkUserTutorAuth(String value) {
		
		return sqlsession.selectOne(namespace+".checkUserTutorAuth", value);
	}
}
