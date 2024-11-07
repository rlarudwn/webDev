package com.sist.model;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.*;
import com.sist.dao.*;
public class MusicModel {
	@RequestMapping("music/list.do")
	public String musicList(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		MusicDAO dao=MusicDAO.newInstance();
		List<MusicVO> list= dao.musicListData(curPage);
		int totalPage=dao.musicTotalPage();
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../music/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("music/detail.do")
	public String musicDetail(HttpServletRequest request, HttpServletResponse response) {
		String mno=request.getParameter("mno");
		request.setAttribute("main_jsp", "../music/detail.jsp");
		return "../main/main.jsp";
	}
}
