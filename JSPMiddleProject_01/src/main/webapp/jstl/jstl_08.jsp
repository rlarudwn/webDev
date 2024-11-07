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
	int star = 3;
	%>
	<%
	if (star == 0) {
	%>
	<span style="color: orange;">☆☆☆☆☆</span>
	<%
	} else if (star == 1) {
	%>
	<span style="color: red;">★☆☆☆☆</span>
	<%
	} else if (star == 2) {
	%>
	<span style="color: green;">★★☆☆☆</span>
	<%
	} else if (star == 3) {
	%>
	<span style="color: blue;">★★★☆☆</span>
	<%
	} else if (star == 4) {
	%>
	<span style="color: pink;">★★★★☆</span>
	<%
	} else if (star == 5) {
	%>
	<span style="color: orange;">★★★★★</span>
	<%
	}
	%>
	<h1>jstl</h1>
	<c:forEach var="i" begin="1" end="100" step="1">
		<c:choose>
			<c:when test="${i%6==0}">
				<span style="color: orange;">☆☆☆☆☆</span>
			</c:when>
			<c:when test="${i%6==1}">
				<span style="color: red;">★☆☆☆☆</span>
			</c:when>
			<c:when test="${i%6==2}">
				<span style="color: green;">★★☆☆☆</span>
			</c:when>
			<c:when test="${i%6==3}">
				<span style="color: blue;">★★★☆☆</span>
			</c:when>
			<c:when test="${i%6==4}">
				<span style="color: pink;">★★★★☆</span>
			</c:when>
			<c:when test="${i%6==5}">
				<span style="color: orange;">★★★★★</span>
			</c:when>
		</c:choose>
		<br>
	</c:forEach>
	<h1>자바 else</h1>
	<%
	int sex=0;
	if(sex==1){
	%>
	남자
	<%
	}
	 else{
	%>
	여자
	<%
	}
	request.setAttribute("sex", sex);
	%>
	<h1>jstl</h1>
	<c:choose>
	<c:when test="${sex==1 }">남자</c:when>
	<c:otherwise>여자</c:otherwise>
	</c:choose>
</body>
</html>