<%@page import="com.sist.model.ShoesModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
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
			<c:forEach var="vo" items="${shoesList}">
				<div class="col-sm-2">
					<a href="shoes_home.do?mode=2&no=${vo.no }">
						<img class="list_img item" src="${vo.poster}" style="width: 170px; height: 170px; margin: 5px">
						<p class="a">${vo.name }</p>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="text-center">
			<form action="shoes_home.do?mode=1&type=${type}&key=${key}">
				<select name="type">
					<option value="select">검색옵션</option>
					<option value="1">제품명</option>
					<option value="2">브랜드명</option>
				</select>
				<input type="text" size="20" class="input-sm" name="key">
				<input type="submit" class="btn btn-info" value="검색하기">
			</form>
		</div>
	</div>
	<div class="row">
		<div class="text-center">
			<ul class="pagination">

				<c:if test="${startPage>1}">
					<li><a href="shoes_home.do?mode=1&type=${type}&key=${key}&page=${startPage-1}">&lt;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class=${curPage==i?"active":""}><a href="shoes_home.do?mode=1&type=${type}&key=${key}&page=${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${endPage<totalPage}">
					<li><a href="shoes_home.do?mode=1&type=${type}&key=${key}&page=${endPage+1}">&gt;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>