<%--
	request / response / session
	
	application / out / pageContext
	page / config / exception
	==================================> 내장 객체
	cookie : 최신방문
		=> 보안 문제가 있을 가능성이 있어서 session을 주로 사용
		
		Beans	=> VO, DAO
	
	
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 1200px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp	"></jsp:include>
</body>
</html>