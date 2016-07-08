package com.ssy.child.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssy.child.dao.LoginDao;
import com.ssy.child.mapper.LoginMapper;
import com.ssy.child.model.Auth;
@Repository
public class LoginDaoImpl implements LoginDao{
	@Autowired
	private SqlSessionFactory sqlSessionFactory; 
	@Override
	public Auth getUser(Auth auth) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Auth a = new Auth();
		try {
			LoginMapper loginMapper = sqlSession.getMapper(LoginMapper.class);
			a = loginMapper.selectUser(auth);
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			sqlSession.close();
		}
		return a;
	}

}
