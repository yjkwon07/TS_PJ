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
	private SqlSession session;
	
	private static String namespace = "com.duojj.mapper.userMapper";

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		
		return session.selectOne(namespace+".login", dto);
	}
	
	@Override
	public void keepLogin(String user_id, String user_sessionId, Date next) {
		Map<String, Object> paraMap = new HashMap();
		
		paraMap.put("user_id", user_id);
		paraMap.put("user_sessionId", user_sessionId);
		paraMap.put("next", next);
		
		
		session.update(namespace+ ".keepLogin" ,paraMap);
	}
	
	@Override
	public UserVO checkUserWithSessionKey(String value) {
		
		return session.selectOne(namespace+".checkUserWithSessionKey",value);
	}
}
