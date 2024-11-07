<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String name = (String) session.getAttribute("name");
String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="shoes_home.do?mode=0">SHOES</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="shoes_home.do?mode=0">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
						Page 1 <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Page 1-1</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>
				<li><a href="shoes_home.do?mode=1">스니커즈</a></li>
				<li><a href="#">Page 3</a></li>
				<c:if test="${id!=null}">
					<li class="text-right"><a href="shoes_home.do?mode=3" style="margin-right: 50px;">장바구니</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="text-right">
				<table class="table">
					<tr>
						<%
						if (name == null) {
						%>
						<form method="post" action="../member/login.jsp">
							<td>
								ID:
								<input type="text" name="id" size="15" class="input-sm">
								PWD:
								<input type="password" name="pwd" size="15" class="input-sm">
								<button class="btn btn-sm btn-danger">로그인</button>
							</td>
						</form>
						<%
						} else {
						%>
						<form method="post" action="../member/logout.jsp">
							<td>
								<%=name%>
								<button class="btn-sm btn-primary">로그아웃</button>
							</td>
						</form>
						<%
						}
						%>
					</tr>
				</table>

			</div>
		</div>
	</div>
</body>
</html>