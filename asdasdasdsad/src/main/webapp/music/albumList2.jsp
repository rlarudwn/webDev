<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.genreTable {
	border: transparent;
	margin-top: -14px;
	margin-bottom: -1px;
}

.genreTable td {
	padding: 0px;
	vertical-align: middle;
}

.genreTable td a {
	text-align: center;
	color: #aaa;
	display: block;
	width: 100%;
	border: 2px solid #aaa;
	border-bottom: 2px solid #777;
	border-right: none;
	border-radius: 15px 15px 0px 0px;
	height: 45px;
	vertical-align: middle;
	background: white;
	font-size: 15px;
	padding-top: 11px;
}

.genreTable td:last-child a {
	width: 100%;
	border: 2px solid #aaa;
	border-bottom: 2px solid #777;
}

.genreTable .active a {
	border-left: 2px solid #777 !important;
	border-top: 2px solid #777 !important;
	border-right: 2px solid #777 !important;
	border-bottom: none !important;
}

.genreTable .anext a {
	border-left: none !important;
}

.genreTable td {
	padding: 0px;
}

a {
	color: black;
}

#row {
	width: 1200px;
	margin: 0px auto;
}

.albumImg {
	display: block;
	margin-bottom: 10px;
	border-radius: 15px;
}

.albumItem {
	width: 200px;
	height: 300px;
	/* border: 7px solid #a1daba; */
	border: transparent;
	box-sizing: border-box;
	border-radius: 15px;
	padding: 45px 10px 30px 10px;
	margin: 0px auto;
	border-radius: 15px;
	box-sizing: border-box;
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
	color: #9BA8B5; /* 링크 색상 */
	padding: 8px 12px;
	border: 1px solid #9BA8B5; /* 링크 테두리 색상 */
	border-radius: 4px; /* 둥근 모서리 */
	transition: background-color 0.3s, color 0.3s; /* 부드러운 색상 변화 */
}

.page a:hover {
	background-color: #9BA8B5; /* 호버 시 배경색 */
	color: #fff; /* 호버 시 텍스트 색상 */
}

.page .current a {
	background-color: #9BA8B5; /* 현재 페이지 배경색 */
	color: #fff; /* 현재 페이지 텍스트 색상 */
	border: 1px solid #9BA8B5; /* 현재 페이지 테두리 색상 */
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
	<div class="container" style="margin-top: 150px; background: #9BA8B5; padding: 50px; border-radius: 50px;">
		<h3 style="margin-bottom: 40px;">앨범 목록</h3>
		<div id="row">
			<div class="row" style="display: flex; flex-wrap: wrap; justify-content: center; background: white; border-radius: 30px;">
				<table class="table genreTable">
					<tr>
						<td width="11%" class="genreBtn ${genre==1?'active':''}">
							<a href="../music/albumList.do?genre=1">전체</a>
						</td>
						<td width="11%" class="genreBtn ${genre==2?'active':genre==1?'anext':''}">
							<a href="../music/albumList.do?genre=2">댄스</a>
						</td>
						<td width="11%" class="genreBtn ${genre==3?'active':genre==2?'anext':''}">
							<a href="../music/albumList.do?genre=3">드라마</a>
						</td>
						<td width="11%" class="genreBtn ${genre==4?'active':genre==3?'anext':''}">
							<a href="../music/albumList.do?genre=4">발라드</a>
						</td>
						<td width="11%" class="genreBtn ${genre==5?'active':genre==4?'anext':''}">
							<a href="../music/albumList.do?genre=5">인디</a>
						</td>
						<td width="11%" class="genreBtn ${genre==6?'active':genre==5?'anext':''}">
							<a href="../music/albumList.do?genre=6">락</a>
						</td>
						<td width="11%" class="genreBtn ${genre==7?'active':genre==6?'anext':''}">
							<a href="../music/albumList.do?genre=7">랩/힙합</a>
						</td>
						<td width="11%" class="genreBtn ${genre==8?'active':genre==7?'anext':''}">
							<a href="../music/albumList.do?genre=8">트로트</a>
						</td>
						<td width="11%" class="genreBtn ${genre==9?'active':genre==8?'anext':''}">
							<a href="../music/albumList.do?genre=9">R&B/소울</a>
						</td>
					</tr>
				</table>
				<c:forEach var="vo" items="${list}">
					<div class="col-sm-3" style="width: 240px;">
						<div class="albumItem" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
							<img class="albumImg" src="${vo.poster}">
							<a href="../music/albumDetail.do?alno=${vo.alno}">
								<span>${vo.atitle	}</span><br>
							</a>
							<a href="../music/artistDetail.do?ano=${vo.ano}" style="color: #aaa;">
								<span>${vo.aname}</span>
							</a>
						</div>
					</div>
				</c:forEach>
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