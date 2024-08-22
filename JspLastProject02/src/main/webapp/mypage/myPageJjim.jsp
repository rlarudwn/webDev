<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${jjimCount==0 }">
		<table class="table">
			<tr>
				<td class="text-center">
					<h4>찜한 내용이 없습니다</h4>
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${jjimCount!=0 }">
		<table class="table">
			<tr>
				<th class="text-center">번호</th>
				<th class="text-center"></th>
				<th class="text-center">업체명</th>
				<th class="text-center"></th>
				<th class="text-center"></th>
			</tr>
		</table>
	</c:if>
</body>
</html>