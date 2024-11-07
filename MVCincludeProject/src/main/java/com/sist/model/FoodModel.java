package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.*;
public class FoodModel {
	@RequestMapping("food/detail.do")
	public String foodDetail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}
}
