package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

public class UpdateModel implements Model{

	@Override
	public String execute(HttpServletRequest request) {
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.boardDetaildata(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		return "update.jsp";
	}

}
