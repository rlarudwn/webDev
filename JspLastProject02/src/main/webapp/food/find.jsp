<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div>
		<main class="container clear">
			<div class="content">
				<div id="gallery">
					<figure>
						<header class="heading">
							<input type="text" name="ss" class="input input-sm" size="20" style="display: inline-block;" value="${ss }">
							<input type="button" value="검색" class="btn btn-sm btn-primary">
						</header>
						<ul class="nospace clear">
							<%-- <c:forEach var="vo" items="${list }" varStatus="i">
								<li class="one_quarter ${i.index%4==0?'first':''}">
									<a href="../food/detail_before	.do?fno=${vo.fno}&type=1">
										<img src="http://menupan.com${vo.poster }" alt="${vo.name}">
									</a>
								</li>
							</c:forEach> --%>
						</ul>
						<figcaption>Gallery Description Goes Here</figcaption>
					</figure>
				</div>
				<nav class="pagination">
					<ul>
						<c:if test="${startPage>1 }">
							<li>
								<a href="../food/find.do?page=${startPage-1}&ss=${ss}">&laquo; Previous</a>
							</li>
						</c:if>
						<c:forEach begin="${startPage }" end="${endPage }" var="i">
							<li class="${i==curPage?'current':'' }">
								<a href="../food/find.do?page=${i}&ss=${ss}">${i}</a>
							</li>
						</c:forEach>
						<c:if test="${endPage<totalPage }">
							<li>
								<a href="../food/find.do?page=${endPage+1}&ss=${ss}">Next &raquo;</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="clear"></div>
		</main>
</body>
</html>