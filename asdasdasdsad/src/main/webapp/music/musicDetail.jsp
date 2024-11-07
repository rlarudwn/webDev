<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main-profile {
	margin-top: 150px;
	background-color: #fff;
}

.main-profile .row {
	vertical-align: top;
	padding: 15px;
}

.col-lg-12 {
	width: 1200px;
	margin: 0px auto;
}

.clips .item {
	background-color: #999;
}

h1, h2, h3, h4, h5, h6 {
	color: black;
	margin: 0px;
}

.likeCheck {
	width: 20px !important;
	height: 20px;
	margin: 0px !important;
}
.templatemo-item{
width: 40px !important;
height: 40px !important;
}
.gaming-library{
margin-top:0px !important; 
}
div.gaming-library div.item li {
	margin: 0px auto !important;
	vertical-align: middle;
	border-bottom: none;
}

div.gaming-library div.item {
	margin: 0px;
	padding: 10px 0px;
	border-bottom: none;
}

.gaming-library .item ul li img {
	margin: -8px 0px 0px 0px;
}
.gaming-library .item ul li {
display: inline-grid;
}
.main-profile ul li span {
	color: #333;
}

.main-profile ul li {
	color: #ccc;
	height: 26px;
	padding-bottom: 20px;
	vertical-align: middle;
	margin: 5px;
	border-bottom: none !important;
}

.main-profile ul {
	padding: 10px 15px;
	background-color: transparent !important;
	padding: 10px 15px;
	width: 650px;
}

.artistLink {
	color: #333;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="main-profile ">
				<div class="row">
					<div class="col-lg-4">
						<img src="${detail.poster }" style="border-radius: 23px; width: 100%;">
					</div>
					<div class="col-lg-8">
						<h1>${detail.title }</h1>
						<div style="height: 100px;">
							<ul>
								<li>
									아티스트 <span><a href="../music/artistDetail.do?ano=${detail.ano}">${detail.aname}</a></span>
								</li>
								<li>
									앨범명 <span><a href="../music/albumDetail.do?alno=${detail.alno}">${detail.altitle}</a></span>
								</li>
								<li>
									장르 <span>${detail.genre}</span>
								</li>
								<li>
									작사가 <span><c:forEach var="cvo" items="${cList}" varStatus="i">${i.index!=0?'|':''}<a href="#" class="artistLink">${cvo}</a>
										</c:forEach></span>
								</li>
								<li>
									작곡가 <span><c:forEach var="lvo" items="${lList}" varStatus="i">${i.index!=0?'|':''}<a href="#" class="artistLink">${lvo}</a>
										</c:forEach></span>
								</li>
								<li>
									편곡자 <span><c:forEach var="avo" items="${aList}" varStatus="i">${i.index!=0?'|':''}<a href="#" class="artistLink">${avo}</a>
										</c:forEach></span>
								</li>
								<li>
									재생시간 <span>${detail.playtime}</span>
								</li>
								<li>
									재생횟수<span>${detail.playcount }</span>
								</li>
								<li>
									좋아요<span>${detail.likecount }</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row" style="margin-top: 20px;">
					<div class="col-lg-8">
						<h5 style="margin-bottom: 20px;">가사</h5>
						<pre><font>${detail.lylics}</font></pre>
					</div>
					<div class="col-lg-4">
						<div class="gaming-library profile-library">
							<div class="heading-section">
								<h4>
									<em>${detail.aname}'s&nbsp;</em>Music
								</h4>
							</div>
							<c:forEach var="mvo" items="${mList}">
								<div class="item">
									<ul>
										<li style="width: 15%">
											<img src="${mvo.poster }" class="templatemo-item" height="15px" width="15px">
										</li>
										<li style="width: 25%">
											<h4>${mvo.title}</h4>
										</li>
									</ul>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Banner End ***** -->

	<!-- ***** Gaming Library Start ***** -->

</body>
</html>