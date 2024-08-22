package com.sist.model;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.AllJjimDAO;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

public class FoodModel {
	@RequestMapping("food/list.do")
	public String foodList(HttpServletRequest request, HttpServletResponse response) {
		int count = FoodDAO.foodListCount();
		String page = request.getParameter("page");
		int totalPage = (int) (Math.ceil(count / 12.0));
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int row = 12;
		int start = (curPage - 1) * row + 1;
		int end = start + row - 1;
		final int BLOCK = 10;
		int startPage = (curPage - 1) / BLOCK * BLOCK + 1;
		int endPage = startPage + BLOCK - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<FoodVO> list = FoodDAO.foodListData(map);
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("count", count);
		request.setAttribute("main_jsp", "../food/list.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}

	@RequestMapping("food/detail_before.do")
	public String foodDetailBefore(HttpServletRequest request, HttpServletResponse response) {
		String fno = request.getParameter("fno");
		String type = request.getParameter("type");

		int no = 0;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				if (cookies[i].getName().startsWith("food_")) {
					String strno = cookies[i].getName();
					strno = strno.substring(strno.indexOf("_") + 1);
					if (no < Integer.parseInt(strno))
						no = Integer.parseInt(strno);
				}
			}
			no = no + 1;
		}
		Cookie cookie = new Cookie("food_" + no, fno);
		cookie.setMaxAge(60 * 60 * 24);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "redirect:../food/detail.do?fno =" + fno + "&type=" + type;
	}

	@RequestMapping("food/detail.do")
	public String foodDetail(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");
		String fno = request.getParameter("fno");
		FoodVO vo = FoodDAO.foodDetailData(Integer.parseInt(fno));
		String addr = vo.getAddress();
		String addr1 = addr.substring(addr.indexOf(" ") + 1);
		String addr2 = addr1.substring(0, addr1.indexOf(" "));
		List<FoodVO> nList = FoodDAO.foodNearListData(addr2);
		boolean bCheck = false;
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if (id != null) {
			Map map = new HashMap();
			map.put("cno", fno);
			map.put("type", type);
			map.put("id", id);
			int count = AllJjimDAO.allJjimCheck(map);
			if (count == 1)
				bCheck = true;
			else
				bCheck = false;
		}
		request.setAttribute("check", bCheck);
		request.setAttribute("nList", nList);
		request.setAttribute("detail", vo);
		request.setAttribute("type", type);
		request.setAttribute("main_jsp", "../food/detail.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}

	@RequestMapping("food/find.do")
	public String foodFind(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
		}
		String ss = request.getParameter("ss");
		if (ss == null)
			ss = "마포";
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int row = 20;
		int start = (curPage - 1) * row + 1;
		int end = start + row - 1;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("ss", ss);

		List<FoodVO> list = FoodDAO.foodFindListData(map);
		final int BLOCK = 10;
		int totalPage = FoodDAO.foodFindTotalPage(ss);
		int startPage = (curPage - 1) / BLOCK * BLOCK + 1;
		int endPage = startPage + BLOCK - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../food/find.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
}
