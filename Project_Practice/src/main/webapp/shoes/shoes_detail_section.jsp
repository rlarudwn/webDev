<%@page import="com.sist.model.ShoesModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="row">
		<div class="col-sm-9">
			<table class="table table-striped">
				<tr>
					<td rowspan="4">
						<img src="${shoesVo.poster}">
					</td>
					<th>이름</th>
					<td>${shoesVo.name}</td>
				</tr>
				<tr>
					<th>브랜드</th>
					<td>${shoesVo.brand}</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${shoesVo.price}</td>
				</tr>
				<tr>
					<th>제품코드</th>
					<td>${shoesVo.code }</td>
				</tr>
				<form method="post" action="../cart/cart_insert.jsp">
				<tr class="text-right">
					<td colspan="3">
						<input type="hidden" name="sno" value="${no}">
						<input type="text" size="5" name="account" required="required">
						<button class="btn-sm btn-primary">장바구니</button>
						<input type="button" class="btn btn-sm btn-danger" value="구매">
					</td>
				</tr>
				</form>
				<tr class="text-right">
					<td colspan="3">
						<a href="shoes_home.do?mode=1" class="btn btn-lg btn-info">목록</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="col-sm-3">
			<form action="" method="post">
				<table class="table">
					<tr>
						<td>
							<input type="hidden" name="type" value="1">
							<input type="hidden" name="no" value="${no }">
							<textarea rows="4" cols="39" name="msg" class="input-sm" style="float: left;"></textarea>
							<button class="btn btn-sm btn-primary" style="width: 70px; height: 83px; margin-left: 5px;">작성</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>