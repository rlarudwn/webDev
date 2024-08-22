package com.sist.model;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

import oracle.net.aso.l;
import oracle.security.o3logon.a;

public class BoardModel {
	@RequestMapping("board/list.do")
	public String boardList(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int count = BoardDAO.boardRowCount();
		int totalPage = (int) (Math.ceil(count / 10.0));
		count = count - ((curPage - 1) * 10);

		List<BoardVO> list = BoardDAO.boardListData(curPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("count", count);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		return "list.jsp";
	}

	@RequestMapping("board/detail.do")
	public String boardDetail(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(no));
		request.setAttribute("detail", vo);
		return "detail.jsp";
	}

	@RequestMapping("board/insert.do")
	public String boardInsert(HttpServletRequest request, HttpServletResponse response) {
		return "insert.jsp";
	}

	@RequestMapping("board/insert_ok.do")
	public String boardInsertOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
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
		return "redirect:list.do";
	}

	@RequestMapping("board/delete.do")
	public void boardDelete(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");
		boolean bCheck = BoardDAO.boardDelete(Integer.parseInt(no), pwd);
		System.out.println("check");
		String result = "";
		if (bCheck) {
			result = "yes";
		} else {
			result = "no";
		}
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (Exception e) {
		}
	}

	@RequestMapping("board/update.do")
	public String boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		BoardVO vo = BoardDAO.boardUpdateData(Integer.parseInt(no));
		request.setAttribute("detail", vo);
		return "update.jsp";
	}

	@RequestMapping("board/update_ok.do")
	public void boardUpdateOk(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String no = request.getParameter("no");

		BoardVO vo = new BoardVO();
		vo.setNo(Integer.parseInt(no));
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);

		String result = "";
		boolean bCheck = BoardDAO.boardUpdate(vo);
		if (bCheck) {
			result = "yes";
		}
		else {
			result = "no";
		}
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (Exception e) {
		}
	}
}
