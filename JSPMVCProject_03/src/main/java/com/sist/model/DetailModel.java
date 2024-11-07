package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import com.sist.dao.*;
public class DetailModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.boardDetaildata(Integer.parseInt(no));
		request.setAttribute("detail", vo);
		return "detail.jsp";
	}

}
