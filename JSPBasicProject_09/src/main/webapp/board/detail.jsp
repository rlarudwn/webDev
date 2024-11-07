<%@page import="com.sist.dao.EmpVO"%>
<%@page import="com.sist.dao.EmpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String empno = request.getParameter("empno");
EmpDAO dao = EmpDAO.newInstance();
EmpVO vo = dao.empDetailData(Integer.parseInt(empno));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 600px;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<table class="table-stripe">
				<tr>
					<th>이름</th>
					<td><%=vo.getEname()%></td>
					<th>사번</th>
					<td><%=vo.getEname()%></td>
				</tr>
				<tr>
					<th>직위</th>
					<td><%=vo.getJob()%></td>
					<th>부서명</th>
					<td><%=vo.getDvo().getDname()%></td>
				</tr>
				<tr>
					<th>부서번호</th>
					<td><%=vo.getDeptno()%></td>
					<th>근무지</th>
					<td><%=vo.getDvo().getLoc()%></td>

				</tr>
				<tr>
					<th>호봉</th>
					<td><%=vo.getSvo().getGrade()%></td>
					<th>연봉</th>
					<td><%=vo.getSal()%></td>

				</tr>
				<tr>
					<th>성과금</th>
					<td><%=vo.getComm()%></td>
					<th>입사일</th>
					<td><%=vo.getHiredate()%></td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>