<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="text-center">
			<c:forEach var="vo" items="${list}">
				<div class="col-sm-3">
					<div class="thumbnail">
						<a href="../poke/detail.do?no=${vo.no}">
							<img src="${vo.poster}">
							<p>${vo.pno}.${vo.name}</p>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="text-center">
			<form action="../poke/list.do?name=${name}" method="get">
				<input type="text" size="20" name="name">
				<button class="btn btn-sm btn-info">검색</button>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${startPage>1}">
					<li><a href="../poke/list.do?page=${startPage-1}&name=${name}">&lt;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class=${curPage==i?"active":"" }><a href="../poke/list.do?page=${i}&name=${name}">${i}</a></li>
				</c:forEach>
				<c:if test="${endPage<totalPage}">
					<li><a href="../poke/list.do?page=${endPage+1}&name=${name}">&gt;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>