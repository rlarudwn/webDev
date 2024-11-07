<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="URF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">이름</th>
					<th class="text-center">생성일</th>
					<th class="text-center">노래개수</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td class="text-center">${vo.plno}</td>
						<td>${vo.plname}</td>
						<td class="text-center">${vo.daday}</td>
						<td class="text-cemter">${vo.count}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>