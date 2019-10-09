package com.duojj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.duojj.vo.LectureVO;

@Repository
public class LectureDAOImpl implements LectureDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.duojj.mapper.lectureMapper";

	@Override
	public void postInitLectureRegister(LectureVO vo) throws Exception {
		sqlSession.insert(namespace + ".postInitLectureRegister", vo);
	}

	@Override
	public void postLectureRegister(LectureVO vo) throws Exception {
		sqlSession.insert(namespace + ".postLectureRegister", vo);
	}

	@Override
	public int currentLectureCount() throws Exception {
		return sqlSession.selectOne(namespace + ".currentLectureCount");
	}

	@Override
	public void postLectureUpdate(LectureVO vo) throws Exception {
		sqlSession.update(namespace + ".postLectureUpdate", vo);
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
	public List<LectureVO> getLatestLectureList(Integer minCnt, Integer maxCnt) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("minCnt", minCnt);
		paramMap.put("maxCnt", maxCnt);
		return sqlSession.selectList(namespace+".getLatestLectureList",paramMap);
	}
}

