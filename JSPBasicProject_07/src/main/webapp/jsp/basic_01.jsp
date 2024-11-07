<%--
	JSP
		지시자
			page
				contentType : 브라우저에 어떤 형식의 파일인지 알려준다(HTML / XML / JSON)
				import : 라이브러리 추가
				errorPage : 에러가 난 경우 출력하는 파일
				buffer : 화면 크기가 클 경우	=> 8kb	=> 16kb
			include
				file : 첨부할 파일명 지정	=> 정적(소스를 통합해서 컴파일)
		HTML / Java 구분
			<% %> : HTML안에 자바 코딩(일반 메소드에서 사용되는 자바 코드)
				=> 지역변수, 메소드호출, 연산자, 제어문
				=> Model클래스 : 메소드로 처리
					이후 MVC 로 변경
			<%= %> : out.print()	=> 화면 출력
		내장 객체
			**request : 사용자 요청
				=> 사용자가 전송한 값 : getParameter(), getParameterValues()
				=> 사용자가 요청 URI : getRequestURI()
				=> 한글 변환 : setCharacterEncoding()
				=> 추가 : setAttribute(), getAttribute()
				=> 사용자 IP : getRemoteAddress()
				=> 스프링 : 가급적 request 사용 X	=> 스프링 자체에서 값 받음
			**response
				=> sendRedirect() : 화면 이동
				=> setHeader() : JSON전송, 다운로드
				=> addCookie() : 쿠키 전송
			**session : 서버에 일부 데이터 저장(사이트 있는 동안)
				장바구니 / 로그인	=> 정보 저장
				setAttribute() : 저장
				getAttribute() : 저장값 읽기
				invalidate() : 저장 내용을 지운다	=> 로그아웃
				removeAttribute() : 삭제
			application : 서버관리
				log() : 로그파일
				getRealPath() : 실제 저장 경로
			out : 출력 버퍼 관리
				=> print(), write()	=> 화면 출력
			pageContext
				=> page(this), config, exception
		액션 태그
			**<jsp:include>
			<jsp:useBean>
			<jsp:setProperty>
		라이브러리
		EL / JSTL	=> taglib
		MVC
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>