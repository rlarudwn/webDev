<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let info={name:"홍길동", age:20, sex:"남자"}
	let data=JSON.stringify(info)			//JSON to String
	console.log(data)
	let change=JSON.parse(data)				//String to JSON
	console.log(change)
}
</script>
</head>
<body>

</body>
</html>