<%--
	<fmt:formatDate value="regdate" pattern="yyyy-mm-dd"/>
	SimpleDateFormat
	<fmt:formatNumber value="price" pattern="##,###,###"/>
	<c:forTokens>	=> StringTokenizer
--%>
<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>java</h3>
	<ul>
		<%
		String color = "red,blue,yellow,black,green,pink,magenta";
		StringTokenizer st = new StringTokenizer(color, ",");
		while (st.hasMoreTokens()) {
		%>
		<li><%=st.nextToken()%></li>
		<%
		}
		%>
	</ul>
	<h3>jstl</h3>
	<ul>
		<c:forTokens var="color" items="red,blue,yellow,black,green,pink,magenta" delims=",">
			<li>${color }</li>
		</c:forTokens>
	</ul>
</body>
</html>