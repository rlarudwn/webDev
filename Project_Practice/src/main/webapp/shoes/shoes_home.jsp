<%@page import="com.sist.model.ChangeModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.change.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container-fluid {
	margin-top: 10px;
	margin-left: 150px;
	margin-right: 150px;
}

.row {
	margin: 0 auto;
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.list_img-hover {
	border: 1px solid gray;
}

.item-hover {
	border: 1px solid gray;
}
</style>
</head>
<body>
	<jsp:include page="shoes_header.jsp"></jsp:include>
	<div class="container-fluid">
		<jsp:include page="${jsp}"></jsp:include>
	</div>
</body>
</html>