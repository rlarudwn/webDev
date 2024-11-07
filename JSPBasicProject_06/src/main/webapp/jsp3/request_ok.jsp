<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String sex = request.getParameter("sex");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String content = request.getParameter("content");
String[] hobby = request.getParameterValues("hobby");
%>
<!DOCTYPE html>
<html>
<head>
String name=request.getParameter("name");
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>사용자 전송값</h3>
	이름:<%=name%><br> 전화:<%=phone1%>])<%=phone2%><br> 성별:<%=sex%><br> 소개:<%=content%><br> 취미:
	<ul>
		<%
		try {
			for (String h : hobby) {
		%>
		<li><%=h%></li>
		<%
		}
		%>
		<%
		} catch (Exception e) {
		%>
		<font color="red">취미가 없습니다</font>
		<%
		}
		%>
	</ul>
	<hr>
	<h3>서버 정보</h3>
	서버이름:<%=request.getServerName()%><br>
	포트번호:<%=request.getServerPort()%><br>
	URL:<%=request.getRequestURL()%><br>
	URI:<%=request.getRequestURI()%><br>
	ContextPath:<%=request.getRemotePort()%><br>
	사용자IP:<%=request.getRemoteAddr()%><br>
	전송방식:<%=request.getMethod()%>
	프로토콜:<%=request.getProtocol()%>
</body>
</html>