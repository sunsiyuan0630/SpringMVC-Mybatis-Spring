package com.ssy.child.service;

import org.springframework.stereotype.Service;

import com.ssy.child.model.Auth;

public interface LoginService {

	public Auth userLogin(Auth auth);
}
