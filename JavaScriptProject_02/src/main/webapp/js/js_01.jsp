<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function plus1(a, b) {
	return a+b
}
let plus2=function(a, b){
	return a+b
}
let plus3=(a, b)=>{return a+b}
let plus4=(a, b)=>a+b
window.onload=function(){
	let a=10
	let b=20
	
	let c=plus1(a, b)
	let d=plus2(a, b)
	let e=plus3(a, b)
	let f=plus4(a, b)
	
	document.write("plus1 : "+c)
	document.write("plus2 : "+d)
	document.write("plus3 : "+e)
	document.write("plus4 : "+f)
}
</script>
</head>
<body>

</body>
</html>