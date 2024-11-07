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
	width: 300px;
}

h3 {
	text-align: center
}
</style>
</head>
<body>
	<div class="container">
		<h3>삭제</h3>
		<div class="row">
			<form method="post" action="delete_ok.jsp?no=${param.no}">
				<table class="table">
					<tr>
						<th>비밀번호</th>
						<td class="text-center">
							<input type="hidden" name="no" value="${param.no}">
							<input type="password" size="20" name="pwd">
						</td>
					</tr>
					<tr>
						<td class="text-right" colspan="2">
							<button class="btn btn-sm btn-primary">삭제</button>
							<a href="detail.jsp?no=${param.no}" class="btn btn-sm btn-info">취소</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>