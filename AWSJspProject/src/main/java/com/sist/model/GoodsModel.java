package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.GoodsDAO;
import com.sist.dao.MusicDAO;
import com.sist.vo.GoodsVO;
import com.sist.vo.MusicVO;

public class GoodsModel {
	@RequestMapping("goods/list.do")
	public String goodsList(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int start = (curPage - 1) * 12 + 1;
		int end = start + 12 - 1;
		int totalPage = GoodsDAO.goodsTotalPage();
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<GoodsVO> list = GoodsDAO.goodsListData(map);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../goods/list.jsp");
		return "../main/main.jsp";
	}
}
