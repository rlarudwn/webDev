<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
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
				<a class="navbar-brand" href="#">내부객체</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp?mode=0">Home</a></li>
				<li><a href="main.jsp?mode=1">답변형게시판</a></li>
				<li><a href="main.jsp?mode=2">자료실</a></li>
				<li><a href="main.jsp?mode=3">스토어</a></li>
			</ul>
		</div>
	</nav>
	<div class="continer">
		<div class="row">
			<%
			if (id == null) {
			%>
			<div class="text-right">
				<form method="post" action="../member/login_ok.jsp">
					ID:
					<input type="text" name="id" size="15" class="input-sm" required>
					&nbsp; Password:
					<input type="password" name="pwd" size="15" class="input-sm" required>
					<button class="btn btn-danger">로그인</button>
				</form>
			</div>
			<%
			} else {
			%>
			<div class="text-right">
				<form method="post" action="../member/logout.jsp">
					<%=session.getAttribute("name")%>님 로그인
					<button class="btn btn-danger">로그아웃</button>
				</form>
			</div>
			<%
			}
			%>
		</div>
		<div style="height: 10px"></div>
	</div>
</body>
</html>