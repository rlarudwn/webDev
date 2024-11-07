<%@page import="com.sist.model.CartModel"%>
<%@page import="com.sist.dao.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
CartModel model=new CartModel();
model.cartListData(request, session);
%>
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
				<th width="17%"></th>
				<th width="30%">상품명</th>
				<th width="7%">개수</th>
				<th width="20%">가격</th>
				<th width="20%">추가일</th>
				<th width="6%"></th>
			</tr>
			<c:forEach var="vo" items="${cartList}">
			<tr>
				<td>
					<a href="shoes_home.do?mode=1&no=${vo.sno}"><img src="${vo.svo.poster}" height="100%" width="100%"></a>
				</td>
				<td style="vertical-align: middle;">${vo.svo.name}</td>
				<td style="vertical-align: middle;">${vo.account}</td>
				<td style="vertical-align: middle;">${vo.svo.price}</td>
				<td style="vertical-align: middle;">${vo.dbDay }</td>
				<td style="vertical-align: middle;">
					<a  href="../cart/cart_delete.jsp?no=${vo.no}" class="btn btn-sm btn-danger">삭제</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>