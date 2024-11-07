<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('img').click(function() {
		let src=$('img').attr('src')
		alert(src)
		$('img').attr('src', '2.jpg')
	})
})
</script>
</head>
<body>
<img src="1.jpg">
</body>
</html>