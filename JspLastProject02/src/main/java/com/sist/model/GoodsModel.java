package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsVO;

public class GoodsModel {
	private String[] tables = { "", "GOODS_ALL", "GOODS_BEST", "GOODS_NEW", "GOODS_SPECIAL" };
	private String[] titles = { "", "전체상품", "인기상품", "신상품", "특가상품" };

	@RequestMapping("goods/list.do")
	public String goodsList(HttpServletRequest request, HttpServletResponse response) {
		String cno = request.getParameter("cno");
		if (cno == null)
			cno = "1";
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int row = 20;
		int start = (curPage - 1) * row + 1;
		int end = start + curPage - 1;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("table_name", tables[Integer.parseInt(cno)]);
		List<GoodsVO> gList = GoodsDAO.goodsListData(map);
		int totalPage = GoodsDAO.goodsTotalPage(tables[Integer.parseInt(cno)]);
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > totalPage)
			endPage = totalPage;

		request.setAttribute("cno", cno);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("gList", gList);
		request.setAttribute("title", titles[Integer.parseInt(cno)]);
		request.setAttribute("main_jsp", "../goods/list.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}

	@RequestMapping("goods/detail.do")
	public String goodsDetail(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		String no=request.getParameter("no");
		Map map=new HashMap();
		map.put("no", no);
		map.put("table_name", tables[Integer.parseInt(cno)]);
		GoodsVO vo=GoodsDAO.goodDetailData(map);
		String price=vo.getGoods_price();
		price=price.replaceAll("[^0-9]", "");
		vo.setPrice(Integer.parseInt(price));
		request.setAttribute("type", cno);
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../goods/detail.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
}
