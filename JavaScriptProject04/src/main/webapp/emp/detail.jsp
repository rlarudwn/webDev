<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<th class="text-center">사번</th>
					<td class="text-center">${detail.empno }</td>
				</tr>
				<tr>
					<th class="text-center">이름</th>
					<td class="text-center">${detail.ename }</td>
				</tr>
				<tr>
					<th class="text-center">직위</th>
					<td class="text-center">${detail.job }</td>
				</tr>
				<tr>
					<th class="text-center">사수</th>
					<td class="text-center">${detail.mgr }</td>
				</tr>
				<tr>
					<th class="text-center">급여</th>
					<td class="text-center">${detail.sal }</td>
				</tr>
				<tr>
					<th class="text-center">성과금</th>
					<td class="text-center">${detail.comm }</td>
				</tr>
				<tr>
					<th class="text-center">부서번호</th>
					<td class="text-center">${detail.deptno }</td>
				</tr>
				<tr>
					<th class="text-center">입사일</th>
					<td class="text-center">
					<fmt:formatDate value="${detail.hiredate }" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
				<td colspan="2" class="text-right"><a href="list.do" class="btn btn-sm btn-primary">목록</a></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>