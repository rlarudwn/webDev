<%--
조건
	단일조건문
		<c:if test="조건문">	=> ${비교연산자 / 논리연산자}
		</c:if>
	다중 조건문
		<c:choose>
		<c:when test="조건문">출력</c:when>
		<c:when test="조건문">출력</c:when>
		<c:when test="조건문">출력</c:when>
		<c:when test="조건문">출력</c:when>
		<c:when test="조건문">출력</c:when>
		<c:otherwise>default</c:otherwise>
		</c:choose>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>java</h1>
	<%
	for (int i = 1; i <= 10; i++) {
		if (i % 2 == 0) {
	%>
	<p><%=i%></p>
	<%
	}
	}
	%>
	<h1>jstl</h1>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i%2==0}">
			<p>${i }</p>
		</c:if>
	</c:forEach>
</body>
</html>