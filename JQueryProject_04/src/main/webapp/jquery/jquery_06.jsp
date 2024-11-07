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
	$('input[type="button"]').click(function() {
		$('#print').text(new Date())
	})
})
</script>
</head>
<body>
<input type="button" value="출력">
<span id="print"></span>
</body>
</html>