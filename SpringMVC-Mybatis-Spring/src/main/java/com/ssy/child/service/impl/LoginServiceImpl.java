package com.ssy.child.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssy.child.dao.LoginDao;
import com.ssy.child.model.Auth;
import com.ssy.child.service.LoginService;
@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDao lDao;
	
	@Override
	public Auth userLogin(Auth auth) {
		Auth a = lDao.getUser(auth);
		return a;
	}

}
