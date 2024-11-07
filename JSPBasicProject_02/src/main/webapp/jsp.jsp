<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
</head>
<body>
	<center>
		<table class="table_content" width=500>
			<tr>
				<th width=20% class="tdright">이름</th>
				<td width=80%><input type="text" size="12"> </td>
			</tr>
			<tr>
			<th width=20% class="tdright">성별</th>
				<td>
					<input type=radio value="남자" name=sex checked>
					남자
					<input type=radio value="여자" name=sex>
					여자
				</td>
			</tr>
			<tr>
				<th width=20% class="tdright">전화</th>
				<td width=80%>
					<select name="tell">
						<option>010</option>
						<option>011</option>
						<option>012</option>
					</select>
					<input type="text" name="tel2" size=15>
				</td>
			</tr>
			<tr>
				<th width=20% class="tdright">소개</th>
				<td width=80%>
					<textarea></textarea>
				</td>
			</tr>
			<tr>
				<th width=20% class="tdright">취미</th>
				<td width=80%>
					<input type=checkbox value="1" name=ha>
					1
					<input type=checkbox value="2" name=ha>
					2
					<input type=checkbox value="3" name=ha>
					3
					<input type=checkbox value="4" name=ha>
					4
					<input type=checkbox value="5" name=ha>
					5
				</td>
			</tr>
			<tr>
				<td colspan=2 class="tdcenter">
					<button>전송</button>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>
