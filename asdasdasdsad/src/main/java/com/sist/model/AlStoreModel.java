package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

import controller.RequestMapping;

import com.sist.controller.*;

public class AlStoreModel {

	@RequestMapping("music/alstoreList.do")
	public String alstore_list(HttpServletRequest request, HttpServletResponse response) {

		String page = request.getParameter("page");
		if (page == null)
			page = "1";

		int curPage = Integer.parseInt(page);
		int rowSize = 20;
		int start = (rowSize * curPage) - (rowSize - 1);
		int end = rowSize * curPage;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<AlStoreVO> alstoreList = AlStoreDAO.alStoreListData(map);
		int totalPage = AlStoreDAO.alStoreTotalPage(map);

		final int BLOCK = 10;
		int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalPage)
			endPage = totalPage;

		request.setAttribute("alstoreList", alstoreList);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		System.out.println(alstoreList.size());

		request.setAttribute("main_jsp", "../music/alstoreList.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("music/alstoreDetail.do")
	public String alstore_detail(HttpServletRequest request, HttpServletResponse response) {

		String ano = request.getParameter("ano"); // 데이터베이스에서 값을 가지고 온다
		AlStoreVO vo = AlStoreDAO.alStoreDetailData(Integer.parseInt(ano));

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		Map map = new HashMap();
		map.put("tno", ano);
		map.put("type", 3);

//		int rcount = ReviewDAO.reviewCount(map);
//		double avg = ReviewDAO.reviewAverage(map);
//		request.setAttribute("rcount", rcount);
//		request.setAttribute("avg", avg);
		request.setAttribute("id", id);
		request.setAttribute("vo", vo);

		request.setAttribute("main_jsp", "../music/alstoreDetail.jsp");
		return "../main/main.jsp";
	}

}
