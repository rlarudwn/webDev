<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
shadowbox.init({
	player:['iframe']
})
$(function() {
	$('checkBtn').click(function() {
		shadow.open({
			content:'../member/idCheck.jsp',
			player:'iframe',
			title:'아이디 중복체크',
			width:350,
			height:250
		})
	})
})
</script>
</head>
<body>
	<div class="wrapper row3">
		<div id="slider" class="clear">
			<h2 class="sectiontitle">회원가입</h2>
			<input type="button" class="btn btn-sm btn-danger" value="아이디 중복확인" id="checkBtn">
		</div>
	</div>
</body>
</html>