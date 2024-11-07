<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.MemberDAO"></jsp:useBean>>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
MemberVO vo = dao.isLogin(id, pwd);
if (vo.getMsg().equals("NOID")) {
%>
<script>
alert("존재하지 않는 아이디 입니다.");
history.back();
</script>
<%
} else if (vo.getMsg().equals("NOPWD")) {
%>
<script>
alert("비밀번호가 틀렸습니다.");
history.back();
</script>
<%
} else {
session.setAttribute("name", vo.getName());
session.setAttribute("id", id);
response.sendRedirect("../shoes/shoes_home.jsp");
}
%>
