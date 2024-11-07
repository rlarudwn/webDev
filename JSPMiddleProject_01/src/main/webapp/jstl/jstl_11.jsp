<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Date date = new Date();

%>
<c:set var="date" value="<%=date%>" />
<c:set var="num" value="1234561231231237"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>자바 날짜 출력</h1>
	<p><%=date%></p>
	<p><%=new SimpleDateFormat("yyyy-MM-dd").format(date) %></p>
	<h1>jstl</h1>
	<p>${date}</p>
	<p><fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/></p>
	<h3>자바 숫자 변환</h3>
	<p><%=1234567 %></p>
	<p><%=new DecimalFormat("###,###,###").format(1234567) %></p>
	<h3>jstl</h3>
	<p>${num}</p>
	<p><fmt:formatNumber value="${num}" pattern="###,###,###"></fmt:formatNumber></p>
</body>
</html>