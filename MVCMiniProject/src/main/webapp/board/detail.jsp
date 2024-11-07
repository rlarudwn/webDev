<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.brow {
	margin: 0px auto;
	width: 800px;
}
</style>
</head>
<body>
	<div class="wrapper_row3">
		<main class="container clear">
			<div class="brow">
				<h2 class="sectiontitle">글쓰기</h2>
				<table class="table">
					<tr>
						<th width="10%" class="text-center">번호</th>
						<td width="40%">${detail.no }</td>
						<th width="10%" class="text-center">작성일</th>
						<td width="40%">${detail.dbDay }</td>
					</tr>
					<tr>
						<th width="10%" class="text-center">이름</th>
						<td width="40%">${detail.name }</td>
						<th width="10%" class="text-center">조회수</th>
						<td width="40%">${detail.hit }</td>
					</tr>
					<tr>
						<th width="10%" class="text-center">제목</th>
						<td width="90%" colspan="3">${detail.subject }</td>
					</tr>
					<tr>
						<td colspan="4" class="text-left" valign="top" height="200">
							<pre style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden; background: white; height: 200px;">
						${detail.content }
						</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
							<a href="../board/update.do?no=${detail.no}" class="btn btn-sm btn-warning">수정</a>
							<a href="../board/delete.do?no=${detail.no}" class="btn btn-sm btn-danger">삭제</a>
							<a href="../board/list.do" class="btn btn-sm btn-primary">목록</a>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-left">
							<c:if test="${prev.subject!=null}">
								<a href="../board/detail.do?no=${prev.no}">이전글 ${prev.subject}</a>
							</c:if>
						</td>
						<td colspan="2" class="text-right">
							<c:if test="${next.subject!=null}">
								<a href="../board/detail.do?no=${next.no}">${next.subject} <span>다음글</span></a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</main>
	</div>
</body>
</html>