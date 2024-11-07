<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.dao.*, java.io.*"%>
<%
request.setCharacterEncoding("UTF-8");
String path = "c:\\upload";
try {
	File dir = new File(path);
	if (!dir.exists())
		dir.mkdir();

} catch (Exception e) {
}
String euctype = "UTF-8";
int max = 1024 * 1024 * 100;
MultipartRequest mr = new MultipartRequest(request, path, max, euctype, 
		new DefaultFileRenamePolicy());
String name = mr.getParameter("name");
String sub = mr.getParameter("subject");
String pwd = mr.getParameter("pwd");
String content = mr.getParameter("content");
String filename = mr.getFilesystemName("upload");
DataBoardVO vo = new DataBoardVO();
vo.setName(name);
vo.setSubject(sub);
vo.setPwd(pwd);
vo.setContent(content);
if (filename == null) {
	vo.setFilename("");
	vo.setFilesize(0);
} else {
	File f = new File(path + "\\" + filename);
	vo.setFilename(filename);
	vo.setFilesize((int) f.length());
}
DataBoardDAO dao = DataBoardDAO.newInstance();
dao.databoardInsert(vo);

response.sendRedirect("list.jsp");
%>