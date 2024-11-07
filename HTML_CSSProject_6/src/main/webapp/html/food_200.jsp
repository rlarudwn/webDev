<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
FoodDAO dao = FoodDAO.newInstance();
List<FoodVO> list = dao.foodListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	width: 700px;
	height: 500px;
	overflow-y: scroll;
}
</style>
<link rel="stylesheet" href="table.css">
</head>
<body>
	<div class="food">
		<div class="table_content" width: 650px>
			<tr>
				<th>번호</th>
				<th></th>
				<th>업체명</th>
				<th>음식종류</th>
			</tr>
			<%
			for (FoodVO vo : list) {
			%>
			<tr>
				<td align="center"><%=vo.getFno()%></td>
				<td align="center"><img src="<%=vo.getPoster()%>" width="35"
					height="35"></td>
				<td align="center"><%=vo.getName()%></td>
				<td align="center"><%=vo.getType()%></td>
			</tr>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>