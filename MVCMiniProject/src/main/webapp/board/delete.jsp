<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.brow {
	margin: 0px auto;
	width: 600px;
}
</style>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<div class="brow">
				<h2 class="sectiontitle">삭제</h2>
				<form action="../board/delete_ok.do" method="post">
					<table class="table">
						<tr>
							<td class="text-center inline">
								비밀번호 :
								<input type="password" name="pwd" size="15" class="input-sm">
							</td>
						</tr>
						<tr>
							<td class="text-center">
								<input type="hidden" name="no" value="${no}">
								<input type="submit" class="btn btn-sm btn-danger">
								<input type="button" class="btn btn-sm btn-info" onclick="javascript:history.back()" value="취소">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>
</body>
</html>