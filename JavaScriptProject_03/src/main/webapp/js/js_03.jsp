<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 
    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let h1=document.querySelectorAll("h1")
	let h2=document.querySelector("h2")
	h2.style.backgroundColor='blue'
	h2.style.color='white'
	for(let i=0;i<h1.length;i++){
		h1[i].style.backgroundColor='green'
	}
	let h1_a=document.getElementById('a')
	h1_a.style.backgroundColor='red'
}
</script>
</head>
<body>
<h1>hello java</h1>
<h2>hello java</h2>
<h1 id="a">hello java</h1>
</body>
</html>