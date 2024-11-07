package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

public class InsertOkModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		BoardDAO dao=BoardDAO.newInstance();
		dao.boardInsert(vo);
		return "redirect:list.do";
	}

}
