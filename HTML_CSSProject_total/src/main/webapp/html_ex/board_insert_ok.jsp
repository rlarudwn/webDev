<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String password = request.getParameter("pwd");

	BoardDAO dao = BoardDAO.newInstance();
	BoardVO vo = new BoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(password);
	
	dao.boardInsertData(vo);
	
	response.sendRedirect("board_list.jsp");
	
%>