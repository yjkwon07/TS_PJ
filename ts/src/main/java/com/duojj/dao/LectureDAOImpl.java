package com.duojj.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.duojj.vo.LectureVO;

@Repository
public class LectureDAOImpl implements LectureDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.duojj.mapper.lectureMapper";
	
	@Override
	public void postLectureRegister(LectureVO vo) throws Exception {
		
		sqlSession.insert(namespace+".postLectureRegister",vo);
	}
	
	
}
