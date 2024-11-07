<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.ReplyDAO"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
String type_ = request.getParameter("type");
int type = Integer.parseInt(type_);
String fno = request.getParameter("fno");
String msg = request.getParameter("msg");
String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
ReplyVO vo = new ReplyVO();
vo.setFno(Integer.parseInt(fno));
vo.setMsg(msg);
vo.setId(id);
vo.setName(name);
vo.setType(type);
dao.replyInsert(vo);
if (type == 1)
	response.sendRedirect("../main/main.jsp?mode=1&fno=" + fno);
else if (type == 2)
	response.sendRedirect("../main/main.jsp?mode=4&no=" + fno);
%>