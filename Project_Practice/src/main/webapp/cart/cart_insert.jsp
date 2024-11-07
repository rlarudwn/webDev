<%@page import="com.sist.dao.CartDAO"%>
<%@page import="com.sist.dao.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CartVO vo=new CartVO();
CartDAO dao=CartDAO.newInstance();
String sno=request.getParameter("sno");
String id=(String)session.getAttribute("id");
String account=request.getParameter("account");
vo.setSno(Integer.parseInt(sno));
vo.setId(id);
vo.setAccount(Integer.parseInt(account));
dao.cartInsert(vo);

response.sendRedirect("../shoes/shoes_home.jsp?mode=2");

%>