package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

public class CartModel {
	@RequestMapping("goods/cartInsert")
	public String cartInsert(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String gno=request.getParameter("gno");
		String type=request.getParameter("type");
		String price=request.getParameter("price");
		String account=request.getParameter("account");
		return "redirect:../mypage/mypageCart.do";
	}
}
