<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.bean.*"%>
<%--	
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String sex=request.getParameter("sex");
	String addr=request.getParameter("addr");
	String phone=request.getParameter("phone");
	MemberVO vo = new MemberVO();
	vo.setName(name);
	vo.setAddress(addr);
	vo.setSex(sex);
	vo.setPhone(phone);
--%>
<jsp:useBean id="vo" class="com.sist.bean.MemberVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		이름:<jsp:getProperty property="name" name="vo"/><br>
		성별:<jsp:getProperty property="sex" name="vo"/><br>
		주소:<jsp:getProperty property="address" name="vo"/><br>
		전화:<jsp:getProperty property="phone" name="vo"/><br>
	</div>
</body>
</html>