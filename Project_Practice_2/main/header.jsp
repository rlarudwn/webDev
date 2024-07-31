<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="../main/main.do">POKEMON</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="../main/main.do">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
						포켓몬 <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="../poke/list.do">포켓몬 목록</a></li>
						<li><a href="../poke/find.do">포켓몬 검색</a></li>
					</ul></li>
				<li><a href="../goods/list.do">스토어</a></li>
				<li><a href="../music/list.do">뮤직</a></li>
				<li><a href="../music/board.do">자유게시판</a></li>
			</ul>
			<c:if test="${fn:length(sessionScope.id)==0}">
				<form action="../member/login_ok.do" method="post">
					<div class="text-right" style="vertical-align: middle;">
						<input type="text" name="id" class="input-lg" placeholder="id" required>
						<input type="password" name="pwd" class="input-lg" placeholder="password" required>
						<button class="btn btn-default">LOGIN</button>
					</div>
				</form>
			</c:if>
			<c:if test="${fn:length(sessionScope.id)!=0}">
				<form action="../member/logout_ok.do" method="post">
					<div class="text-right" style="vertical-align: middle;">
						<span style="color: white;">${sessionScope.name }</span>
						<button class="btn btn-default">LOGOUT</button>
					</div>
				</form>
			</c:if>
		</div>
	</nav>
</body>
</html>