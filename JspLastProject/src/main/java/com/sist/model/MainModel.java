package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;

public class MainModel {
	@RequestMapping("main/main.do")
	public String mainHome(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "home.jsp");
		return "../main/main.jsp";
	}
}
