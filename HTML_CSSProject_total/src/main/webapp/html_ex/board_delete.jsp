<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String no = request.getParameter("no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 30px;
}

.row {
	margin: 0px auto;
	width: 250px;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>

	<div class="container">
		<h3>삭제하기</h3>
		<div class="row">
			<form action="board_delete_ok.jsp" method="post">
				<table class="table">
					<tr>
						<td>
							비밀번호 :
							<input type="password" name="pwd" size="15" class="input-sm" required>
						</td>
					</tr>
					<tr>
						<td class="text-center">
						<input type="hidden" name="no" value="<%=no%>"> 
							<input type="submit" value="삭제" class="btn-sm btn-danger">
							<input type="button" value="취소" class="btn-sm btn-rpimary" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>