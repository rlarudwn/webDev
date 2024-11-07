<%--
	JSP 동작 구조
		서버
		브라우저 : URL 전송	===========> DMS
										IP변환
											소켓을 이용해 서버에 연결
										서버연결
											HTML / XML / JSON	=> 서버에서 단독 처리
											JSP / Servlet	=>  TomCat(WAS) 전송	=> 처리
	실행 순서
		JSP	=> 클래스화
			a.JSP	=> class a_jsp extends HttpJspBase{
				public void _jspInit(){}
				public void _jspDestroy(){}
				public void _jspService(){}
				jsp에서 작성한 소스
			}
			클래스 만들기	=> 한번만 만든다	=> 변경	=> 만들어진 클래스 수정
			컴파일	=> .class
			.class를 한줄씩 읽어서 out.write()	=> 메모리 저장
												buffer	=> 임시 저장 장소
												사용자 한명당 한개 생성
			메모리에 출력된 내용을 브라우저에서 읽어서 출력
			
		JSP 제작
		사용자 요청	=> JSP파일 요청
		톰캣	=> 클래스로 변경
		클래스	=> 컴파일	=> .class
		.class 를 읽음
			_jspInit()	=> 환경설정, 멤버변수 초기화	=> web.xml
			_jspService()	=> 요청 처리	=> 브라우저 실행
			_jspDestroy()	=> 새로고침 / 화면이동시 자동으로 jsp는 메모리에서 해제
			서버
			서버연결	=> 통신을 할 수 있게 쓰레드 생성
			=====> 클라이언트가 한개씩 연결
	HTML과 자바 구분
		<% %> : 일반 자바 코드	=> 지역변수 선언, 연산자, 제어문, 메소드 호출
				문법 사항이 자바와 동일
				문장 종료 ;
				주석 : 자바와 동일
		<%= %> : out.print(출력줄)	=> 변수 출력시 사용
		<%! %> : 메소드 제작, 멤버변수 선언
	지시자
		page
			JSP파일에 대한 정보
				contentType	=> 브라우저에 어떤 형식인지 알려준다
					HTML	=> text/html;charset=UTF-8
					XML		=> text/xml;charset=UTF-8
					JSON	=> text/plain;charset=UTF-8
				import	=> 라이브러리 / 사용자 정의 클래스
				errorPage	=> 에러시 에러파일을 만들어서 보여주는 역할
					404 : 파일이 없는 경우
					500 : 컴파일 에러	=> 자바
					405 : GET / POST가 틀린경우
					412 : 
					403 : 접근 거부
					200 : 정상수행
				buffer : 디폴트(8kb)	=> 필요시 확장
		include : 정적	=> 소스를 통합한 후 컴파일
			JSP안에 특정 부분에 다른 JSP를 포함
		taglib
	액션 태그
		<jsp:>으로 시작
		<jsp:include> : 스프링에서도 사용
			JSP안에 다른 JSP 연결	=> 동적
				파일 컴파일 후	=> 결과(HTML)	=> HTML을 연결하는 역할
		<jsp:useBean> : 객체 메모리 할당
			BoardDAO dao = new BoardDAO()
			= <jsp:useBean id="dao" class="BoardDAO">
		<jsp:forward> : 화면 이동
			sendRedirect() : 새로운 화면	=> new
			forward() : 기존화면에 데이터만 변경
		<jsp:setProperty> : 사용자가 보내준 데이터를 받는 경우
		<jsp:getProperty> : 사용자가 보내준 데이터를 출력
	내장 객체
		DB
	cookie
	에러처리
	
	EL/JSTL
	MVC
	
	public void _jspService(HttpServletRequest request, HttpServletResponse response)
	PageContext pageContext;
    HttpSession session = null;
    ServletContext application;
    ServletConfig config;
    JspWriter out = null;
    Object page = this;
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