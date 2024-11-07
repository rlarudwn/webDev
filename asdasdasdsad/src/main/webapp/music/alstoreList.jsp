<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<title>Cyborg - Awesome HTML5 Template</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css">
<link rel="stylesheet" href="assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="assets/css/owl.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<style>
.item {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #f9f9f9;
	text-align: center;
}

.item img {
	width: 100%;
	height: auto;
	border-radius: 8px;
}

.item h4 {
	margin: 10px 0;
	font-size: 16px;
	font-weight: 600;
}

.item .artist {
	font-size: 14px;
	color: #666;
}

.item .price {
	font-size: 18px;
	color: #fff;
	font-weight: 700;
}
.page {
    padding: 0;
    margin: 20px 0;
    display: flex;
    justify-content: center;
    font-family: Arial, sans-serif;
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
</head>
<body>
	<!-- ***** Preloader Start ***** -->
	<!-- ***** Preloader End ***** -->

	<!-- ***** Header Area Start ***** -->
	<!-- ***** Header Area End ***** -->

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">
					<!-- ***** Most Popular Start ***** -->
					<div class="most-popular">
						<div class="row">
							<div class="col-lg-12">
								<div class="heading-section">
									<h4>
										<em>Album</em>& Goods
									</h4>
								</div>
								<div class="row">
									<c:forEach var="vo" items="${alstoreList}">
										<div class="col-lg-3">
											<div class="item" style="height: 380px;">
												<a href="../music/alstoreDetail.do?ano=${vo.ano}"> <img
													src="${vo.aphoto}" alt="${vo.aname}">
													<h4>${vo.aname}</h4>
													<div class="artist">${vo.aartist}노래</div> <c:if
														test="${vo.adisprice == null}">
														<div class="price">${vo.aprice}원</div>
													</c:if> <c:if test="${vo.adisprice != null }">
														<div class="price">${vo.adisprice }</div>
													</c:if>
												</a>

											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Most Popular End ***** -->
				</div>
			</div>
			<nav>
				<ul class="page page-lg">
					<c:if test="${startPage > 1}">
						<li><a href="../music/alstoreList.do?page=${startPage-1}">&laquo;
								Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li ${i == curpage ? "class='current'" : ""}><a
							href="../music/alstoreList.do?page=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${endPage < totalpage}">
						<li><a href="../music/alstoreList.do?page=${endPage+1}">Next
								&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>
