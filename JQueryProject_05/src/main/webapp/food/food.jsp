<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="vo" items="${list}">
		<div class="col-sm-3">
			<div class="thumbnail">
				<img src="${vo.poster}" style="width: 100%">
				<p class="a">${vo.name}</p>
			</div>
		</div>
	</c:forEach>
</body>
</html>