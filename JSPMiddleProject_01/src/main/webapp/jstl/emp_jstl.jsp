<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.vo.*, java.util.*"%>
<%
EmpDAO dao = EmpDAO.newInstance();
List<EmpVO> list = dao.empListData();
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
					<%
					for (EmpVO vo : list) {
					%>
					<tr>
						<td><%=vo.getEmpno()%></td>
						<td><%=vo.getEname()%></td>
						<td><%=vo.getJob()%></td>
						<td><%=vo.getSal()%></td>
						<td><%=vo.getHiredate()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>