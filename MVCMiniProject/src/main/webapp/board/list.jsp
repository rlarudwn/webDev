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
	<div class="wrapper row3">
		<main class="container clear">
			<div class="brow">
				<h2 class="sectiontitle">자유게시판</h2>
				<div class="text-right">
					<a href="../board/insert.do" class="btn btn-sm btn-warning">새글</a>
				</div>
				<table class="table">
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="45%" class="text-center">제목</th>
						<th width="15%" class="text-center">이름</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="10%" class="text-center">조회수</th>
					</tr>
					<c:forEach var="vo" items="${list }" varStatus="i">
						<tr>
							<td class="text-center">${count-i.index}</td>
							<td>
								<a href="../board/detail.do?no=${vo.no}">${vo.subject}
									<c:if test="${vo.dbDay==today}">
										<sup><img src="../board/new.gif"></sup>
									</c:if>
								</a>
							</td>
							<td class="text-center">${vo.name}</td>
							<td class="text-center">${vo.dbDay}</td>
							<td class="text-center">${vo.hit}</td>
						</tr>
					</c:forEach>

					<tr>
						<td class="text-right inline" colspan="5">
							<label><input type="checkbox" value="name"> 이름</label> <label><input type="checkbox" value="subject"> 제목</label> <label><input type="checkbox" value="content"> 내용</label>
							<input type="text" name="ss" class="input-sm" size="15">
							<input type="submit" class="btn btn-sm btn-primary" value="검색">
						</td>
					</tr>
					<tr>
						<td class="text-center" colspan="5">
							<a href="../board/list.do?page=${curPage>1?curPage-1:curPage}" class="btn btn-sm btn-info">이전</a>
							${curPage}page/${totalPage }page
							<a href="../board/list.do?page=${curPage<totalPage?curPage+1:curPage}" class="btn btn-sm btn-info">다음</a>
						</td>
					</tr>
				</table>
				<table class="table">
				</table>
			</div>
		</main>
	</div>

</body>
</html>