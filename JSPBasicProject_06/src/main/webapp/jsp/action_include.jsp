<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String mode = request.getParameter("mode");
String jsp = "";
if (mode == null)
	mode = "0";
int index = Integer.parseInt(mode);
switch (index) {
case 0:
	jsp = "home.jsp";
	break;
case 1:
	jsp = "join.jsp";
	break;
case 2:
	jsp = "idFind.jsp";
	break;
case 3:
	jsp = "passwordFind.jsp";
	break;
case 4:
	jsp = "send.jsp";
	break;
case 5:
	jsp = "myPage.jsp";
	break;
case 6:
	jsp = "recv.jsp";
	break;
}
%>
<%--
	<jsp:useBean>
		id="" : 객체명
		class="" : 클래스명
		scope="" : 언제 메모리 할당할 지
			page
				=> dafault	=> JSP안에서 사용
			session
				=> 브라우저에 유지하고 있는 동안
			application
				=> 객체를 모든 JSP에서 사용하고 싶은 경우
			request
				=> 사용자의 요청값이 있는 경우
			
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 960px;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="container">
		<jsp:include page="<%=jsp%>"></jsp:include>
	</div>
</body>
</html>