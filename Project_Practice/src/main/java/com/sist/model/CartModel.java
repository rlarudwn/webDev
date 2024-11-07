package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;

public class CartModel {
	public void cartListData(HttpServletRequest request, HttpSession session) {
		String id = (String) session.getAttribute("id");
		CartDAO dao = CartDAO.newInstance();
		List<CartVO> list = dao.cartListData(id);
		request.setAttribute("cartList", list);
	}
}
