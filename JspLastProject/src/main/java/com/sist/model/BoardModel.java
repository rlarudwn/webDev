package com.sist.model;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.BoardVO;

public class BoardModel {
	@RequestMapping("board/insert.do")
	public String boardInsert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../board/insert.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/insert_ok.do")
	public String boardInsertOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		BoardDAO.boardInsert(vo);
		return "redirect:../board/list.do";
	}

	@RequestMapping("board/list.do")
	public String boardListData(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}
		int curPage = Integer.parseInt(page);
		Map map = new HashMap();
		int start = (curPage - 1) * 10 + 1;
		int end = start + 10 - 1;
		map.put("start", start);
		map.put("end", end);
		List<BoardVO> list = BoardDAO.boardListData(map);
		int rowCount = BoardDAO.boardRowCount();
		int totalPage = (int) (Math.ceil(rowCount / 10.0));
		rowCount = rowCount - (10 * (curPage - 1));
		request.setAttribute("today", new Date());
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("rowCount", rowCount);
		request.setAttribute("main_jsp", "../board/list.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/detail.do")
	public String boardDetailData(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(no));
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../board/detail.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/update.do")
	public String boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		BoardVO vo = BoardDAO.boardUpdateData(Integer.parseInt(no));
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../board/update.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/update_ok.do")
	public void boardUpdateOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String pwd = request.getParameter("pwd");
			String no=request.getParameter("no");
			BoardVO vo = new BoardVO();
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			vo.setNo(Integer.parseInt(no));
			String msg = BoardDAO.boardUpdate(vo);
			PrintWriter out = response.getWriter();

		} catch (Exception e) {
		}
	}
}
