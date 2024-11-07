package com.sist.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

public class MemberModel {
	@RequestMapping("member/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		return "../member/login.jsp";
	}
	@RequestMapping("member/login_ok.do")
	public void loginOK(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		MemberVO vo=MemberDAO.memberLogIn(id, pwd);
		if(vo.getMsg().equals("OK")) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("nickname", vo.getNickname());
		}
		try {
			PrintWriter out=response.getWriter();
			out.write(vo.getMsg());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("member/logOut.do")
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.invalidate();
		try {
			PrintWriter out=response.getWriter();
			out.write("OK");
		} catch (Exception e) {}
	}
}
