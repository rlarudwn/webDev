<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 960px;
}
</style>
<script type="text/javascript">
window.onload=()=>{
	let h3=document.querySelector('#title')
	h3.style.backgroundColor='black'
	
	let hong={'sabun':1, 'name':'hong', 'dept':'개발부'}
	html=''
	html+='<tr>'
				+'<td>사번</td>'
				+'<td>'+hong.sabun+'</td>'
				+'<td>이름</td>'
				+'<td>'+hong.name+'</td>'
				+'<td>부서</td>'
				+'<td>'+hong.dept+'</td>'
				+'</tr>'
	let tbody=document.querySelector('.table tbody')
	tbody.innerHTML=html
	document.body.style.backgroundColor='skyblue'
}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center" id="title">hello</h3>
		<div class="row">
		<table class="table">
		<tbody>
		</tbody>
		</table>
		</div>
	</div>
</body>
</html>