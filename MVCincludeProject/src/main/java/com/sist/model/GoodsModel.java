package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.*;
import com.sist.dao.GoodsDAO;
import com.sist.dao.GoodsVO;

public class GoodsModel {
	@RequestMapping("goods/list.do")
	public String goodsList(HttpServletRequest request, HttpServletResponse response) {
		GoodsDAO dao = GoodsDAO.newInstance();
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int totalPage = dao.goodsTotalPage();
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		List<GoodsVO> list = dao.goodsListData(curPage);

		request.setAttribute("goods", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../goods/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("goods/detail.do")
	public String goodsDetail(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		GoodsDAO dao=GoodsDAO.newInstance();
		GoodsVO vo=dao.goodsDetailData(Integer.parseInt(no));
		
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../goods/detail.jsp");
		return "../main/main.jsp";
	}
}
