<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h3>상세보기</h3>
		<div class="row">
			<table class="table">
				<tr>
					<th width="15%">번호</th>
					<td width="35%">${boardVo.no}</td>
					<th width="15%">작성일</th>
					<td width="35%">${boardVo.dbday}</td>
				</tr>
				<tr>
					<th width="15%">이름</th>
					<td width="35%">${boardVo.name}</td>
					<th width="15%">조회수</th>
					<td width="35%">${boardVo.hit}</td>
				</tr>
				<tr>
					<th width="15%">제목</th>
					<td width="85%" colspan="3">${boardVo.subject}</td>
				</tr>
				<tr>
					<td colspan="4" class="text-left" valign="top" height="200px">
						<pre style="white-space: pre-line; border: none; background-color: white;">${boardVo.content}</pre>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<a href="update.do?no=${boardVo.no}" class="btn btn-sm btn-warning">수정</a>
						<a href="delete.do?no=${boardVo.no}" class="btn btn-sm btn-danger">삭제</a>
						<a href="list.do" class="btn btn-sm btn-success">목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>