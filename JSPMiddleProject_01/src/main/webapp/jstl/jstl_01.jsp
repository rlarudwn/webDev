<%--
	JSTL (JSP Standart Tab Library)
		태그로 제어문, String, 날짜, 숫자 .. 화면 이동	=> jstl-1.2.jar
		자바문법을 태그로 제작	=> 사용자정의(X)
		EL/JSTL	=> JSP화면 출력
		
		core : 
			제어문
				반복문 : 
				<c:forEach>
					속성
						begin : 시작
						end : 끝
						step : 증가(감소 없음)
					for(int i=1;i<=10;i++)
						<c:forEach var="i" begin="1" end="10" step="1">	=> step생략 가능
					forEach구문
						<c:forEach var="vo" items="list">
						<c:forEach var="a" value="red,blue,black" delimt=",">
							=> delimt => 구분자
				조건문 : 
				<c:if>	=> else는 없음
				선택문
					<c:choose>
						<c:when></c:when>
						<c:when></c:when>
						<c:otherwise></c:otherwise>	=> default
					</c:choose>
				변수 설정
					<c:set>	=> request.setAttribute()
				화면 출력
					<c:out>
			변수 선언
			화면 이동
		fmt : 날짜 변환, 숫자 변환
		fn : String 메소드 처리
		xml : 
		sql
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>일반 자바 for</h3>
<%
for(int i=1;i<=10;i++){
%>
<p><%=i%></p>
<%
}
%>
<h3>JSTL forEach</h3>
<c:forEach var="i" begin="1" end="10" step="1">
<p>${i }</p>
</c:forEach>
</body>
</html>