package com.duojj.dao;

import java.util.List;

import javax.inject.Inject;

import com.duojj.vo.EnrolmentVO;
import com.duojj.vo.LectureVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EnrolmentDAOImpl implements EnrolmentDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.duojj.mapper.enrolmentMapper";

	@Override
	public void tuteeLectureRegister(EnrolmentVO enrolmentVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".tuteeLectureRegister", enrolmentVO);
	}

	@Override
	public List<LectureVO> getEnrolmentLecture(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getEnrolmentLecture", user_id);
	}
	
	@Override
	public EnrolmentVO checkLecture(EnrolmentVO enrolmentVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".checkLecture", enrolmentVO);
	}
}
