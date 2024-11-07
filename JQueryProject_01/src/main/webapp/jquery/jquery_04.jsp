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
	width: 400px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let fileIndex = 0
	$(function() {
		$('#addBtn').click(
				function() {
					$('#user-table').append(
							'<tr id="m' + (fileIndex) + '">' + '<td width="30%">File'
									+ (fileIndex + 1) + '</td>'
									+ '<td width="70%"><input type="file" size="20"></td>'
									+ '</tr>')
					fileIndex++
				})
		$('#removeBtn').on('click', function() {
			if (fileIndex > 0) {
				$('#m' + (fileIndex - 1)).remove()
				fileIndex--
			}
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">파일 업로드</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td colspan="2" class="text-right">
						<input type="button" class="btn btn-sm btn-primary" value="add" id="addBtn">
						<input type="button" class="btn btn-sm btn-primary" value="remove" id="removeBtn">
					</td>
				</tr>
				<tr>
					<td width="20%">첨부파일</td>
					<td width="80%">
						<table class="table" id="user-table">
							<tr>
								<td></td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>