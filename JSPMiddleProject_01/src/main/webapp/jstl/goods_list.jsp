<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
GoodsModel model = new GoodsModel();
model.goodsListData(request);
%>
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
				<c:forEach var="vo" items="${goods_list}">
					<div class="col-sm-3">
						<div class="thumbnail">
							<img src="${vo.poster }">
							<p class="a">${vo.name}</p>
							<p>${vo.price }</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div style="height: 20px;"></div>
		<div class="row">
			<div class="text-center">
				<a href="goods_list.jsp?page=${curPage>1?curPage-1:curPage}" class="btn btn-sm btn-info">&lt;</a>
				${curPage }page/${totalPage}page
				<a href="goods_list.jsp?page=${curPage<totalPage?curPage+1:curPage}" class="btn btn-sm btn-success">&gt;</a>
			</div>
		</div>
	</div>
</body>
</html>