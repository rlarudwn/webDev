<%--
	out	=> 출력버퍼 관리 객체	=> JspWriter
		HTML을 저장하는 메모리 공간
		JSP실행 요청	=> 톰캣	=> out.write()를 메모리에 출력
		주요 메소드
		println() / print() / writer() / HTML저장 용도	=> <%= %>
		
		getBufferSize() : 버퍼 사이즈 확인
		getRemaining() : 남아 있는 버퍼 크기 확인
		out 객체는 한번만 사용	=> 다운로드
		<%= %>	=> $() 로 대체
		**권장사항 HTML / Java 통합 X
		
	application
	pageContext
	page/config/exception	=> 잘 사용하지 않음
	
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
	<h3>전체 버퍼 크기 확인 : <%=out.getBufferSize() %></h3>
	<h3>남아 있는 버퍼 크기 : <%=out.getRemaining() %></h3>
	<h3>사용중인 버퍼 크기 : <%=out.getBufferSize()-out.getRemaining() %></h3>
	<br>
	<%
	out.print("<font color=red>Out (JspWriter)</font><br>");
	out.println("<font color=blue>Out (JspWriter)</font><br>");
	out.print("<font color=green>Out (JspWriter)</font>");
	%>
	<br>
	<%=
	"Out(JspWriter)<br>"
	%>
</body>
</html>