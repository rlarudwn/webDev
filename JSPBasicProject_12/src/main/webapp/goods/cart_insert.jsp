<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
List<CartVO> list=(List<CartVO>)session.getAttribute("cart");
if(list==null)
	list=new ArrayList<CartVO>();
CartVO vo=new CartVO();
String id=(String)session.getAttribute("id");
String no=request.getParameter("no");
String name=request.getParameter("name");
String price=request.getParameter("price");
String account=request.getParameter("account");
String poster=request.getParameter("poster");
vo.setAccount(Integer.parseInt(account));
vo.setPrice(price);
vo.setName(name);
vo.setNo(Integer.parseInt(no));
vo.setPoster(poster);
vo.setId(id);
boolean bCheck=false;
for(CartVO cvo:list){
	if(cvo.getNo()==vo.getNo() && cvo.getId().equals(id)){
		int acc=cvo.getAccount()+vo.getAccount();
		cvo.setAccount(acc);
		bCheck=true;
		break;
	}
}
if(!bCheck){
	list.add(vo);
	session.setAttribute("cart", list);
}
response.sendRedirect("cart_list.jsp");
%>