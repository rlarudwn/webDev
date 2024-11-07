<%--
	JSP(Java Server Page)
	HTML / Java	=> 구분
	지시자
		Page
			JSP의 기본 정보를 저장하고 있다
			<%@ 지시자명 속성=""%>
				속성
					info : 작성자, 작성일, 무슨프로그램인지
					language : java	=> default
					contentType : text/html , text/xml , text/plain
						=> 브라우저에게 어떤 형식인지 알려준다
							=> text/html;charset=ISO-8859_1	=> 아스키코드
					extends
					import : 라이브러리 읽을 때 사용
						 생략 : java.lang.*
						 		javax.serverlet.http
					session
					buffer : html을 저장하는 공간
					autoFlush : 화면에 출력	=> 이동
								=> 접속자 마다	=> 출력버퍼를 한개만 사용 가능
					isThreadSafe : 쓰레드 사용 여부
					errorPage : 에러 발생시 보여주는 페이지를 만든다
					isErrorPage : 여러페이지 여부 확인 가능
					pageEncoding : 파일에 대한 한글 설정
		taglib
			
		include
	내장객체
		request
		response
		session
		out
		appication
		config
		exception
		page
		pageContext
	cookie
	JSP 액션 태그 <jsp:include> <jsp:useBean> <jsp:forward>
	=====================================================>basic
	DB연동
	EL/JSTL
	MVC
--%>
<%@ page info="지시자에 대한 학습" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>