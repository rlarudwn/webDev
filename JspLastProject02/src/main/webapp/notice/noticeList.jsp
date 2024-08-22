<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 class="sectiontitle">공지사항</h2>
	<table class="table">
		<tr>
			<td>
				<a href="../admin/noticeInsert.do" class="btn btn-sm btn-danger">공지등록</a>
			</td>
		</tr>
	</table>
	<table class="table">
		<tr>
			<th width="10%" class="text-center">번호</th>
			<th width="35%" class="text-center">제목</th>
			<th width="10%" class="text-center">작성자</th>
			<th width="15%" class="text-center">작성일</th>
			<th width="10%" class="text-center">조회수</th>
			<th width="20%" class="text-center"></th>
		</tr>
		<c:forEach var="vo" items="${nList}" varStatus="i">
			<tr>
				<td width="10" class="text-center">${count-i.index}</td>
				<td width="35%">${vo.noticeType }&nbsp;${vo.subject }</td>
				<td width="10%" class="text-center">${vo.name }</td>
				<td width="15%" class="text-center">${vo.dbday }</td>
				<td width="10%" class="text-center">${vo.hit }</td>
				<td width="20%" class="text-center">
					<a href="../admin/noticeUpdate.do?no=${vo.no}" class="btn btn-sm btn-primary">수정</a>
					<a href="../admin/noticeDelete.do?no=${vo.no}" class="btn btn-sm btn-info">삭제</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
		<td colspan="6" class="text-center">
		<a href="#" class="btn btn-sm btn-success">이전</a>
	${curPage }page/${totalPage }page
		<a href="#" class="btn btn-sm btn-warning">다음</a>
		</td>
		</tr>
	</table>
</body>
</html>