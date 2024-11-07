package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.dao.ZipcodeVO;

public class JoinModel {
	@RequestMapping("member/join.do")
	public String memberJoin(HttpServletRequest request, HttpServletResponse response) {
		return "join.jsp";
	}

	@RequestMapping("member/post.do")
	public String memberPost(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("count", 0);
		return "post.jsp";
	}

	@RequestMapping("member/post_ok.do")
	public String memberPostOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		String dong = request.getParameter("dong");
		List<ZipcodeVO> list = MemberDAO.postFind(dong);
		int count = MemberDAO.postFindCount(dong);

		request.setAttribute("list", list);
		request.setAttribute("count", count);
		return "post.jsp";
	}

	@RequestMapping("member/idCheck_.do")
	public void memberIdCheck(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		boolean bCheck = MemberDAO.idCheck(id);
		String result = "";
		if (bCheck)
			result = "no";
		else
			result = "yes";
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("member/idCheck.do")
	public String idCheck(HttpServletRequest request, HttpServletResponse response) {
		return "idCheck.jsp";
	}

	@RequestMapping("member/idCheck_ok.do")
	public void idCheckOk(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int count = MemberDAO.idCheckCount(id);
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(count));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
