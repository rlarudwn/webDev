<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#row {
	width: 1200px;
	margin: 0px auto;
}

.item {
	height: 380px;
	background-color: #fff !important;
	border: 7px solid #a1daba;
}
.item h4{
color: black;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<div id="row">
		<div class="most-popular">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading-section">
						<h4>
							<em>Most Popular</em> Right Now
						</h4>
					</div>
					<div class="row">
						<c:forEach var="vo" items="${list}">
							<div class="col-sm-3">
								<div class="item">
									<img src="${vo.poster}">
									<a href="../music/albumDetail.do?alno=${vo.alno}"><h4>
										${vo.atitle	}<br>
									</h4></a>
									<a href="../music/artistDetail.do?ano=${vo.ano}"><span>${vo.aname}</span></a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>