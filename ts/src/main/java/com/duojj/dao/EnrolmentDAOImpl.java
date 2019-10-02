package com.duojj.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.duojj.vo.EnrolmentVO;

@Repository
public class EnrolmentDAOImpl implements EnrolmentDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.duojj.mapper.enrolmentMapper";
	 
	@Override
	public void tuteeLectureRegister(EnrolmentVO vo) throws Exception {
		
		sqlSession.insert(namespace+".tuteeLectureRegister",vo);
	}
}
