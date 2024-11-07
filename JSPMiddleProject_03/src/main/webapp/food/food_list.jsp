<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 800px;
}

h3 {
	text-align: center
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<c:forEach var="vo" items="${foodList}">
					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="${vo.poster}" width="240px" height="200px">
							<p class="a">${vo.name }</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${startPage>1}">
						<li><a href="food_list.do?page=${startPage-1}">&lt;</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<li class=${curPage==i?"active":""}><a href="food_list.do?page=${i }">${i }</a></li>
					</c:forEach>
					<c:if test="${endPage<totalPage}">
						<li><a href="food_list.do?page=${endPage+1}">&gt;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>