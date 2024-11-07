<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1 {
	margin: 0px auto;
	width: 500px;
}
</style>
</head>
<body>
	<div class="row row1">
		<h1 class="text-center">Send</h1>
		<form method="post" action="action_include.jsp?mode=6">
			<table class="table">
				<tr>
					<th width="20%">이름</th>
					<td width="80%">
						<input type="text" class="input-sm" name="name" size="20">
					</td>
				</tr>
				<tr>
					<th width="20%">성별</th>
					<td width="80%">
						<input name="sex" type="radio" value="남자" checked="checked">
						남자
						<input name="sex" type="radio" value="여자">
						여자
					</td>
				</tr>
				<tr>
					<th width="20%">주소</th>
					<td width="80%">
						<input type="text" class="input-sm" name="address" size="50">
					</td>
				</tr>
				<tr>
					<th width="20%">전화번호</th>
					<td width="80%">
						<input type="text" class="input-sm" name="phone" size="20">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button class="btn-sm btn-info">전송</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>