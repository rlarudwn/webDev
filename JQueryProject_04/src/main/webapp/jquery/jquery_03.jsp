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
		$('input[type="button"]').click(function() {
			/* let id = $('#id').val()
			let pwd = $('#pwd').val()
			let name = $('#name').val()
			alert(id + "\n" + pwd + "\n" + name) */
			
			/* let form=$('#frm')
			let data=new FormData(form)
			console.log(data)
			alert(data) */
			
			$('#id').val('hong')
			$('#pwd').val('1234')
			$('#name').val('김경주')
		})

	})
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">회원가입</h3>
		<div class="row">
			<form action="" id="frm">
				<table class="table">
					<tr>
						<th width="15%">ID</th>
						<td width="85%">
							<input type="text" size="20" id="id" class="input-sm">
						</td>
					</tr>
					<tr>
						<th width="15%">PWD</th>
						<td width="85%">
							<input type="password" size="20" id="pwd" class="input-sm">
						</td>
					</tr>
					<tr>
						<th width="15%">NAME</th>
						<td width="85%">
							<input type="text" size="20" id="name" class="input-sm">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-right">
							<input type="button" class="btn btn-sm btn-info" value="전송">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>