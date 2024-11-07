package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.dao.GoodsDAO;
import com.sist.dao.SeoulDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.GoodsVO;
import com.sist.vo.LocationVO;

public class MainModel {
	@RequestMapping("main/main.do")
	public String mainPage(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		session.setAttribute("id", "dasd");
		session.setAttribute("name", "김경주");
		session.setAttribute("admin", "n");
		FoodDAO fDao = FoodDAO.newInstance();
		List<FoodVO> fList = fDao.foodTopData();
		SeoulDAO sDao = SeoulDAO.newInstance();
		List<LocationVO> sList = sDao.seoulTopData();
		GoodsDAO gDao = GoodsDAO.newInstance();
		List<GoodsVO> gList = gDao.goodsTopData();
	
		Cookie[] cookies = request.getCookies();
		List<FoodVO> cList = new ArrayList<FoodVO>();
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				if (cookies[i].getName().startsWith("food_")) {
					String fno = cookies[i].getValue();
					FoodVO vo = fDao.foodDetailData(Integer.parseInt(fno));
					cList.add(vo);
				}
			}
		}
		request.setAttribute("clist", cList);
		request.setAttribute("flist", fList);
		request.setAttribute("glist", gList);
		request.setAttribute("slist", sList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		CommonsModel.commonsData(request);
		return "../main/main.jsp";
	}
}