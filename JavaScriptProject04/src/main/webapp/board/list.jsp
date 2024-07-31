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
	width: 960px;
}
</style>
</head>
<body>
	<div class="container">
		<h3 class="text-center">자유게시판</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td colspan="5" class="text-right">
						<a href="insert.do" class="btn btn-sm btn-default">글쓰기</a>
					</td>
				</tr>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">이름</th>
					<th class="text-center">작성일</th>
					<th class="text-center">조회수</th>
				</tr>
				<c:forEach var="vo" items="${list }" varStatus="i">
					<tr>
						<td class="text-center">${count-i.index}</td>
						<td>
							<a href="detail.do?no=${vo.no}">${vo.subject }</a>
						</td>
						<td class="text-center">${vo.name }</td>
						<td class="text-center">${vo.dbday }</td>
						<td class="text-center">${vo.hit }</td>
					</tr>
				</c:forEach>
			</table>
			<table class="table">
				<tr>
					<td class="text-center">
						<a href="list.do?page=${curPage>1?curPage-1:curPage}" class="btn btn-sm btn-primary">이전</a>
						${curPage}page/${totalPage }page
						<a href="list.do?page=${curPage<totalPage?curPage+1:curPage}" class="btn btn-sm btn-primary">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>