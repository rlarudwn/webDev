<%@page import="com.sist.dao.GoodsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.dao.GoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String strPage = request.getParameter("page");
if (strPage == null)
	strPage = "1";
int curPage = Integer.parseInt(strPage);
GoodsDAO dao = GoodsDAO.newInstance();
List<GoodsVO> list = dao.goodsListData(curPage);
final int BLOCK = 10;
int startPage = (curPage - 1) / BLOCK * BLOCK + 1;
int endPage = startPage + BLOCK - 1;
int totalPage = dao.goodsTotalPage();
if (endPage > totalPage)
	endPage = totalPage;
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
	width: 960px;
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="text-center">상품목록</h1>
		<div class="row">
			<a href="cart_list.jsp" class="btn btn-sm btn-success">장바구니 목록 보기</a>
		</div>
		<div style="height: 20px"></div>
		<div class="row">
			<div class="text-center">
				<%
				for (GoodsVO vo : list) {
				%>
				<div class="col-sm-3">
					<div class="thumbnail">
						<img src="<%=vo.getPoster()%>">
						<p class="a"><%=vo.getNo()%>.<%=vo.getName()%></p>
						<p><%=vo.getPrice()%></p>
						<p>
						<form method="post" action="cart_insert.jsp">
							수량:
							<select name="account">
								<%
								for (int i = 1; i <= 10; i++) {
								%>
								<option  value="<%=i%>"><%=i%>개
								</option>
								<%
								}
								%>
							</select>
							<input type="hidden" name="poster" value="<%=vo.getPoster()%>">
							<input type="hidden" name="name" value="<%=vo.getName()%>">
							<input type="hidden" name="price" value="<%=vo.getPrice()%>">
							<input type="hidden" name="no" value="<%=vo.getNo()%>">
							<button class="btn-sm btn-primary">장바구니</button>
						</form>
						</p>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<div style="height: 20px;"></div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination">
					<%
					if (startPage > 1) {
					%>
					<li><a href="goods_list.jsp?page=<%=startPage - 1%>">&laquo;</a></li>
					<%
					}
					%>
					<%
					for (int i = startPage; i <= endPage; i++) {
					%>
					<li class="<%=i == curPage ? "active" : ""%>"><a href="goods_list.jsp?page=<%=i%>"><%=i%></a></li>
					<%
					}
					%>
					<%
					if (endPage < totalPage) {
					%>
					<li><a href="goods_list.jsp?page=<%=endPage + 1%>">&raquo;</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>