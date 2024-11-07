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
	width: 200px;
	height: 300px;
	border: 7px solid #a1daba;
	box-sizing: border-box;
	overflow: hidden;
	text-overflow: ellipsis;
}

.item h4 {
	color: black;
	
}

.page {
	list-style: none;
	padding: 0;
	margin: 20px auto; /* 위와 아래 여백을 추가하고 자동으로 가운데 정렬 */
	display: flex;
	justify-content: center; /* 네비게이션 항목을 가운데로 정렬 */
	font-family: Arial, sans-serif;
}

.page li {
	margin: 0 3px; /* 네비게이션 항목 간의 여백 */
}

.page a {
	text-decoration: none;
	color: #0197A3; /* 링크 색상 */
	padding: 8px 12px;
	border: 1px solid #0197A3; /* 링크 테두리 색상 */
	border-radius: 4px; /* 둥근 모서리 */
	transition: background-color 0.3s, color 0.3s; /* 부드러운 색상 변화 */
}

.page a:hover {
	background-color: #0197A3; /* 호버 시 배경색 */
	color: #fff; /* 호버 시 텍스트 색상 */
}

.page .current a {
	background-color: #0197A3; /* 현재 페이지 배경색 */
	color: #fff; /* 현재 페이지 텍스트 색상 */
	border: 1px solid #0197A3; /* 현재 페이지 테두리 색상 */
	pointer-events: none; /* 현재 페이지 클릭 방지 */
}

.page .current a:hover {
	background-color: #0197A3; /* 현재 페이지 호버 시 배경색 */
	color: #fff; /* 현재 페이지 호버 시 텍스트 색상 */
}

.page li:first-child a {
	border-radius: 4px 0 0 4px; /* 왼쪽 끝 모서리 둥글게 */
}

.page li:last-child a {
	border-radius: 0 4px 4px 0; /* 오른쪽 끝 모서리 둥글게 */
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
									<a href="../music/albumDetail.do?alno=${vo.alno}">
										<h4>
											${vo.atitle	}<br>
										</h4>
									</a>
									<a href="../music/artistDetail.do?ano=${vo.ano}">
										<span>${vo.aname}</span>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row text-center">
		<nav>
			<ul class="page page-lg">
				<c:if test="${startPage > 1}">
					<li>
						<a href="../music/albumList.do?page=${startPage-1}&ss=${ss}&genre=${genre}">&laquo; Previous</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li ${i == curPage ? "class='current'" : ""}>
						<a href="../music/albumList.do?page=${i}&ss=${ss}&genre=${genre}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<li>
						<a href="../music/albumList.do?page=${endPage+1}&ss=${ss}&genre=${genre}">Next &raquo;</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
</body>
</html>