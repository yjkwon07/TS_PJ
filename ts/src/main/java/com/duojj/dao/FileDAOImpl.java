package com.duojj.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.duojj.vo.FileImageVO;
import com.duojj.vo.LectureVO;

@Repository
public class FileDAOImpl implements FileDAO {
	
	@Inject
	private SqlSession sqlsession;
	
	private static String namespace = "com.duojj.mapper.fileMapper";
	

	@Override
	public void insertImage(FileImageVO vo) throws Exception {
		sqlsession.insert(namespace+".insertImage",vo);
	}

	@Override
	public void deleteImage(FileImageVO vo) throws Exception {
		sqlsession.delete(namespace+".deleteImage",vo);
	}

	@Override
	public List<FileImageVO> getLectureImageList(LectureVO vo) throws Exception {
		return sqlsession.selectList(namespace+".lectureImage",vo);
	}
}

