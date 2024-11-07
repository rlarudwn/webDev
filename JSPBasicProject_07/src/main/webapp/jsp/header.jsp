<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">내부객체</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp?mode=0">request</a></li>
				<li><a href="main.jsp?mode=1">response</a></li>
				<li><a href="main.jsp?mode=2">session</a></li>
				<li><a href="main.jsp?mode=3">application</a></li>
				<li><a href="main.jsp?mode=3">out</a></li>
				<li><a href="main.jsp?mode=3">pageContext</a></li>
				<li><a href="main.jsp?mode=3">Cookie</a></li>
				<li><a href="main.jsp?mode=3">javaBean</a></li>
				<li><a href="main.jsp?mode=3">database(DBCP)</a></li>
			</ul>
		</div>
	</nav>
	<div class="continer">
	</div>
</body>
</html>