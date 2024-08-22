package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.dao.NoticeDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.NoticeVO;


public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies=request.getCookies();
		
		List<FoodVO> cookieList=new ArrayList<FoodVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("food_")) {
					String fno=cookies[i].getValue();
					FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
					cookieList.add(vo);
				}
			}
		}
		List<FoodVO> hitList=FoodDAO.foodTopHitData();
		List<FoodVO> jjimList=FoodDAO.foodTopJjimData();
		List<FoodVO> likeList=FoodDAO.foodTopLikeData();
		CommonsModel.footerPrint(request);
		request.setAttribute("cookieList", cookieList);
		request.setAttribute("hitList", hitList);
		request.setAttribute("jjimList", jjimList);
		request.setAttribute("likeList", likeList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
