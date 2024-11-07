package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.BoardDAO;

public class BoardDeleteOkModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");
		BoardDAO dao = BoardDAO.newInstance();
		boolean bCheck = dao.boardDelete(Integer.parseInt(no), pwd);
		try {
			if (bCheck)
				response.sendRedirect("list.jsp");
			else {
				PrintWriter out = response.getWriter();
				out.write("<script>");
				out.write("alert(\"비밀번호가 틀립니다\");");
				out.write("history.back();");
				out.write("</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
