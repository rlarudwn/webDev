<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let callback=function(){
	document.write("함수호출<br>")
}
function func(call){
	for(let i=1;i<=10;i++){
		call()
	}
}
window.onload=function(){
	func(callback)
}
</script>
</head>
<body>

</body>
</html>