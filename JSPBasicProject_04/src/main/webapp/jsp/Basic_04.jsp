<%--
	스크립트릿
	<% %>	=> 자바 일반 소스
	<%= %>	=> 화면에 데이터 출력(표현식)	=> out.print()
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style type="text/css">
.table_content {
	margin: 0px auto;
	width: 600px;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
	<h3>구구단</h3>
	<table class="table_content">
		<tr>
			<%
			for (int i = 2; i < 10; i++) {
			%>
			<th><%=i%>단</th>
			<%
			}
			%>
		</tr>
		<%
		for (int i = 1; i < 10; i++) {
		%>
		<tr>
			<%
			for (int j = 2; j <= 9; j++) {
			%>
			<td><%=j%>*<%=i%>=<%=i * j%></td>
			<%
			}
			%>
			<%
			}
			%>
		</tr>
	</table>
</body>
</html>