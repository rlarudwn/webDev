<%--
	JSP동작 구조
		1. JSP파일 요청	=> URL 
		2. 웹 서버가 요청을 받음
			httpd	=> .html, .xml
			.jsp, servlet	=> 처리 못함
				=> WAS로 전송(Tomcat)
					JSP	=> 자바로 변경 : a.jsp	=> a_jsp.java
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<h3>Hello JSP!!</h3>
</body>
</html>