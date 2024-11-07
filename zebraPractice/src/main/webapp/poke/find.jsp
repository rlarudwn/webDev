<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
label {
	display: inline-block;
}
</style>
</head>
<body>
	<div class="row">
		<h3 style="text-align: center;">필터 검색</h3>
		<form action="../poke/find.do" method="post">
			<input type="hidden" name="mode" value="1">
			<table class="table">
				<tr>
					<th style="vertical-align: middle;">세대</th>
					<c:forEach var="i" begin="1" end="9">
						<td>
							<label><input type="checkbox" value="${i}" name="gen"> ${i}세대 </label>
						</td>
					</c:forEach>
				</tr>
				<c:forEach var="i" begin="0" end="1">
					<tr>
						<c:if test="${i==0}">
							<th style="vertical-align: middle;" rowspan="2">타입</th>
						</c:if>
						<c:forEach var="j" begin="0" end="8">
							<td>
								<label><input type="checkbox" value="${typeList[i*9+j]}" name="type"><img height="30" width="30" src="../image/${typeList[i*9+j]}.png">${typeList[i*9+j]} </label>
							</td>
						</c:forEach>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="10" class="text-center">
						<input type="text" size="30" name="name" class="input-lg">
						<button class="btn btn-lg btn-info">검색</button>
					</td>
				</tr>
			</table>
		</form>
		<div class="text-center"></div>
	</div>
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
	<div class="row"></div>
	<div class="row">
		<div class="text-center">
			<form action="../poke/find.do" method="post">
			<input type="hidden" name="mode" value="2">
				<input type="hidden" name="name" value="${name}">
				<input type="hidden" name="type" value="${type}">
				<input type="hidden" name="gen" value="${gen}">
				<ul class="pagination">
					<c:if test="${startPage>1}">
					<li>
					<button name="page" value="${startPage-1}" class="btn">&laquo;</button></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li>
						<button name="page" value="${i}" class="btn ${curPage==i?'btn-primary':'btn-info'}">${i}</button></li>
					</c:forEach>
					<c:if test="${endPage<totalPage}">
						<li>
						<button name="page" value="${endPage+1}" class="btn">&raquo;</button></li>
					</c:if>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>