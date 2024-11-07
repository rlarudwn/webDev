<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row"></div>
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-8">
				<table class="table">
					<thead>
						<tr>
							<th width="5%" class="text-center">번호</th>
							<th width="7%" class="text-center"></th>
							<th width="78%" class="text-center">곡정보</th>
							<th width="5%" class="text-center">좋아요</th>
							<th width="5%" class="text-center">듣기</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="vo" items="${list}" varStatus="i">
						<tr>
							<td width="5%" class="text-center">${i.index+1}</td>
							<td width="7%" class="text-center">${vo.poster}</td>
							<td width="78%" class="text-center">${vo.title}<br>${vo.aname}</td>
							<td width="5%" class="text-center"><img src="like_off.png"></td>
							<td width="5%" class="text-center"><img src="play.png"></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>