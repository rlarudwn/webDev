<%--
	application : 서버 관리	=> ServletContext
		서버 관련 정보
			서버이름 : tomcat	=> getServerInfo()
			버전 : getMajorVersion(), getMinerVersion()
		log정보
		자원 관리	=> resource(파일...)
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
<h3>서버명 : <%=application.getServerInfo() %></h3>
<h3>서버버전1 : <%=application.getMajorVersion() %></h3>
<h3>서버버전2 : <%=application.getMinorVersion() %></h3>
<%
String driver = application.getInitParameter("driver");
String url = application.getInitParameter("url");
String username = application.getInitParameter("username");
String password = application.getInitParameter("password");
application.log("driver : "+driver);
application.log("url : "+url);
application.log("username : "+username);
application.log("passowrd : "+password);
%>
<h3>실제 프로젝트 저장 위치 <%=application.getRealPath("/") %></h3>
</body>
</html>