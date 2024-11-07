<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	let i=0
	$('input[type="button"]').on('click', function() {
		if(i==0){
		$('#div1').fadeIn()
		$('#div2').fadeIn('slow')
		$('#div3').fadeIn(2000)
		i=1
		}
		else{
		$('#div1').fadeOut()
		$('#div2').fadeOut('slow')
		$('#div3').fadeOut(2000)
			i=0
		}
	})
})
</script>
</head>
<body>
<div class="container">
<div class="row">
<input type="button" value="실행" class="btn btn-sm btn-info"><p>
<div id="div1" style="width: 80px; height: 80px; display: none; background-color: red;"></div>
<div id="div2" style="width: 80px; height: 80px; display: none; background-color: green;"></div>
<div id="div3" style="width: 80px; height: 80px; display: none; background-color: blue;"></div>
</div>
</div>
</body>
</html>