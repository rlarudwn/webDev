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
	<div>
		<h3>내용보기</h3>
		<div class="row">
			<table class="table">
				<tr>
					<th width="20%" class="text-center">번호</th>
					<td width="30%" class="text-center">${detail.no }</td>
					<th width="20%" class="text-center">작성일</th>
					<td width="30%" class="text-center">${detail.dbday }</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">이름</th>
					<td width="30%" class="text-center">${detail.name }</td>
					<th width="20%" class="text-center">조회수</th>
					<td width="30%" class="text-center">${detail.hit }</td>
				</tr>
				<tr>
					<th width="20%" class="text-center">제목</th>
					<td colspan="3">${detail.subject }</td>
				</tr>
				<tr>
					<td colspan="4" valign="top" class="text-left" height="200">
						<pre style="white-space: pre-wrap; border: none; background-color: white;">${detail.content }</pre>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
					<a href="reply.do?no=${detail.no}" class="btn btn-sm btn-info">답변</a>
					<a href="update.do?no=${detail.no}" class="btn btn-sm btn-success">수정</a>
					<a href="#" class="btn btn-sm btn-danger">삭제</a>
					<a href="#" class="btn btn-sm btn-primary">목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>