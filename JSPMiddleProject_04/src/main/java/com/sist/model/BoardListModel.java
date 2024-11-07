package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

public class BoardListModel implements Model{
	public String execute(HttpServletRequest request) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";

		int curPage = Integer.parseInt(page);
		BoardDAO dao = BoardDAO.newInstance();
		List<BoardVO> list = dao.boardListData(curPage);
		int totalPage = dao.boardTotalPage();

		request.setAttribute("boardList", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("date", new SimpleDateFormat("YYYY-MM-dd").format(new Date()));
		return "list.jsp";
	}
}
