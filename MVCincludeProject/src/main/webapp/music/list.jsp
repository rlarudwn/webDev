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
		<h1>음악 목록</h1>
		<table class="table">
			<tr>
				<th width="10%" class="text-center">순위</th>
				<th width="10%" class="text-center"></th>
				<th width="10%" class="text-center"></th>
				<th width="50%" class="text-center">곡명</th>
				<th width="20%" class="text-center">가수명</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td class="text-center">${vo.mno}</td>
					<td class="text-center">
						<c:choose>
							<c:when test="${vo.state=='유지' }">
								<span style="color: gray;">-</span>
							</c:when>
							<c:when test="${vo.state=='상승' }"><span style="color: blue;">▲</span>&nbsp;${vo.idcrement }</c:when>
							<c:when test="${vo.state=='하강' }"><span style="color: red;">▼</span>&nbsp;${vo.idcrement }</c:when>
						</c:choose>
					</td>
					<td>
						<img src="${vo.poster }" width="45" height="45">
					</td>
					<td><a href="../music/detail.do?mno=${vo.mno }">${vo.title }</a></td>
					<td class="text-center">${vo.singer }</td>
				</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td class="text-center">
					<a href="list.do?page=${curPage>1?curPage-1:curPage }" class="btn btn-sm btn-info">이전</a>
					${curPage }page/${totalPage }page
					<a href="list.do?page=${curPage<totalPage?curPage+1:curPage }" class="btn btn-sm btn-info">다음</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>