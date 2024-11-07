<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../food/food.css">
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<div id="a">
				<img src="../food/map/1111.png" id="seoul_1">
				<c:forEach var="i" begin="1" end="25">
					<a href="../food/find.do?gu=${i}">
						<img src="../food/map/gu_${i}_off.png" id="gu${i}" onmouseover="this, src='../food/map/gu_${i}_on.png'" onmouseout="this, src='../food/map/gu_${i}_off.png'">
					</a>
				</c:forEach>
			</div>
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">
				<!-- ################################################################################################ -->
				<div id="gallery">
					<figure>
						<header class="heading">
							<h3>${fd}
								검색 결과 : <span style="color: red;">${count}</span>건 입니다
							</h3>
						</header>
						<ul class="nospace clear">
							<c:forEach var="vo" items="${list }" varStatus="i">
								<li class="${i.index mod 4 eq 0?'one_quarter first':'one_quarter'}" title="${vo.name}&#10${vo.addr}"><a href="../food/before_detail.do?fno=${vo.fno }">
										<img src="${vo.poster}">
									</a></li>
							</c:forEach>
						</ul>
					</figure>
				</div>
				<nav class="pagination">
					<ul>
						<c:if test="${startPage>1}">
							<li><a href="../food/find.do?page=${startPage-1}&gu=${gu}">&laquo; Previous</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="${curPage==i?'current':''}"><a href="../food/find.do?page=${i}&gu=${gu}">${i}</a></li>
						</c:forEach>
						<c:if test="${endPage<totalPage}">
							<li><a href="../food/find.do?page=${endPage+1}&gu=${gu}">&raquo; Previous</a></li>
						</c:if>
					</ul>
				</nav>
				<!-- ################################################################################################ -->
			</div>
			<!-- ################################################################################################ -->
			<!-- / main body -->
			<div class="clear"></div>
		</main>
	</div>
</body>
</html>