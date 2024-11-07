package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;
/*
public class NoticeBoardModel {
	private String[] types = { "", "일반공지", "Books공지", "Music공지", "잔체공지" };

	@RequestMapping("notice/list.do")
	public String noticeboard_list(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter(page);
		int curpage=Integer.parseInt(page);
		int rowSize = 15;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeBoardVO> list=NoticeBoardDAO.noticeListData(map);
		   for(NoticeBoardVO vo:list)
		   {
			   vo.setNotice_type(types[vo.getType()]);
		   }
		   int count=NoticeBoardDAO.noticeRowCount();
		   int totalpage=(int)(Math.ceil(count/15.0));
		   count=count-((curpage*rowSize)-rowSize);
		   
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("count", count);
		   request.setAttribute("noticeList", list);
		   request.setAttribute("main_jsp", "../notice/list.jsp");
		
		return "../main/main.jsp";

	}

	// 상세보기 -----------------------------------------------------------------
}
*/
