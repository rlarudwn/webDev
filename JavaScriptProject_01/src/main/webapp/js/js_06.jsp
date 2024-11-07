<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let a=prompt("아이디 입력")
	/* if(a%2===0)
		document.write(a+" : 짝수입니다")
	else
		document.write(a+" : 홀수입니다") */
	if(a==="admin")
		alert('관리자')
	else
		alert('일반')
}
</script>
</head>
<body>

</body>
</html>