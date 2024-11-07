<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let img=document.querySelector('img')
	img.onmouseover=()=>{
		img.style.opacity=0.3
	}
	img.onmouseout=()=>{
		img.style.opacity=1.0
	}
	let btn=document.querySelector('button')
	btn.onclick=()=>{
		let val=document.getElementsByName('imgChange').value
		console.log(val)
		img.src=val+'.jpg'
	}
}
</script>
</head>
<body>
	<img src="1.jpg" width="200" height="200">
	<input type="radio" name="imgChange" value="1">
	<input type="radio" name="imgChange" value="2">
	<input type="radio" name="imgChange" value="3">
	<input type="radio" name="imgChange" value="4">
	<input type="radio" name="imgChange" value="5">
	<input type="radio" name="imgChange" value="6">
	<button>클릭</button>
</body>
</html>