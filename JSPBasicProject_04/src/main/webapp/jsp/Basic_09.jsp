<%--
	
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
	int i = 1;
	String s = "";
	while(i<=5){
		s+="★";
		i++;
	%>
	<font color="red"><%=s%></font>
	<br>
	<%
	}
	%>
</body>
</html>