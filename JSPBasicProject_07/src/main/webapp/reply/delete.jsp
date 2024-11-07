<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <jsp:useBean id="dao" class="com.sist.dao.ReplyDAO"></jsp:useBean>
<%
String type_=request.getParameter("type");
int type = Integer.parseInt(type_);
String rno=request.getParameter("rno");
String fno=request.getParameter("fno");
dao.replyDelete(Integer.parseInt(rno));
String url="";
if(type==1)
	url="../main/main.jsp?mode=1&fno="+fno;
else if(type==2)
	url="../main/main.jsp?mode=4&no="+fno;
response.sendRedirect(url);
%>