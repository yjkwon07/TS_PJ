package com.duojj.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.duojj.vo.FileImageVO;

@Repository
public class FileDAOImpl implements FileDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.duojj.mapper.fileMapper";
	

	@Override
	public void insertImage(FileImageVO vo) throws Exception {
		session.insert(namespace+".insertImage",vo);
	}

	@Override
	public void deleteImage(FileImageVO vo) throws Exception {
		session.delete(namespace+".deleteImage",vo);
	}
}

