<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String[] color={"red", "black", "blue", "yellow", "green"};
request.setAttribute("color", color);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>java forEach</h3>
<ul>
<%for(String s:color){ %>
<li><%=s %></li>
<%} %>
</ul>
<h3>JSTL forEach</h3>
<ul>
<c:forEach var="s" items="${color }" varStatus="d">
<li>${d.index+1 }. ${s }</li>
</c:forEach>
</ul>
</body>
</html>