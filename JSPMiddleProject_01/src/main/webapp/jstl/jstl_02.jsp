<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 800px;
}

h3 {
	text-align: center
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3>JSTL</h3>
			<table class="table">
				<thead>
					<tr>
						<%
						for (int i = 2; i <= 9; i++) {
						%>
						<th class="text-center"><%=i%>단</th>
						<%
						}
						%>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 1; i <= 9; i++) {
					%>
					<tr>
						<%
						for (int j = 2; j <= 9; j++) {
						%>
						<td><%=j%>*<%=i%>=<%=j * i%></td>
						<%
						}
						%>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
		<div class="row">
			<h3>JSTL</h3>
			<table class="table">
				<thead>
					<tr>
						<c:forEach var="i" begin="2" end="9">
							<th class="text-center">${i }단</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="1" end="9">
						<tr>
							<c:forEach var="j" begin="2" end="9">
								<td>${j}*${i}=${i*j}</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>