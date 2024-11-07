package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.CartDAO;
import com.sist.vo.CartVO;

public class CartModel {
	@RequestMapping("goods/cartInsert.do")
	public String cartInsert(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String gno=request.getParameter("gno");
		String price=request.getParameter("price");
		String account=request.getParameter("account");
		CartVO vo=new CartVO();
		vo.setId(id);
		vo.setGno(Integer.parseInt(gno));
		vo.setAccount(Integer.parseInt(account));
		vo.setPrice(Integer.parseInt(price));
		Map map=new HashMap();
		map.put("gno", gno);
		map.put("id", id);
		int gnoCount=CartDAO.cartGetGnoCount(map);
		if(gnoCount==0)
			CartDAO.cartInsert(vo);
		else {
			int cno=CartDAO.cartGetCno(map);
			map.put("cno", cno);
			map.put("account", account);
			CartDAO.cartGnoUpdate(map);
		}
		return "redirect:../mypage/mypageCart.do";
	}
	@RequestMapping("mypage/mypageCart.do")
	public String mypageCart(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<CartVO> list=CartDAO.cartListData(id);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/myPageCart.jsp");
		request.setAttribute("main_jsp", "../mypage/myPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypageBuy.do")
	public String mypageBuy(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<CartVO> list=CartDAO.buyListData(id);
		int totalPrice=CartDAO.buyTotalPrice(id);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/myPageBuy.jsp");
		request.setAttribute("main_jsp", "../mypage/myPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/mypageCartCancel.do")
	public String myPageCartCancel(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		CartDAO.cartCancel(Integer.parseInt(cno));
		return "redirect:../mypage/mypageCart.do";
	}
	@RequestMapping("mypage/cartBuy.do")
	public void mypageCartBuy(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		CartDAO.cartUpdate(Integer.parseInt(cno));
		HttpSession session=request.getSession();
		String name=(String) session.getAttribute("name");
		String email=(String) session.getAttribute("email");
		String address=(String) session.getAttribute("address");
		String post=(String) session.getAttribute("post");
		String phone=(String) session.getAttribute("phone");
		JSONObject obj=new JSONObject();
		obj.put("name", name);
		obj.put("email", email);
		obj.put("address", address);
		obj.put("poster", post);
		obj.put("phone", phone);
		PrintWriter out=null;
		try {
			out=response.getWriter();
			out.write(obj.toJSONString());
		} catch (Exception e) {
			out.write("FAIL");
		}
	}
}
