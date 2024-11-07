package com.sist.model;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;

public class BoardModel {
	private BoardDAO dao = BoardDAO.newInstance();

	@RequestMapping("board/list.do")
	public String boardList(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int count = dao.boardTotalCount();
		int totalPage = (int) (Math.ceil(count / 10.0));

		count = count - ((curPage - 1) * 10);
		List<BoardVO> list = dao.boardListData(curPage);
		
		CommonsModel.commonsData(request);
		request.setAttribute("today", new SimpleDateFormat("YYYY-MM-dd").format(new Date()));
		request.setAttribute("count", count);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../board/list.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/detail.do")
	public String boardDetail(HttpServletRequest request, HttpServletResponse response) {
		String no_ = request.getParameter("no");
		int no = Integer.parseInt(no_);
		int prev = dao.boardPrev(no);
		int next = dao.boardNext(no);

		BoardVO vo = dao.boardDetailData(no);
		BoardVO vo_prev = new BoardVO();
		BoardVO vo_next = new BoardVO();
		if (prev != 0)
			vo_prev = dao.boardDetailData(prev);
		if (next != 0)
			vo_next = dao.boardDetailData(next);
		
		CommonsModel.commonsData(request);
		request.setAttribute("detail", vo);
		request.setAttribute("prev", vo_prev);
		request.setAttribute("next", vo_next);
		request.setAttribute("main_jsp", "../board/detail.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/insert.do")
	public String boardInsert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../board/insert.jsp");

		CommonsModel.commonsData(request);
		return "../main/main.jsp";
	}

	@RequestMapping("board/insert_ok.do")
	public String boardInsertOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		BoardVO vo = new BoardVO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		dao.boardInsert(vo);
		return "redirect:../board/list.do";
	}

	@RequestMapping("board/update.do")
	public String boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		BoardVO vo = dao.boardUpdateData(Integer.parseInt(no));

		CommonsModel.commonsData(request);
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../board/update.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/update_ok.do")
	public void boardUpdateOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		BoardVO vo = new BoardVO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		String no = request.getParameter("no");
		vo.setNo(Integer.parseInt(no));
		boolean bCheck = dao.boardUpdate(vo);
		System.out.println(bCheck);
		try {
			PrintWriter out = response.getWriter();
			if (bCheck) {
				out.write("<script>");
				out.write("location.href=\"../board/detail.do?no=" + no + "\";");
				out.write("</script>");
			} else {
				out.write("<script>");
				out.write("alert(\"Password Fail\");");
				out.write("history.back();");
				out.write("</script>");
			}
		} catch (Exception e) {
		}
	}

	@RequestMapping("board/delete.do")
	public String boardDelete(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");

		CommonsModel.commonsData(request);
		request.setAttribute("no", no);
		request.setAttribute("main_jsp", "../board/delete.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/delete_ok.do")
	public void boardDeleteOk(HttpServletRequest request, HttpServletResponse response) {
		BoardVO vo=new BoardVO();
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
		try {
			PrintWriter out = response.getWriter();
			if (bCheck) {
				out.write("<script>");
				out.write("location.href=\"../board/list.do\";");
				out.write("</script>");
			} else {
				out.write("<script>");
				out.write("alert(\"Password Fail\");");
				out.write("history.back();");
				out.write("</script>");
			}
		} catch (Exception e) {
		}
	}
}
/*
HttpServletRequest request, HttpServletResponse response
*/