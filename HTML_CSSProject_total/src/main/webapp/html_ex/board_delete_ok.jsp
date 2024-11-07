<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
String no = request.getParameter("no");
String pwd = request.getParameter("pwd");

BoardDAO dao = BoardDAO.newInstance();
boolean bCheck = dao.boardDeleteData(Integer.parseInt(no), pwd);
if(!bCheck){
%>
<script>
	alert("비밀번호가 틀립니다!!");
	history.back();
</script>
<%
}
else{
	response.sendRedirect("board_list.jsp");
}
%>
