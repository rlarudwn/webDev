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
				<td rowspan="4">
					<img src="${detail.poster}" width="500" height="500">
				</td>
				<th class="text-center">제품번호</th>
				<td class="text-center">${detail.no }</td>
				<th class="text-center">조회수</th>
				<td class="text-center">${detail.hit }</td>
			</tr>
			<tr>
				<th class="text-center">제품명</th>
				<td colspan="3" class="text-center">${detail.name}</td>
			</tr>
			<tr>
				<th class="text-center">설명</th>
				<td colspan="3">${detail.sub }</td>
			</tr>

			<tr>
				<th class="text-center">가격</th>
				<td class="text-center">${detail.price }</td>
				<th class="text-center">할인율</th>
				<td class="text-center">${detail.discount }%</td>
			</tr>
			<tr>
			<td colspan="5" class="text-right"><a href="../goods/list.do" class="btn btn-sm btn-info">목록</a></td>
			</tr>
		</table>
	</div>
</body>
</html>