<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//String path="C:\\webDev\\webStudy\\JSPBasicProject_08\\src\\main\\webapp\\jsp";
	String path=application.getRealPath("/jsp");
	String type="UTF-8";
	int max=1024*1024*100;
	MultipartRequest mr=
			new MultipartRequest(request, path, max, type, 
					new DefaultFileRenamePolicy());
	String fn=mr.getOriginalFileName("upload");
	response.sendRedirect("output.jsp?fn="+fn);
%>