package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

public class BoardInsertOkModel implements Model{
	public String execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String pwd = request.getParameter("pwd");
			BoardVO vo = new BoardVO();
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			BoardDAO dao = BoardDAO.newInstance();
			dao.boardInsertData(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "insert_ok.jsp";
	}
}
