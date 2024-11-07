<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let div=document.querySelector('.box')
	div.addEventListener('mouseup', ()=>{
		div.style.backgroundColor='black'
	})
}
</script>
<style type="text/css">
.box{
width: 200px;
height: 200px;
border: 1px solid black;
}
</style>
</head>
<body>
<div class=box></div>
<div class=box></div>
<div class=box></div>
<div class=box></div>
<div class=box></div>
<div class=box></div>
<div class=box></div>
<div class=box></div>
<div class=box></div>
<div class=box></div>
</body>
</html>