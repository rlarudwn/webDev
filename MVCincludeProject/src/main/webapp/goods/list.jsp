<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.a{
white-space: nowrap;
overflow: hidden;
text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="row">
		<div class="text-center">
			<c:forEach var="vo" items="${goods}">
				<div class="col-sm-3">
					<div class="thumbnail">
						<a href="../goods/detail.do?no=${vo.no}">
							<img src="${vo.poster }">
							<p class="a">${vo.name}</p>
							<br>
							<p class="a">${vo.price}</p>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${startPage>1}">
					<li><a href="../goods/list.do?page=${startPage-1}">&lt;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class=${curPage==i?"active":""}><a href="../goods/list.do?page=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${endPage<totalPage}">
					<li><a href="../goods/list.do?page=${endPage+1}">&gt;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>