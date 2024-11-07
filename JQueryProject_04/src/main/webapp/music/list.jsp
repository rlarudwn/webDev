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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
	$('#keyword').keyup(function() {
		let k=$('#keyword').val()
		$('#user-table > tbody > tr').hide()
		let temp=('#user-table > tbody > tr > td:nth-child(5n+4):contains("'+k+'")')
		$(temp).parent().show()
	})
	})
</script>
</head>
<body>
	<div class="container">
	<h1 class="text-center">MUSIC TOP 50</h1>
		<div class="row">
		<table>
		<tr>
		<td><input type="text" size="15" class="input-sm" id="keyword">
		</td>
		</tr>
		</table>
			<table class="table" id="user-table">
				<thead>
					<tr>
						<th width="10%" class="text-center">순위</th>
						<th width="10%" class="text-center"></th>
						<th width="20%" class="text-center"></th>
						<th width="40%" class="text-center">제목</th>
						<th width="20%" class="text-center">가수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td class="text-center">${vo.mno }</td>
							<td>
								<c:choose>
									<c:when test="${vo.state=='상승' }">▲</c:when>
									<c:when test="${vo.state=='하락' }">▼</c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</td>
							<td class="text-center">
								<img src="${vo.poster}">
							</td>
							<td class="text-center">${vo.title }</td>
							<td class="text-center">${vo.singer }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>