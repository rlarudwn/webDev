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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		let i = 0
		$('#showBtn').on('click', function() {
			if (i === 0) {
				i = 1
				$.ajax({
					type : 'get',
					url : 'emp.jsp',
					success : function(result) {
						$('#showBtn').val('취소')
						$('#print').html(result)
					}
				})
			} else {
				i = 0
				$('#showBtn').val('사원 읽기')
				$('#print').html('')
			}
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">사원목록</h3>
		<div class="row">
			<input type="button" id="showBtn" value="사원 읽기" class="btn btn-sm btn-default">
			<div style="height: 10px;"></div>
			<div class="row" id="print"></div>
		</div>
	</div>
</body>
</html>