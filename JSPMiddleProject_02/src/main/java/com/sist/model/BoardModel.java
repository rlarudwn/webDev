package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;

public class BoardModel {
	public void boardListData(HttpServletRequest request) {
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
	}

	public void boardInsert_ok(HttpServletRequest request, HttpServletResponse response) {
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
			response.sendRedirect("list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void boardDetailData(HttpServletRequest request) {
		String no = request.getParameter("no");
		BoardDAO dao = BoardDAO.newInstance();
		BoardVO vo = dao.boardDetailData(Integer.parseInt(no));
		request.setAttribute("no", no);
		request.setAttribute("boardVo", vo);
	}

	public void boardUpdateData(HttpServletRequest request) {
		String no = request.getParameter("no");
		BoardDAO dao = BoardDAO.newInstance();
		BoardVO vo = dao.boardUpdateData(Integer.parseInt(no));
		request.setAttribute("boardVo", vo);
	}

	public void boardUpdate_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			String no = request.getParameter("no");
			String name = request.getParameter("name");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String pwd = request.getParameter("pwd");
			BoardVO vo = new BoardVO();
			vo.setNo(Integer.parseInt(no));
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			BoardDAO dao = BoardDAO.newInstance();
			boolean bCheck = dao.boardUpdate(vo);
			if (bCheck)
				response.sendRedirect("detail.jsp?no=" + no);
			else {
				PrintWriter out = response.getWriter();
				out.write("<script>");
				out.write("alert(\"비밀번호가 틀립니다\");");
				out.write("history.back();");
				out.write("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void boardDelete_ok(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");
		BoardDAO dao = BoardDAO.newInstance();
		boolean bCheck = dao.boardDelete(Integer.parseInt(no), pwd);
		try {
			if (bCheck)
				response.sendRedirect("list.jsp");
			else {
				PrintWriter out = response.getWriter();
				out.write("<script>");
				out.write("alert(\"비밀번호가 틀립니다\");");
				out.write("history.back();");
				out.write("</script>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
