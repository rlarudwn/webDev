<%@page import="com.sist.dao.DiaryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String no=request.getParameter("no");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
DiaryService dao=DiaryService.newInstance();
dao.diaryDelete(Integer.parseInt(no));

response.sendRedirect("diary_list.jsp?year="+year+"&month="+month+"&day="+day);
%>