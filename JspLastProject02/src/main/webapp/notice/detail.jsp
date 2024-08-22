<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
		<div class="container clear">
			<table class="table">
				<tr>
					<th width="15%" class="text-center">번호</th>
					<td width="35%" class="text-center">${detail.no}</td>
					<th width="15%" class="text-center">작성일</th>
					<td width="35%" class="text-center">${detail.dbday}</td>
				</tr>
				<tr>
					<th width="15%" class="text-center">구분</th>
					<td width="35%" class="text-center">${detail.noticeType}</td>
					<th width="15%" class="text-center">조회수</th>
					<td width="35%" class="text-center">${detail.hit}</td>
				</tr>
				<tr>
					<th width="15%" class="text-center">제목</th>
					<td colspan="3">${detail.subject }</td>
				</tr>
				<tr>
					<td colspan="4" class="text-left" valign="top" height="200">
						<pre style="white-space: pre-wrap; background-color: none; border: none;">${detail.content }</pre>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<input type="button" value="목록" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>