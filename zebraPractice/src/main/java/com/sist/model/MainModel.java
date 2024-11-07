package com.sist.model;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.dao.MemberVO;
import com.sist.dao.PokeDAO;
import com.sist.dao.PokeVO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainModel {
	@RequestMapping("main/main.do")
	public String mainHome(HttpServletRequest request, HttpServletResponse response) {
		PokeDAO dao = PokeDAO.newInstance();
		List<PokeVO> list_best = dao.pokeBestData();
		List<PokeVO> list_card = dao.pokeCardListData();
		System.out.println(((PokeVO) list_best.get(1)).getName());
		request.setAttribute("best", list_best);
		request.setAttribute("card", list_card);
		request.setAttribute("main_jsp", "../poke/home.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("member/login_ok.do")
	public String memberLogin(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		HttpSession session = request.getSession();
		MemberDAO dao = MemberDAO.newInstance();
		MemberVO vo = dao.isLogin(id, pwd);
		if (vo.getMsg().equals("OK")) {
			session.setAttribute("id", id);
			session.setAttribute("name", vo.getName());
		} else {
			vo.getMsg().equals("NOID");
		}

		return "redirect:../main/main.do";
	}

	@RequestMapping("member/logout_ok.do")
	public String memberLogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}
}