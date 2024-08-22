<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<main class="container clear">
			<div class="content">
				<div id="gallery">
					<figure>
						<header class="heading">쇼핑</header>
						<ul class="nospace clear">
							<c:forEach var="vo" items="${list}" varStatus="i">
								<li class="one_quarter ${i.index%4==0?'first':''}">
									<a href="../seoul/detail.do?no=${vo.no}">
										<img src="${vo.poster }" alt="${vo.title}">
									</a>
								</li>
							</c:forEach>
						</ul>
						<figcaption>Gallery Description Goes Here</figcaption>
					</figure>
				</div>
				<nav class="pagination">
					<ul>
						<c:if test="${startPage>1 }">
							<li>
								<a href="../seoul/location.do?page=${startPage-1}">&laquo; Previous</a>
							</li>
						</c:if>
						<c:forEach begin="${startPage}" end="${endPage}" var="i">
							<li class="${i==curPage?'current':'' }">
								<a href="../seoul/location.do?page=${i}">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${endPage<totalPage }">
							<li>
								<a href="../seoul/location.do?page=${endPage+1}">Next &raquo;</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="clear"></div>
		</main>
	</div>
</body>
</html>