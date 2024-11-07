<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#name').val('홍길동')
	$('button').on('click', function(){
		let addr=$('#address').val()
		alert(addr)
	})
})
</script>
</head> 
<body>
<input type="text" size="20" id="name"><br>
<input type="text" size="20" id="address">
<button>입력</button>
</body>
</html>