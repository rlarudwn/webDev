<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('h1').css('color', 'red')
		$('.s').css('color', 'blue')
		$('#s').css('color', 'green')
	})
</script>
</head>
<body>
	<h1>머리가 너무 아파요1</h1>
	<h1 class="s">머리가 너무 아파요2</h1>
	<h1>머리가 너무 아파요3</h1>
	<h1 id="s">머리가 너무 아파요4</h1>
	<h1>머리가 너무 아파요5</h1>
</body>
</html>