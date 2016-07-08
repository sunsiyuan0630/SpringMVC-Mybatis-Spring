package com.ssy.child.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssy.child.model.Auth;
import com.ssy.child.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private HttpServletResponse response;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private LoginService lService;
	
	private static final String LOGIN_URL = "/login.html";
	
	@RequestMapping("/user")
	public String gotoMain(String username,String userpwd){
		Auth a = new Auth();
		a.setUsername(username);
		a.setPassword(userpwd);
		Auth auth = lService.userLogin(a);
		if(auth!=null){
			request.getSession().setAttribute("auth", auth);
			return "main";
		}
		else{
			try {
				response.sendRedirect(LOGIN_URL);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
}
