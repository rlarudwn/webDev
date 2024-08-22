package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.ReplyBoardDAO;
import com.sist.vo.ReplyBoardVO;

public class ReplyBoardModel {
	@RequestMapping("replyBoard/list.do")
	public String replyBoardList(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		int rowSize=15;
		int start=(curPage-1)*rowSize+1;
		int end=start+rowSize-1;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ReplyBoardVO> list=ReplyBoardDAO.replyBoardListData(map);
		int count=ReplyBoardDAO.replyBoardRowCount();
		int totalPage=(int)(Math.ceil(count/15.0));
		count=count-(curPage-1)*rowSize;
		
		request.setAttribute("count", count);
		request.setAttribute("rbList", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("main_jsp", "../replyBoard/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("replyBoard/insert.do")
	public String replyBoardInsert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../replyBoard/insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("replyBoard/insertOk.do")
	public String replyBoardInsertOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		ReplyBoardVO vo=new ReplyBoardVO();
		vo.setId(id);
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		ReplyBoardDAO.replyBoardInsert(vo);
		return "redirect:../replyBoard/list.do";
	}
	
}
