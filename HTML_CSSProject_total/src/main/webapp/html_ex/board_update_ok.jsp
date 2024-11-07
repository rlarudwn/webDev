<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
request.setCharacterEncoding("UTF-8");
String no = request.getParameter("no");
String name = request.getParameter("name");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String password = request.getParameter("pwd");

BoardVO vo = new BoardVO();
vo.setNo(Integer.parseInt(no));
vo.setName(name);
vo.setSubject(subject);
vo.setContent(content);
vo.setPwd(password);

BoardDAO dao = BoardDAO.newInstance();
boolean bCheck = dao.boardUpdate(vo);
if (!bCheck) {
%>
<script>
	alert("비밀번호가 틀립니다!!");
	history.back();
</script>
<%
}
else{
	response.sendRedirect("board_detail.jsp?no="+no);
}
%>