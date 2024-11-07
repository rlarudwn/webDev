<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
FoodDAO dao = FoodDAO.newInstance();
String fno = request.getParameter("fno");
FoodVO vo = dao.foodDetailData(Integer.parseInt(fno));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container {
	margin-top: 50px;
}

.row {
	width: 960px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table table-striped">
				<tr>
					<td width="30%" class="text-center" rowspan="7"><img
						src="<%=vo.getPoster()%>" style="width: 100%" class="img-rounded">
					</td>
					<td colspan="2"><h3><%=vo.getName()%></h3></td>
				<tr>
					<th>음식종류</th>
					<td><%=vo.getType()%></td>
				</tr>
				<tr>
					<th>전화</th>
					<td><%=vo.getPhone()%></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><%=vo.getAddress()%></td>
				</tr>
				<tr>
					<th>평점</th>
					<td><%=vo.getScore()%></td>
				</tr>
				<tr>
					<th>테마</th>
					<td><%=vo.getAddress()%></td>
				</tr>
				<tr>
					<td colspan="2" class="text-right"></td>
					<input type=button value="찜하기" class="btn-xs btn-primary)">
					<input type=button value="좋아요" class="btn-xs btn-primary)">
					<input type=button value="예약" class="btn-xs btn-primary)">
					<input type=button value="목록" class="btn-xs btn-primary)"
						onclick="javascript:history:back()">
				</tr>
			</table>
			<table></table>
		</div>
	</div>
</body>
</html>