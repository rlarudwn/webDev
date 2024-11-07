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
	width: 800px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		let i = 0
		$('#showBtn').click(function() {
			if (i === 0) {
				$('#delete').show()
				i = 1
				$('#showBtn').val('취소')
			} else {
				$('#delete').hide('fast')
				i = 0
				$('#showBtn').val('삭제')
			}
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h1 class="text-center">hide(), show()</h1>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-right">
						<input type="button" id="showBtn" value="삭제" class="btn btn-sm btn-primary">
					</td>
				</tr>
				<tr style="display: none;" id="delete">
					<td class="text-right">
						비밀번호
						<input type="password" class="input-sm" id="pwd">
					</td>
				</tr>
			</table>

		</div>
	</div>
</body>
</html>