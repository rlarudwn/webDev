package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class InsertModel {
	public String execute(HttpServletRequest request) {
		String msg="게시판 작성";
		request.setAttribute("msg", msg);
		return "view/insert.jsp";
	}
}
