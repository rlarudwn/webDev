<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
List<String> names=new ArrayList<String>();
for(char c='a';c<='z';c++){
	names.add(String.valueOf(c));
}
%>
<c:set var="names" value="<%=names %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>출력</h1>
<c:forEach var="alpha" items="${names}">${alpha}<br></c:forEach>
<h1>출력2</h1>
<c:forEach var="alpha" items="${names}">
<c:out value="${alpha}"></c:out>
</c:forEach>

</body>
</html>