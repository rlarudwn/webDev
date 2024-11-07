<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 30px;
}

.row {
	margin: 0px auto;
	width: 800px;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>글쓰기</h3>
		<div class="row">
			<form action="board_insert_ok.jsp" method="post">
				<table class="table">
					<tr>
						<th width="25%" class="text-right">이름</th>
						<td width="75%">
							<input type="text" size="20" class="input-sm" required name="name">
						</td>
					</tr>
					<tr>
						<th width="25%" class="text-right">제목</th>
						<td width="75%">
							<input type="text" size="50" class="input-sm" required name="subject">
						</td>
					</tr>
					<tr>
						<th width="25%" class="text-right">내용</th>
						<td width="75%">
							<textarea rows="10" cols="50" name="content" required></textarea>
						</td>
					</tr>
					<tr>
						<th width="25%" class="text-right">비밀번호</th>
						<td width="75%">
							<input type="password" size="20" class="input-sm" name="pwd" required>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" value="글쓰기" class="btn-sm btn-success">
							<input type="button" value="취소" class="btn-sm btn-warning" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>