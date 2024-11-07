package com.sist.model;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.LocationVO;

public class FoodModel {
	String[] guList = { "전체", "강서구", "양천구", "구로구", "마포구", "영등포구", "금천구", "은평구", "서대문구", "동작구", "관악구", "종로구", "중구", "용산구",
			"서초구", "강북구", "성북구", "도봉구", "동대문구", "성동구", "강남구", "노원구", "중랑구", "광진구", "송파구", "강동구" };

	@RequestMapping("food/list.do")
	public String foodList(HttpServletRequest request, HttpServletResponse response) {
		FoodDAO dao = FoodDAO.newInstance();
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int totalPage = dao.foodTotalPage();
		int curPage = Integer.parseInt(page);
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		List<FoodVO> list = dao.foodListData(curPage);

		CommonsModel.commonsData(request);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../food/list.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("food/before_detail.do")
	public String foodBeforeDetail(HttpServletRequest request, HttpServletResponse response) {
		String fno = request.getParameter("fno");
		Cookie cookie = new Cookie("food_" + fno, fno);
		cookie.setMaxAge(60 * 60 * 24);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "redirect:../food/detail.do?fno=" + fno;
	}

	@RequestMapping("food/detail.do")
	public String foodDetail(HttpServletRequest request, HttpServletResponse response) {
		String fno = request.getParameter("fno");
		FoodDAO dao = FoodDAO.newInstance();
		FoodVO vo = dao.foodDetailData(Integer.parseInt(fno));
		String addr = vo.getAddr();
		addr = addr.substring(addr.indexOf(" "));
		String addr2 = addr.trim();
		addr2 = addr2.substring(0, addr2.indexOf(" "));
		List<FoodVO> fList = dao.foodLocation(addr2);

		CommonsModel.commonsData(request);
		request.setAttribute("addr", addr2);
		request.setAttribute("flist", fList);
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("food/find.do")
	public String foodFind(HttpServletRequest request, HttpServletResponse response) {
		FoodDAO dao = FoodDAO.newInstance();
		String page = request.getParameter("page");
		String gu = request.getParameter("gu");
		if (gu == null)
			gu = "4";
		String addr = guList[Integer.parseInt(gu)];
		if (page == null)
			page = "1";
		int totalPage = dao.foodFindTotalPage(addr);
		int count = dao.foodFindCount(addr);
		int curPage = Integer.parseInt(page);
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		List<FoodVO> list = dao.foodFindData(curPage, addr);

		CommonsModel.commonsData(request);
		request.setAttribute("count", count);
		request.setAttribute("fd", addr);
		request.setAttribute("gu", gu);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../food/find.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("food/review.do")
	public String foodReview(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("fno");
		FoodDAO dao=FoodDAO.newInstance();
		FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
		
		request.setAttribute("fvo", vo);
		request.setAttribute("main_jsp", "../food/review.jsp");
		return "../main/main.jsp";
	}
}
