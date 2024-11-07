<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row1">
		<header id="header" class="clear">
			<div id="logo" class="fl_left">
				<h1>
					<a href="index.html">맛집 / 서울여행</a>
				</h1>
			</div>
			<c:if test="${sessionScope.id==null}">
				<div class="fl_right">
					<ul class="inline">
						<li><i class="fa fa-phone"></i> <input type="text" class="input-sm" placeholder="아이디"></li>
						<li><i class="fa fa-envelope-o"></i> <input type="password" class="input-sm" placeholder="비밀번호"></li>
						<li><input type=image src="../main/login.png" style="width: 100px; height: 25px;"></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${sessionScope.id!=null}">
				<div class="fl_right">
					<ul class="inline">
						<li>${sessionScope.name}님</li>
						<li><a href="../main/logout.do">
								<input type=image src="../main/login.png" style="width: 100px; height: 25px;">
							</a></li>
					</ul>
				</div>
			</c:if>
		</header>
	</div>
	<div class="wrapper row2">
		<nav id="mainav" class="clear">
			<ul class="clear">
				<li class="active"><a href="index.html">Home</a></li>
				<li><a class="drop" href="#">회원</a>
				<li><a class="drop" href="#">서울 여행</a>
					<ul>
						<li><a href="../seoul/list.do">명소</a></li>
						<li><a href="pages/full-width.html">자연&관광</a></li>
						<li><a href="pages/sidebar-left.html">쇼핑</a></li>
						<li><a href="pages/sidebar-left.html">호텔</a></li>
						<li><a href="pages/sidebar-left.html">서울 날씨</a></li>
					</ul></li>
				<li><a class="drop" href="#">맛집</a>
					<ul>
						<li><a href="../food/list.do">맛집 목록</a></li>
						<c:if test="${sessionScope.id!=null }">
							<li><a href="pages/full-width.html">맛집 예약</a></li>
						</c:if>
						<li><a href="pages/sidebar-left.html">맛집 추천</a></li>
						<li><a href="../food/find.do">맛집 검색</a></li>
					</ul></li>
				<li><a class="drop" href="#">커뮤니티</a>
					<ul>
						<li><a href="../board/list.do">자유 게시판</a></li>
						<li><a href="pages/full-width.html">공지사항</a></li>
						<c:if test="${sessionScope.id!=null}">
							<li><a href="pages/sidebar-left.html">묻고 답하기</a></li>
							<li><a href="pages/sidebar-left.html">실시간 채팅</a></li>
						</c:if>
					</ul></li>
				<li><a href="#">스토어</a></li>
				<c:if test="${sessionScope.id!=null}">
					<c:if test="${sessionScope.admin=='y'}">
						<li><a href="#">관리자페이지</a></li>
					</c:if>
					<c:if test="${sessionScope.admin=='n'}">
						<li><a href="#">마이페이지</a></li>
					</c:if>
				</c:if>
			</ul>
		</nav>
	</div>
</body>
</html>