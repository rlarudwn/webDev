<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
EmpModel model = new EmpModel();
model.empListData(request);
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
	text-align: center
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">사번</th>
						<th class="text-center">사원명</th>
						<th class="text-center">직위</th>
						<th class="text-center">급여</th>
						<th class="text-center">입사일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${emp}">
						<tr>
							<td class="text-center">${i.empno}</td>
							<td class="text-center">${i.ename}</td>
							<td class="text-center">${i.job}</td>
							<td class="text-center">${i.sal}</td>
							<td class="text-center">${i.hiredate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>