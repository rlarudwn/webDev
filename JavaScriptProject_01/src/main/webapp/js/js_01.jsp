<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
자바스크립트 : 브라우저 자체에서 처리(서버처리가 아님)
						브라우저에서 동적 페이지 작성	=> 이벤트
	역할(웹 사이트)
		HTML/CSS	=> 화면 UI				=> 퍼블리셔
		===========================================
		자바스크립트	=> 화면에 대한 동적 처리	=> 오라클 연결 가능(서버측 사이드	=> NodeJS)
			=> HTML/CSS를 제어	=> 유효성 검사(사용자 입력), 움직이는 화면
				사용법
					내부 스크립트(한개의 파일에서만 작업)
						<script type="">
						</sctipt>
					외부 스크립트(여러개 파일에 적용)	=> .js
						파일로 제작
					인라인 스크립트 : 태그 한개 제어
						<input type="button" onclick="javascript:history.back()">
				버전
					ES5
						var : 변수	=> 자동지정변수	=> 데이터형을 사용하지 않는다
							Scope(사용범위)가 명확하지 않다
					ES6
						let : 변수	=> 자종지정변수	=> 데이터형을 사용하지 않는다
							사용범위가 명확하다
							{
								블럭내에서만 사용 가능
							}
						const : 상수형 변수	=> 값 변경 불가
						람다식 : 화살표 함수
						
							function func_name(매개변수){
							}
							let func_name=function(){}
							let func_name=()	=> {}	=> 권장
						
						최근에는 문장 종료시 ;을 사용하지 않음	=> 들여쓰기
		===========================================		=> Front-End
		자바	=> 데이터 관리								
		오라클	=> 데이터를 저장하는 공간		
		===========================================		=> Back-End
변수설정
	데이터형을 사용하지 않는다 / 자동 지정변수 사용 / 전역변수, 지역변수 사용 가능
		<script type="">
			변수 선언	=> 전역변수
			function aaa(){
				변수 선언	=> 지역변수
			}
		</script>
	변수설정은 초기값에 따라 자동으로 데이터형이 저장
		number : 실수, 정수
		string : 문자, 문자열
		object : 배열, 객체
		boolean : true/false	=> 숫자도 가능
							0, 0.0이 아닌 모든 수는 true
		function : 함수도 데이터형으로 취급
		undefined : 변수에 값이 없는 상태
		NaN : 연산이 안되는 경우
		null : 배열, 객체에 값이 없는 경우
		
		let i=10		=> i:number	=> int
		let i=10.5	=> i:number	=> double
		let i='A'		=> i:string
		let i="A"		=> i:string
		let i=["a", "b", "c"..]		=> i:object
					["A", 1, true, 'a']	=> 모든 데이터형을 배열로 저장
		let i={"name":"홍길동", "age":20 ...}		=> 객체(object)
			멤버변수:값
		let i=true		=>i:boolean
		let i=function(){}		=>i:function
		
	브라우저에 출력
		document.write()	=> System.out.print()
			=>\n:<br>
		innerHTML : 태그안에 데이터를 첨부
		alert() : 
		consol.log() : 도스창에 출력
		window.onload=function(){}
			=> JQurey : $(function(){})
			=> VueJS  : mounted()
			=> React  : useEffect()
연산자
	단항연산자
		증감연산자 : ++/--
		형변환연산자
			Number("10") : 정수형 변경
			String(10) : 문자열 변경
			Boolean(1)	=> ture
	산술연산자 : +, -, *, /, %
		+ : 문자열 결합도 가능
	비교연산자
		=== : 같다
		!== : 같지 않다
		<, >, <=, >=
	논리연산자
		&&
		||
		!
	대입연산자
		=
	복합대입연산자
		+=, -=...
	삼항연산자
		(조건)?값1:값2	=> true=값1, false=값2
제어문
	while	=> 반복횟수가 없을 때	=> 무한 스크롤
		초기값
		while(조건문){
			반복 수행문장
			증감식
		}
	for		=> 반복횟수가 있을 때
		일반 for
		for in (인덱스번호)
			for(변수 in 배열)
				배열의 인덱스 번호를 가져온다	=> 0부터 시작
		for of (for each)
			for(변수 of 배열)
				변수는 배열에 저장값을 읽어온다
		함수
			배열.forEach(function(변수){처리})
			배열.map(function(변수){처리})
			배열.map((변수)=>{})
		
함수
라이브러리
객체지향	=> DOM

	1) Jquery(Ajax)
	2) VueJS
	3) ReactJS
	4) NextJS / NodeJS
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		let a = 10
		let b = 10.5
		let c = "ABC"
		let d = 'DEF'
		let e = true
		let f = [ 1, 2, 3, 4, 5 ]
		let g = {
			"name" : "홍길동",
			"age" : 20
		}
		document.write(a + ":" + typeof a + "<br>")
		document.write(b + ":" + typeof b + "<br>")
		document.write(c + ":" + typeof c + "<br>")
		document.write(d + ":" + typeof d + "<br>")
		document.write(e + ":" + typeof e + "<br>")
		document.write(f + ":" + typeof f + "<br>")
		document.write(g + ":" + typeof g + "<br>")
	}
</script>
</head>
<body>

</body>
</html>