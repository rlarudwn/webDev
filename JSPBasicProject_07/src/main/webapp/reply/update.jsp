<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.ReplyDAO"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
String rno=request.getParameter("rno");
String fno=request.getParameter("fno");
String msg=request.getParameter("msg");
ReplyVO vo=new ReplyVO();
vo.setRno(Integer.parseInt(rno));
vo.setMsg(msg);
dao.replyUpdate(vo);
response.sendRedirect("../main/main.jsp?mode=1&fno="+fno);
%>