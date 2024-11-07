<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	const names=["홍길동", "심청이", "박문수", "이순신", "춘향이"]
	const ages=[25, 20, 30, 50, 61]
	for(let s of names)
		document.write(s)
	for(let s in names)
		document.write(names[s]+" : "+ages[s]+"살 <br>" )
	document.write("<h1>forEach 함수</h1>")
	names.forEach(function(name){
		document.write(name+"<br>")	
	})
	names.forEach((name)=>{
		document.write(name+"<br>")	
	})
	names.map((name)=>{
		document.write(name+"<br>")	
	})
	
}
</script>
</head>
<body>

</body>
</html>