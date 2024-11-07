<%--
	HTML / 자바 분리	=> MVC, Spring에서는 나오지 않음
	<%%> ,  <%=%>	=> (X)
	
	response
		setHeader()
		sendRedirect()
		addCookie()
	session
		setAttribute()
		getAttribute()
		invalidate()
		removeAttribute()
		setMaxInaciveInterval(초단위)	=> 저장기간 설정
		getId()	=> 사용자마다 세션은 한개만 생성	=> 구분자
		isNew()	=> 새로 생성된 세션 여부 확인
	application
		getRealPath()
	cookie(내장객체가 아니다)	=> 문자열만 저장 가능
		setPath()
		setMaxAge()	=> 저장 기간	=> 0이면 삭제
		getName()	=> 키를 읽어올때 사용
		getValue()	=> 값을 읽음
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>