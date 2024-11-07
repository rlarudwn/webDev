package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.SeoulDAO;
import com.sist.vo.LocationVO;

public class SeoulModel {
	@RequestMapping("seoul/list.do")
	public String seoulList(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		SeoulDAO dao=SeoulDAO.newInstance();
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		int startPage=(curPage-1)/10*10+1;
		int endPage=startPage+10-1;
		int totalPage=dao.seoulTotalPage();
		List<LocationVO> list=dao.seoulListData(curPage);
		
		CommonsModel.commonsData(request);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../seoul/list.jsp");
		return "../main/main.jsp";
	}
}
