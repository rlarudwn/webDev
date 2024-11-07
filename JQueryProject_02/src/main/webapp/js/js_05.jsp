<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let h1 = document.querySelector('#h1')
	let gBtn = document.querySelector('#green')
	let rBtn = document.querySelector('#red')
	let bBtn = document.querySelector('#blue')
	
	gBtn.addEventListener('click', function(){
		h1.style.color='green'
	})
	rBtn.addEventListener('click', function(){
		h1.style.color='red'
	})
	bBtn.addEventListener('click', function(){
		h1.style.color='blue'
	})
}
</script>
</head>
<body>
	<h1 id="h1">text</h1>
	<button id="green">green</button>
	<button id="red">red</button>
	<button id="blue">blue</button>
</body>
</html>