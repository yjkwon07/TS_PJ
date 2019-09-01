package com.duojj.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.duojj.vo.UserVO;

@Repository("UserDao")
public class UserDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<UserVO> selectGoodsList() throws DataAccessException {
		List<UserVO> goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsList");
		return goodsList;
	}
}
