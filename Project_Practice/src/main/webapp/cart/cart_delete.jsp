<%@page import="com.sist.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String no=request.getParameter("no");
CartDAO dao=CartDAO.newInstance();
dao.cartDelete(Integer.parseInt(no));

response.sendRedirect("../shoes/shoes_home.jsp?mode=2");
%>