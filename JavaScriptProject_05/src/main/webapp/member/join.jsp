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
<script type="text/javascript">
	function postFind() {
	let	_left = Math.ceil(( window.screen.width - 450 )/2)
	let	_top = Math.ceil(( window.screen.height - 400 )/2)
		window.open('post.jsp', 'postFind', 'width=450, height=400, left='+_left+', top='+_top+', scrollbars=yes')
	}
	function idCheck() {
	let	_left = Math.ceil(( window.screen.width - 450 )/2)
	let	_top = Math.ceil(( window.screen.height - 400 )/2)
		window.open('idCheck.jsp', 'idCheck', 'width=450, height=400, left='+_left+', top='+_top+', scrollbars=yes')
	}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">회원가입</h3>
		<div class="row">
			<form action="" name="frm">
				<table class="table">
					<tr>
						<th class="text-center" width="20%">아이디</th>
						<td width="80%">
							<input type="text" name="id" class="input-sm" size="15" id="id" readonly="readonly">
							<input type="button" value="아이디 중복체크" class="btn btn-sm btn-primary" id="idCheckBtn" onclick="idCheck()">
						</td>
					</tr>
					<tr>
						<th class="text-center" width="20%">우편번호</th>
						<td width="80%">
							<input type="text" name="post" class="input-sm" size="15" readonly>
							<input type="button" value="우편번호 검색" class="btn btn-sm btn-primary" id="postFindBtn" onclick="postFind()">
						</td>
					</tr>
					<tr>
						<th class="text-center" width="20%">주소</th>
						<td width="80%">
							<input type="text" name="address" class="input-sm" size="40" readonly>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>