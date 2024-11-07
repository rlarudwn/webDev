package com.sist.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

public class MemberModel {
	@RequestMapping("member/logIn.do")
	public void memberLogIn(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		MemberVO vo=MemberDAO.isLogin(id, pwd);
		if(vo.getMsg().equals("OK")) {
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("admin", vo.getAdmin());
		}
		try {
			PrintWriter out=response.getWriter();
			out.write(vo.getMsg());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("member/logOut.do")
	public void memberLogOut(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session=request.getSession();
			session.invalidate();
			PrintWriter out=response.getWriter();
			out.write("OK");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("member/join.do")
	public String memberJoin(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "../main/main.jsp";
	}
}
