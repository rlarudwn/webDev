<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.images {
	margin-top: 0px !important;
}

#row {
	width: 1200px;
	margin: 0px auto;
}

ul {
	display: contents;
}

#title {
	width: 600px;
	text-align: left;
	padding-left: 40px;
}

.gaming-library .item {
	border-bottom: 1px solid #a1daba;
	height: 130px;
	vertical-align: middle;
}

.gaming-library .item ul li {
	vertical-align: middle;
}

.title h1, h2, h3, h4, h5, h6 {
	color: black;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<div style="height: 10px;"></div>
	<div class="gaming-library">
		<div id="row">
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
								<img src="${vo.poster}" class="templatemo-item images">
							</li>
						</ul>
						<ul>
							<li id="title">
								<a href="../music/musicDetail.do?mno=${vo.mno}">
									<h5>${vo.title }</h5>
								</a>
								<a href="../music/artistDetail.do?ano=${vo.ano}">
									<h6>
										<font color="gray">${vo.aname }</font>
									</h6>
								</a>
								<a href="../music/albumDetail.do?alno=${vo.alno}">
									<h6>
										<font color="gray">${vo.altitle }</font>
									</h6>
								</a>
							</li>
						</ul>
						<ul>
							<li>
								<h4>${vo.genre }</h4>
							</li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>