<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
GoodsDAO dao = GoodsDAO.newInstance();
String no = request.getParameter("no");
String type = request.getParameter("type");
GoodsVO vo = dao.goodsDetailData(Integer.parseInt(type), Integer.parseInt(no));
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
	margin-top: 10px;
}

.row {
	width: 960px;
	margin: 0 auto;
}
</style>
</head>

<div class="container">
	<div class="row">
		<table class="table table-striped">
			<tr>
				<td width="30%" class="text-center" rowspan="7"><img
					src="<%=vo.getPoster()%>" style="width: 100%" class="image-rounded"></td>
				<td colspan="2"><h3><%=vo.getName()%></h3></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><%=vo.getPrice()%></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=vo.getHit() %></td>
			</tr>
			<tr>
				<th>할인율</th>
				<td><%=vo.getDiscount() %>%</td>
			</tr>
			<tr>
				<th>판매가</th>
				<td><%=vo.getFirst_price() %></td>
			</tr>
			<tr>
				<th><img src="delivery.png" style="width: 27px; height: 27px"> 배송</th>
				<td><%=vo.getDelivery() %></td>
			</tr>
			<tr>
				<th>제품설명</th>
				<td><%=vo.getSub() %></td>
			</tr>
			<tr>
			<td colspan="2" class="text-right">
			<input type="button" value="장바구니" class="btn-lg btn-primary">
			<input type="button" value="구매하기" class="btn-lg btn-danger">
			<input type="button" value="목록" class="btn-lg btn-success"
			onclick="javascript:history.back()">
			</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>