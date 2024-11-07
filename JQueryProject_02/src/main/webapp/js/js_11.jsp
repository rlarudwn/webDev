<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let today=new Date()
	let year=today.getFullYear()
	let month=today.getMonth()+1
	let day=today.getDate()
	let week=today.getDay()
	let strWeek=['일', '월', '화', '수', '목', '금', '토']
	document.write(year+'년 '+month+'월 '+day+'일 '+strWeek[week]+'요일')
}
</script>
</head>
<body>

</body>
</html>