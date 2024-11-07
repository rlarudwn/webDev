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
		<table class="table">
			<tr>
				<th width="10%" class="text-center">번호</th>
				<th width="45%" class="text-center">제목</th>
				<th width="15%" class="text-center">이름</th>
				<th width="20%" class="text-center">작성일</th>
				<th width="10%" class="text-center">조회수</th>
			</tr>
			<c:forEach var="vo" items="${list}">
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
		</table>
	</div>
</body>
</html>