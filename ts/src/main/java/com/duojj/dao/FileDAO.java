package com.duojj.dao;

import com.duojj.vo.FileImageVO;

public interface FileDAO {
	public void insertImage(FileImageVO vo)throws Exception;
	
	public void deleteImage(FileImageVO vo)throws Exception;

}
