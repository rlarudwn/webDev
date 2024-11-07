<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.submenu {
	
}

.dropdown::hover ul.dropdown {
	display: inline-block;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#logoutBtn').click(function() {
			$.ajax({
				type : 'post',
				url : '../member/logOut.do',
				success : function(result) {
					console.log(result)
					if (result === 'OK') {
						location.href = "../main/main.do"
					}
				}
			})
		})
		$('.dropdown').mouseover(function() {
			$('.dropmenu').css('display', '')
		})
		$('.dropdown').mouseout(function() {
			$('.dropmenu').css('display', 'none')
		})
	})
</script>
</head>
<body>
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav navbar">
						<!-- ***** Logo Start ***** -->
						<a href="index.html" class="logo">
							<img src="../assets/images/logo.png" alt="">
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Search End ***** -->
						<!-- ***** Search End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li>
								<a href="index.html" class="active">Home</a>
							</li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">
									Browse<span class="caret"></span>
								</a>
							</li>
							<li>
								<a href="../music/musicList.do">music</a>
							</li>
							<li>
								<a href="../music/albumList.do">album</a>
							</li>
							<li>
								<a href="profile.html">
									Profile <img src="../assets/images/profile-header.jpg" alt="">
								</a>
							</li>
						</ul>
						<ul class="nav" style="width: 250px;"></ul>
						<c:if test="${sessionScope.id==null }">
							<ul class="nav">
								<li>
									<a href="#" id="info">SIGN UP</a>
								</li>
								<li>
									<a href="../member/login.do">SIGN IN</a>
								</li>
							</ul>
						</c:if>
						<c:if test="${sessionScope.id!=null }">
							<ul class="nav">
								<li>
									<a id="info">${sessionScope.nickname}님</a>
								</li>
								<li>
									<a id="info">
										<input type="button" id="logoutBtn" value="LogOut" style="color: #666; background-color: transparent; border: none;">
									</a>
								</li>
							</ul>
						</c:if>
						<a class='menu-trigger'>
							<span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
					<nav class="navbar">
						<ul class="dropmenu" style="display: none; z-index: 999;">
							<li class="submenu">
								<a href="#">Page 1-1</a>
							</li>
							<li class="submenu">
								<a href="#">Page 1-2</a>
							</li>
							<li class="submenu">
								<a href="#">Page 1-3</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
</body>
</html>