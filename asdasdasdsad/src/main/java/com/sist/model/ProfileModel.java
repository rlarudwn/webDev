package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.RequestMapping;

public class ProfileModel {

	@RequestMapping("pro/profile.do")
	public String profile(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../pro/profile.jsp");
		return "../main/main.jsp";
	} 
}

