package com.ssy.child.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logic")
public class LogicController {
	@RequestMapping("/main")
	public String gotoMain(){
		return "main";
	}
}
