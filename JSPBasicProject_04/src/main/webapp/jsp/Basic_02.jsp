<%--
	JSP 생명주기
		=> _jspInit() : web.xml에 환경설정 : 생성자와 동일한 역할
		=> _jspService() : doGet() / doPost()	=> 통합(조건문)
			=> JSP에서 코딩한 소스가 메소드안에 첨부
		public void _jspService(HttpServletRequest request, HttpServletResponse response){
			PageContext pageContext;
    		HttpSession session = null;
  			ServletContext application;
  			ServletConfig config;
   			JspWriter out = null;
  			Object page = this;
      }
      
      JSP 스크립트에 대한 이해
      	JSP = 자바 + HTML
      		언어별 구분 필요
      		<% %> : 스크립트릿	=> 일반 자바 코딩
      						=> 변수 선언
      						=> 메소드 호출
      						=> 클래스 메모리 할당
      						=> 제어문 / 연산자
      		
      		<%=%> : 표현식	=> 브라우저 출력 out.println()
      		
      		<%!%> : 선언식	=> 사용빈도 거의 없음
      							메소드를 JSP에서 만드는 경우
      		===============================
      		멤버변수
      		<%! %>
      		===============================
      		생성자
      		===============================
      		
      		===============================
      		
      		===============================
--%>
<%!
String name;
public void display(){
	
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int age = 10;
%>
	<%=age%>
</body>
</html>