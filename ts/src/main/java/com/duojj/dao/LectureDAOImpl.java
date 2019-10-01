package com.duojj.dao;

import java.util.List;

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
	
	@Override
	public LectureVO getDetailLectureClass(Integer class_id) throws Exception {
		
		return sqlSession.selectOne(namespace+".getDetailLectureClass",class_id);
	}
	
	@Override
	public List<LectureVO> getTutorLectureList(String user_id) throws Exception {
		
		return sqlSession.selectList(namespace+".getTutorLectureList", user_id);
	}
	
	@Override
	public Integer lastColumnClassId() throws Exception {
		
		return sqlSession.selectOne(namespace+".lastColumnClassId");
	}
}
