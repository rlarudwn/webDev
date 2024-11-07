package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

public class FoodModel {
	public String foodListData(HttpServletRequest request) {
		String page=request.getParameter("page");
		FoodDAO dao=FoodDAO.newInstance();
		final int BLOCK=10;
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		dao.foodListData(curPage);
		List<FoodVO> list=dao.foodListData(curPage);
		int totalPage=dao.foodTotalPage();
		int startPage=(curPage-1)/BLOCK*BLOCK+1;
		int endPage=startPage+BLOCK-1;
		if(endPage>totalPage)
			endPage=totalPage;
		request.setAttribute("foodList", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		
		return "food_list.jsp?page="+page;
	}
	public String foodDetailData(HttpServletRequest request) {
		String jsp="";
		String no=request.getParameter("no");
		FoodDAO dao=FoodDAO.newInstance();
		FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
		return "food_detail.jsp?no="+no;
	}
}
