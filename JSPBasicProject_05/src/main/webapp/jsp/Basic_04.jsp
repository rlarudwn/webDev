<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
</head>
<body>
	<table class="table_content" width=800 height=700>
		<tr>
			<td colspan="2" height="100">
				<%@ include file="header.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="300" height="500">
				<%@ include file="aside.jsp"%></td>
			<td width="500" height="500">
				<%@ include file="section.jsp"%></td>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="100">
				<%@ include file="footer.jsp"%></td>
			</td>
		</tr>
	</table>
</body>
</html>