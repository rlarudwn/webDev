<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String color = request.getParameter("color");
	if(color == null)
		color="white";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=color%>">
	<form method="post" action="Basic_08.jsp">
		<select name="color">
			<option>blue</option>
			<option>yellow</option>
			<option>red</option>
			<option>black</option>
			<option>green</option>
			<option>white</option>
		</select>
		<button>전송</button>
	</form>
</body>
</html>