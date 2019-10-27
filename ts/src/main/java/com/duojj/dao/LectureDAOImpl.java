package com.duojj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.duojj.vo.LectureVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LectureDAOImpl implements LectureDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.duojj.mapper.lectureMapper";

	@Override
	public void postInitLectureRegister(LectureVO lectureVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".postInitLectureRegister", lectureVO);
	}

	@Override
	public void postLectureRegister(LectureVO lectureVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".postLectureRegister", lectureVO);
	}

	@Override
	public int currentLectureCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".currentLectureCount");
	}

	@Override
	public void postLectureUpdate(LectureVO lectureVO) throws Exception {
		sqlSession.update(NAMESPACE + ".postLectureUpdate", lectureVO);
	}

	@Override
	public LectureVO getDetailLectureClass(int class_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getDetailLectureClass", class_id);
	}

	@Override
	public List<LectureVO> getTutorLectureList(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getTutorLectureList", user_id);
	}

	@Override
	public List<LectureVO> getLatestLectureList(int minCnt, int maxCnt) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("minCnt", minCnt);
		paramMap.put("maxCnt", maxCnt);
		return sqlSession.selectList(NAMESPACE + ".getLatestLectureList", paramMap);
	}
}
