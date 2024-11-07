package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.ShoesDAO;
import com.sist.dao.ShoesVO;

public class ShoesHomeModel implements Model{

	@Override
	public String execute(HttpServletRequest request) {
		ShoesDAO dao = ShoesDAO.newInstance();
		List<ShoesVO> list = dao.shoesRankListData();
		request.setAttribute("rank", list);
		return "shoes_home.jsp?mode=0";
	}
	
}
