<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:forEach var="vo" items="${list}">
			<div class="col-md-3">
				<div class="thumbnail">
					<a href="../main/detail.do?mno=${vo.mno}">
						<img src="${vo.poster }" style="widows: 230px;height:150px;">
						<div class="caption">
							<p>${vo.title }</p>
						</div>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<div style="height: 10px"></div>
	<div class="row">
	<div class="text-center">
	<a href="../main/main.do?page=${curPage>1?curPage-1:curPage }" class="btn btn-sm btn-primary">이전</a>
	${curPage}page/${totalPage }page
	<a href="../main/main.do?page=${curPage<totalPage?curPage+1:curPage }" class="btn btn-sm btn-info">다음</a>
	</div>
	</div>
</body>
</html>