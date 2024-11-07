<%--
	JSP : Java Server Page	=> 서버에서 실행하는 자바 파일	=> Back-End
	Back-End : Java, JSP, Servlet, Spring, Oracle
	Front-End : HTML, CSS, JavaScript
							=> JQuery(Ajax), VueJS, ReactJS, NextJS
	JPS
		1. HTML + Java	=> 구분
		자바	=> <% %> , <%= %>,    <%! %>
						=> 표현식    => 선언식
		2. 동작방식	=> 	정적페이지 : 한파일에 한개만 사용
						동적페이지 : 한개의 파일에 여러개의 데이터 출력(JSP, PHP, ASP, CGI)
		3. 지시자
			page : JSP파일에 대한 정보를 저장
					변환
						브라우저에서 실행	=> HTML / XML / JSON
						HTML : text/html
						XML  : text/xml
						JSON : text/plain	=> JavaScript Object Nontation
												자바스크립트 객체 표현법
					라이브러리 추가 : import
					한글변환 : pageEncoding	=> UTF-8(호환성)
					에러페이지 : errorPage="파일명"
						404 : 파일이 없는 경우
						500 : 자바 컴파일 에러
						403 : 접근 거부(Spring-Security)
						412 : 한글변환 코드문제
						400 : bad request	=> 전송값과 받는 변수 데이터형이 틀리는 경우
			include : <%@ include file="" %>
				JSP안에 다른 JSP를 포함해서 사용
				==============================================
					로고 / 메뉴 / 검색	=> 변경X 	=> 모든 파일 고정	=> include 사용
				==============================================
					|
					|
					|
				==============================================
				==============================================
			taglib : JSP의 단점 보완	=> JSTL	=> 자바 / HTML을 분리할때 사용	=> MVC
				자바	=> 태그형으로 변경
				<c:if text="">
					HTML
				</c:if>
			자바 코딩
				<% %> : 스크립트릿 : 일반자바(메소드안에 코딩)
									지역변수 선언, 제어문, 메소드 호출
					자바 문법 그대로 사용
				<%= %> : 표현식	=> 데이터를 화면에 출력	=> out.write()
														out.println()
				<%! %> : 선언식	=> 메소드, 멤버변수
			지원하는 라이브러리(내장 객체)
				request / response / out / session / application 
				config / exception / page / pageContext
			Cookie / Session
				Cookie : 브라우저에 데이터 저장
				Session : 서버에 데이터 저장
			JSP 액션 태그 / 빈즈
				<jsp:include>
				<jsp:useBean>
			JSTL / EL	=> 제어문 / 메소드 호출	=> 태그로 제작	=> 교체	=> MVC
			MVC
			Spring
			
			JSP	=> 실행	=> 톰캣	=> 클래스화
			a.jsp	=> class a_jsp extends HttpServlet{
				public void _jspInit(){
				}
				public void _jspDestroy(){
				}
				public void _jspService(){
				}
			}	
			컴파일	=> a_jsp.class	=> 한줄씩 번역	=> 메모리에 HTML만 출력	=> 브라우저가 읽어 출력
		18Page
			웹 동작	=> 클라이언트 요청(request), 서버에서 요청에 대한 응답(response)
						=> C/S	=> Client / Server
				요청시	=> URL주소를 이용
				 http://localhost/JSPBackProject/jsp/Basic_1.jsp
				=================/===============================
					서버 정보				사용자가 요청	=> URI
				***생략하는 경우	=> WelCome파일 등록
				*** 파일의 확장자는 개발자가 설정할 수 있다
				PathVariable
				
									파일 요청
				Client(브라우저)	===================> Web Server	=====> WAS(TomCat)
			파일
				정적 페이지	=> 데이터 갱신 불가능 : HTML / CSS
				동적 페이지	=> 데이터 갱신 가능	  : JPS / JavaScript
					Servlet / JSP
					
					Server+let	=> 서버에서 실행되는 가벼운 프로그램	=> .java
						자바에서 처음 웹프로그램의 시작
						단점 : 변경시 컴파일	=> 실행
						바로 변경된 소스 확인 불가	=> 바로확인 : JSP
						장점 : 보안이 뛰어나다
							보안과 관련된 웹파일 = 서블릿으로 제작
								=> JSP는 주로 화면 출력
						스프링이 서블릿으로 만들어져 있다
							JSP	=> 배포시 소스를 그대로 전송
			MVC
				Model : 자바(DAO, VO)
				View : JSP(화면만 출력)
				Controller : Model과 View 연결	=> Servlet
				
			JSP파일
			Java + HTML 분리 : 연결	=> servlet
			서블릿	=> JSP가 컴파일되면 서블릿으로 변경
			서블릿 , JSP	=> Java + HTML
				HTML만 이용해서 처리	=> ThymeLeaf	=> JSP보다 속도가 느리다
											서버 클라이언트를 나눠서 작업
				서버	=> Boot
				클라이언트	=> Vue / React
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>