package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.AllJjimDAO;
import com.sist.vo.AllJjimVO;

public class AllJjimModel {
	@RequestMapping("allJjim/insert.do")
	public void allJjimInsert(HttpServletRequest request, HttpServletResponse response) {
		String cno = request.getParameter("cno");
		String type = request.getParameter("type");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("cno", cno);
		map.put("type", type);
		map.put("id", id);
		String result="";
		try {
			AllJjimDAO.allJjimInsert(map);
			AllJjimDAO.allJjimIncrement(map);
			result="OK";
		} catch (Exception e) {
			result=e.getMessage();
		}
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		} catch (Exception e) {}
	}
	@RequestMapping("mypage/mypageJjim.do")
	public String mypageJjim(HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<AllJjimVO> list=	AllJjimDAO.jjimMyPageListData(id);
		request.setAttribute("title", "찜관리");
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/myPageJjim.jsp");
		request.setAttribute("main_jsp", "../mypage/myPageMain.jsp");
		return "../main/main.jsp";	
	}
}
