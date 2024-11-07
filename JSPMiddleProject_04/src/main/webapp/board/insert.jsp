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
		<h3>글쓰기</h3>
		<div class="row">
			<form action="insert_ok.do" method="post">
				<table class="table">
					<tr>
						<th width="20%">이름</th>
						<td width="80%">
							<input type="text" size="20" name="name" required>
						</td>
					</tr>
					<tr>
						<th width="20%">제목</th>
						<td width="80%">
							<input type="text" size="50" name="subject" required>
						</td>
					</tr>
					<tr>

						<th width="20%">내용</th>
						<td width="80%">
							<textarea rows="10" cols="50" name="content" required></textarea>
						</td>
					</tr>
					<tr>
						<th width="20%">비밀번호</th>
						<td width="80%">
							<input type="password" size="20" name="pwd" required>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-right">
							<input type="button" class="btn btn-sm btn-danger" value="취소" onclick="javascript:history.back()">
							<button class="btn-sm btn-warning">작성</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>