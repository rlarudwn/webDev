package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.ShoesDAO;
import com.sist.dao.ShoesVO;

public class ShoesDetailModel implements Model{

	@Override
	public String execute(HttpServletRequest request) {
		ShoesDAO dao = ShoesDAO.newInstance();
		String no = request.getParameter("no");
		ShoesVO vo = dao.shoesDetailData(Integer.parseInt(no));
		request.setAttribute("no", no);
		request.setAttribute("shoesVo", vo);
		request.setAttribute("jsp", "a.jsp");
		return "main.jsp";
	}

}
