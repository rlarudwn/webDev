<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 class="sectiontitle">공지등록</h2>
	<form action="../admin/noticeInsertOk.do" method="post">
		<table class="table">
			<tr>
				<th width="text-center">구분</th>
				<td width="80%">
					<select class="input input-sm" name="type">
						<option value="1">일반공지</option>
						<option value="2">이벤트공지</option>
						<option value="3">맛집공지</option>
						<option value="4">여행공지</option>
					</select>
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-center">제목</th>
				<td width="80%">
					<input type="text" name="subject" class="input input-sm" size="50">
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-center">내용</th>
				<td width="80%">
					<textarea rows="10" cols="50" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn btn-sm btn-success" style="display: inline-block;">작성</button>
					<input type="button" value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>