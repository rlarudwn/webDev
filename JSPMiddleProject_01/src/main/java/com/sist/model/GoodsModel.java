package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.vo.GoodsDAO;
import com.sist.vo.GoodsVO;

public class GoodsModel {
	public void goodsListData(HttpServletRequest request) {
		String strPage = request.getParameter("page");
		if (strPage == null)
			strPage = "1";
		int curPage = Integer.parseInt(strPage);
		GoodsDAO dao = GoodsDAO.newInstance();
		List<GoodsVO> list = dao.goodsListData(curPage);
		final int BLOCK = 10;
		int startPage = (curPage - 1) / BLOCK * BLOCK + 1;
		int endPage = startPage + BLOCK - 1;
		int totalPage = dao.goodsTotalPage();
		if (endPage > totalPage)
			endPage = totalPage;
		request.setAttribute("goods_list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
	}
}
