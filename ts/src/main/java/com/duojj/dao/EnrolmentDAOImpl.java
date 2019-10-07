package com.duojj.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.duojj.vo.EnrolmentVO;
import com.duojj.vo.LectureVO;

@Repository
public class EnrolmentDAOImpl implements EnrolmentDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.duojj.mapper.enrolmentMapper";

	@Override
	public void tuteeLectureRegister(EnrolmentVO vo) throws Exception {

		sqlSession.insert(namespace + ".tuteeLectureRegister", vo);
	}

	@Override
	public List<LectureVO> getEnrolmentLecture(String user_id) throws Exception {
		return sqlSession.selectList(namespace + ".getEnrolmentLecture", user_id);
	}
	
	@Override
	public Integer checkLecture(EnrolmentVO vo) throws Exception {
		return sqlSession.selectOne(namespace+".checkLecture", vo);
	}
}
