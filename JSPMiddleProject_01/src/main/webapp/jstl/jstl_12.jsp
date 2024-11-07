<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String msg="홍길동입니다";
%>
<c:set value="<%=msg %>" var="msg"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>자바 문자열 제어</h1>
<%=msg.length() %><br>
<%=msg.substring(0, 3) %><br>
<%=msg.replaceAll("홍", "박") %><br>
<h1>jstl 문자열 제어</h1>
<p>${fn:length(msg) }</p>
<p>${fn:substring(msg,0,3) }</p>
<p>${fn:replace(msg,"홍","김") }</p>
</body>
</html>