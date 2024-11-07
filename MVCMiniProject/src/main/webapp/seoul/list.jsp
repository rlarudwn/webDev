<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
		<div id="breadcrumb" class="clear">
			<!-- ################################################################################################ -->
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Lorem</a></li>
				<li><a href="#">Ipsum</a></li>
				<li><a href="#">Dolor</a></li>
			</ul>
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row3">
		<main class="container clear">
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">
				<!-- ################################################################################################ -->
				<div id="gallery">
					<figure>
						<header class="heading">Gallery Title Goes Here</header>
						<ul class="nospace clear">
							<c:forEach var="vo" items="${list }" varStatus="i">
								<li class="${i.index mod 4 eq 0?'one_quarter first':'one_quarter'}" title="${vo.title}"><a href="#">
										<img src="${vo.poster}">
									</a></li>
							</c:forEach>
						</ul>
					</figure>
				</div>
				<%--
				<nav class="pagination">
					<ul>
						<li><a href="#">&laquo; Previous</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><strong>&hellip;</strong></li>
						<li><a href="#">6</a></li>
						<li class="current"><strong>7</strong></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><strong>&hellip;</strong></li>
						<li><a href="#">14</a></li>
						<li><a href="#">15</a></li>
						<li><a href="#">Next &raquo;</a></li>
					</ul>
				</nav>
				 --%>
				<nav class="pagination">
					<ul>
						<c:if test="${startPage>1}">
							<li><a href="../seoul/list.do?page=${startPage-1}">&laquo; Previous</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<li class="${curPage==i?'current':''}"><a href="../seoul/list.do?page=${i}">${i}</a></li>
						</c:forEach>
						<c:if test="${endPage<totalPage}">
							<li><a href="../seoul/list.do?page=${endPage+1}">&raquo; Previous</a></li>
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