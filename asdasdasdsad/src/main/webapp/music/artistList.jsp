<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<c:forEach var="vo" items="${list}">
				<div class="col-sm-2">
					<img src="${vo.poster }">
				</div>
				<div class="col-sm-2">
					<span>${vo.aname }<br></span> <span>${vo.type }<br></span> <span>${vo.nation }</span>
				</div>
			</c:forEach>
		</div>
		<div style="height: 20px;"></div>
		<div class="row">
			<div class="text-center">
				<a href="../music/artistList.do?page=${curPage>1?curPage-1:curPage}&ss=${ss}">이전</a> ${curPage} page/${totalPage } page <a
					href="../music/artistList.do?page=${curPage<totalPage?curPage+1:curPage}&ss=${ss}">다음</a>
			</div>
		</div>
	</div>
</body>
</html>