<%--
	EL : 표현식	=> 데이터를 화면에 출력
		<%= %>	=> 대체
		$(값)
			연산자
			내장객체
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name="홍길동";
request.setAttribute("name", "홍길동");
session.setAttribute("name", "심청이");
%>
<h1>EL:${name }</h1>
<h1>EL:${sessionScope.name }</h1>
</body>
</html>