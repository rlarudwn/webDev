<%@page import="com.sist.vo.SawonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SawonVO vo=new SawonVO();
vo.setSabun(1);
vo.setName("홍길동");
vo.setDept("개발부");
vo.setJob("사원");
vo.setPay(3000);
request.setAttribute("sawon", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>EL 객체 출력</h1>
사번:${sawon.sabun }<br>
이름:${sawon.name }<br>
부서:${sawon.dept }<br>
직위:${sawon.job }<br>
급여:${sawon.pay }
</body>
</html>