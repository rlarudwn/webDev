<%@page import="com.sist.dao.DataBoardDAO"%>
<%@page import="com.sist.dao.DataBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
DataBoardVO vo=new DataBoardVO();
DataBoardDAO dao=DataBoardDAO.newInstance();
String name=request.getParameter("name");
String no=request.getParameter("no");
String pwd=request.getParameter("pwd");
String content=request.getParameter("content");
String sub=request.getParameter("subject");
vo.setName(name);
vo.setNo(Integer.parseInt(no));
vo.setPwd(pwd);
vo.setContent(content);
vo.setSubject(sub);
boolean check=dao.databoardUpdate(vo);
if(check)
response.sendRedirect("detail.jsp?no="+no);
else{
	%>
	<script type="text/javascript">
alert("비밀번호가 틀립니다")
history.back()
</script>
	<%
}
%>