<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--
	변수 설정	=> 식별자
		알파벳으로 시작(대소문자 구분)
		숫자 사용 가능(맨앞에 사용 불가)
		키워드 사용 불가
		특수문자(_, $) 사용 가능
		변수명에 공백 사용 불가
		
		let/const	=> 자동 변수 지정
			문장 종료 : ;을 사용하지 않는것을 권장
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	/* let a=10
	console.log("a="+a)
	a++
	console.log("a="+a)
	
	let b=10
	console.log("b="+b)
	b--
	console.log("b="+b) */
	let c=10
	let d=c++
	document.write("c="+c+", d="+d+"<br>")
	
	let k=false
	document.write("k="+k+"<br>")
	k=!k
	document.write("k="+k+"<br>")
	
	let m=1
	document.write("변경전 m="+m+", "+typeof m+"<br>")
	m=!m
	document.write("변경후 m="+m+", "+typeof m+"<br>")
	m=String(m)
	document.write("변경후 m="+m+", "+typeof m+"<br>")
	m=Boolean(m)
	document.write("변경후 m="+m+", "+typeof m+"<br>")

	document.write(Boolean(1)+", "+Boolean(0)+", "+Boolean(1.0)+", "+Boolean(0.0)+"<br>")
	let n="10"
	document.write("n="+typeof n+"<br>")
	document.write("n="+typeof Number(n)+"<br>")
	document.write("n="+typeof Boolean(n)+"<br>")
	document.write("n="+typeof Number(n)+"<br>")
	
}
</script>
</head>
<body>

</body>
</html>