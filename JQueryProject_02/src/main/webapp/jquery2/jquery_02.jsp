<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	let h1=$('h1').text()
	$('h2').text(h1)
	$('h3').html('<font color="blue">Hello JQuery!!!</font>')
})
</script>
</head>
<body>
<h1>Hello JQuery</h1>
<h2></h2>
<h3></h3>
</body>
</html>