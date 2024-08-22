<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
</style>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">문의 게시판</h2>
			<table class="table">
				<tr>
					<td>
						<a href="../replyBoard/insert.do" class="btn btn-sm btn-primary">등록</a>
					</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="40%" class="text-center">제목</th>
					<th width="15%" class="text-center">작성자</th>
					<th width="15%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
					<th width="10%" class="text-center">상태</th>
				</tr>
				<c:forEach var="vo" items="${rbList}" varStatus="i">
					<tr>
						<td width="10%" class="text-center">${count+i.index}</td>
						<td width="40%">
							<c:if test="${vo.group_step>0}">&nbsp;&nbsp;<img src="re_icon.png">
							</c:if>${vo.subject }</td>
						<td width="15%" class="text-center">${vo.name}</td>
						<td width="15%" class="text-center">${vo.dbday}</td>
						<td width="10%" class="text-center">${vo.hit}</td>
						<td width="10%" class="text-center"></td>
					</tr>
				</c:forEach>
			</table>
			<table class="table">
				<tr>
					<td class="text-center">
						<a href="#" class="btn btn-sm btn-info">이전</a>
						${curPage }page/${totalPage }page
						<a href="#" class="btn btn-sm btn-success">다음</a>
					</td>
				</tr>
			</table>
		</main>
	</div>

</body>
</html>