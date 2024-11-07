package com.sist.model;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;

public class ShoesModel {
	public void shoesListData(HttpServletRequest request) {
		ShoesDAO dao = ShoesDAO.newInstance();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String strPage = request.getParameter("page");
		if (strPage == null)
			strPage = "1";
		int curPage = Integer.parseInt(strPage);
		String key = request.getParameter("key");
		if (key == null)
			key = "";
		else
			key = key.trim();
		String type = request.getParameter("type");
		if (type == null)
			type = "1";
		final int BLOCK = 10;
		int startPage = (curPage - 1) / BLOCK * BLOCK + 1;
		int endPage = startPage + BLOCK - 1;
		int totalPage = dao.shoesFindTotalPage(Integer.parseInt(type), key);
		System.out.println(totalPage);
		if (endPage > totalPage)
			endPage = totalPage;
		List<ShoesVO> list = dao.shoesListData(Integer.parseInt(type), key, curPage);
		request.setAttribute("shoesList", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("type", type);
		request.setAttribute("key", key);
	}

	public void shoesDetailData(HttpServletRequest request) {
		ShoesDAO dao = ShoesDAO.newInstance();
		String no = request.getParameter("no");
		ShoesVO vo = dao.shoesDetailData(Integer.parseInt(no));
		request.setAttribute("no", no);
		request.setAttribute("shoesVo", vo);
	}

	public void shoesRankListData(HttpServletRequest request) {
		ShoesDAO dao = ShoesDAO.newInstance();
		List<ShoesVO> list = dao.shoesRankListData();
		request.setAttribute("rank", list);
	}
}
