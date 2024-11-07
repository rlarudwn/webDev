<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
	display: contents;
}
#title{
width: 500px;
}
</style>
</head>
<body>
<div style="height: 10px;"></div>
	<div class="gaming-library">
		<div class="col-lg-12">
			<div class="heading-section">
				<h4 style="text-align: center;">
					<em>Your Gaming</em> Library
				</h4>
			</div>
			<c:forEach var="vo" items="${list}" varStatus="i">
				<div class="item">
					<ul>
						<li>
							<h4>${(curPage-1)*50+i.index+1}</h4>
						</li>
					</ul>
					<ul>
						<li>
							<img src="${vo.poster}" class="templatemo-item">
						</li>
					</ul>
					<ul>
						<li id="title">
							<h4>${vo.title }</h4>
							<h4>${vo.aname }</h4>
							<h4>${vo.altitle }</h4>
						</li>
					</ul>
					<ul>
						<li>
							<h4>${vo.aname }</h4>
						</li>
					</ul>
					<ul>
						<li>
							<h4>${vo.genre }</h4>
						</li>
					</ul>
				</div>
			</c:forEach>
			<div class="item">
				<ul>
					<li>
						<img src="assets/images/game-01.jpg" alt="" class="templatemo-item">
					</li>
					<li>
						<h4>Dota 2</h4>
						<span>Sandbox</span>
					</li>
					<li>
						<h4>Date Added</h4>
						<span>24/08/2036</span>
					</li>
					<li>
						<h4>Hours Played</h4>
						<span>634 H 22 Mins</span>
					</li>
					<li>
						<h4>Currently</h4>
						<span>Downloaded</span>
					</li>
					<li>
						<div class="main-border-button border-no-active">
							<a href="#">Donwloaded</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="item">
				<ul>
					<li>
						<img src="assets/images/game-02.jpg" alt="" class="templatemo-item">
					</li>
					<li>
						<h4>Fortnite</h4>
						<span>Sandbox</span>
					</li>
					<li>
						<h4>Date Added</h4>
						<span>22/06/2036</span>
					</li>
					<li>
						<h4>Hours Played</h4>
						<span>740 H 52 Mins</span>
					</li>
					<li>
						<h4>Currently</h4>
						<span>Downloaded</span>
					</li>
					<li>
						<div class="main-border-button">
							<a href="#">Donwload</a>
						</div>
					</li>
				</ul>
			</div>
			<div class="item last-item">
				<ul>
					<li>
						<img src="assets/images/game-03.jpg" alt="" class="templatemo-item">
					</li>
					<li>
						<h4>CS-GO</h4>
						<span>Sandbox</span>
					</li>
					<li>
						<h4>Date Added</h4>
						<span>21/04/2036</span>
					</li>
					<li>
						<h4>Hours Played</h4>
						<span>892 H 14 Mins</span>
					</li>
					<li>
						<h4>Currently</h4>
						<span>Downloaded</span>
					</li>
					<li>
						<div class="main-border-button border-no-active">
							<a href="#">Donwloaded</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="main-button">
				<a href="profile.html">View Your Library</a>
			</div>
		</div>
	</div>
</body>
</html>