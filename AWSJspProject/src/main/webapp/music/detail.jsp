<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<th class="text-center">노래명</th>
			<td width="40%">${detail.title }</td>
			<th class="text-center">가수명</th>
			<td width="40%">${detail.singer }</td>
			</tr>
			<tr>
			<td colspan="4" class="text-center">
			<embed src="http://youtube.com/embed${detail.key}" style="width: 600px; height: 450px;">
			</td>
			</tr>
		</table>
	</div>
</body>
</html>