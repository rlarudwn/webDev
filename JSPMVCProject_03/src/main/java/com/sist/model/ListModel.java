package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

public class ListModel implements Model{

	@Override
	public String execute(HttpServletRequest request) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		BoardDAO dao=BoardDAO.newInstance();
		List<BoardVO> list=dao.boardListData(curPage);
		
		
		int count=dao.boardRowCount();
		int totalPage=(int)(Math.ceil(count/10.0));
		count=count-((curPage*10)-10);
		
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totay", new SimpleDateFormat("YYYY-MM-dd").format(new Date()));
		request.setAttribute("count", count);
		return "list.jsp";
	}

}
