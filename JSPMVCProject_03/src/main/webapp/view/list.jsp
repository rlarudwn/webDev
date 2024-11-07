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
</style>
</head>
<body>
	<div class="container">
		<h3>답변형 게시판</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-right">
						<a href="insert.do" class="btn btn-sm btn-info">새글</a>
					</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">이름</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<c:set var="count" value="${count}" />
					<tr>
						<td width="10%" class="text-center">${vo.no }</td>
						<td width="45%">
						<a href="detail.do?no=${vo.no }">
							<c:if test="${vo.group_tab>0}">
								<c:forEach var="i" begin="1" end="${vo.group_tab}">&nbsp;&nbsp;</c:forEach>
								<img src="re_icon.png">
							</c:if>
							${vo.subject }&nbsp;
							<c:if test="${vo.dbday==totay}">
								<img src="new.gif">
							</c:if>
							</a>
						</td>
						<td width="15%" class="text-center">${vo.name }</td>
						<td width="20%" class="text-center">${vo.dbday }</td>
						<td width="10%" class="text-center">${vo.hit }</td>
					</tr>
					<c:set var="count" value="${count-1}" />
				</c:forEach>
			</table>
			<table class="table">
				<tr>
					<td class="text-center">
						<a href="list.do?page=${curPage>1?curPage-1:curPage }" class="btn btn-sm btn-success">이전</a>
						${curPage }page/${totalPage }page
						<a href="list.do?page=${curPage<totalPage?curPage+1:curPage}" class="btn btn-sm btn-success">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>