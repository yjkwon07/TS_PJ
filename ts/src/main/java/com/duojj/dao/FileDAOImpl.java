package com.duojj.dao;

import java.util.List;

import javax.inject.Inject;

import com.duojj.vo.FileImageVO;
import com.duojj.vo.LectureVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAOImpl implements FileDAO {

	@Inject
	private SqlSession sqlsession;

	private static final String NAMESPACE = "com.duojj.mapper.fileMapper";

	@Override
	public void insertImage(FileImageVO fileImageVO) throws Exception {
		sqlsession.insert(NAMESPACE + ".insertImage", fileImageVO);
	}

	@Override
	public void deleteImage(FileImageVO fileImageVO) throws Exception {
		sqlsession.delete(NAMESPACE + ".deleteImage", fileImageVO);
	}

	@Override
	public List<FileImageVO> getLectureImageList(LectureVO lectureVO) throws Exception {
		return sqlsession.selectList(NAMESPACE + ".lectureImage", lectureVO);
	}
}
