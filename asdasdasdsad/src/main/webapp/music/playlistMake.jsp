<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$('#checkBtn').click(function(){
		Shadowbox.open({
			content:'../member/idCheck.do',
			player:'iframe',
			title:'아이디중복체크',
			width:350,
			height:250
		}) 
	})
	</script>
</head>
<body>

</body>
</html>