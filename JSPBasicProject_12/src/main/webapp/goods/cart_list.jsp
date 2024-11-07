<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.dao.*, java.util.*"%>
<%
List<CartVO> list = (List<CartVO>) session.getAttribute("cart");

List<CartVO> mlist = new ArrayList<CartVO>();
String id = (String) session.getAttribute("id");
if (list != null) {
	for (CartVO vo : list) {
		if (vo.getId().equals(id)) {
	mlist.add(vo);
		}
	}
}
%>
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
	width: 800px;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>장바구니</h3>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center" width="10%">번호</th>
						<th class="text-center" width="20%"></th>
						<th class="text-center" width="30%">상품명</th>
						<th class="text-center" width="20%">가격</th>
						<th class="text-center" width="10%">수량</th>
						<th class="text-center" width="10%"></th>
					</tr>
				</thead>
				<tbody>
					<%
					for (CartVO vo2 : mlist) {
					%>
					<tr>
						<td width="10%" class="text-center"><%=vo2.getNo()%></td>
						<td width="20%">
							<img src="<%=vo2.getPoster()%>" width="100%" height="100%">
						</td>
						<td width="30%" class="text-center"><%=vo2.getName()%></td>
						<td width="20%" class="text-center"><%=vo2.getPrice()%></td>
						<td width="10%" class="text-center"><%=vo2.getAccount()%></td>
						<td width="10%">
							<a href="cart_delete.jsp?no=<%=vo2.getNo()%>" class="btn btn-sm btn-danger">취소</a>
						</td>
					</tr>
					<%
					}
					%>
					<tr>
						<td colspan="6" class="text-center">
							<a href="goods_list.jsp" class="btn btn-info">목록</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>