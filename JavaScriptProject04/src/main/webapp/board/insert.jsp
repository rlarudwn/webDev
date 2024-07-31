<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 960px;
}
.brow {
	margin: 0px auto;
	width: 800px;
}
</style>
</head>
<body>
	<div class="wrapper_row3">
		<main class="container clear">
			<div class="row">
				<h3 class="sectiontitle text-center">글쓰기</h3>
				<form action="../board/insert_ok.do" method="post">
					<table class="table">
						<tr>
							<th width="15%" class="text-center">이름</th>
							<td width="85%">
								<input type="text" name="name" size="20" class="">
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-center">제목</th>
							<td width="85%">
								<input type="text" name="subject" size="20" class="">
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-center">내용</th>
							<td width="85%">
								<textarea rows="10" cols="60" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-center">비밀번호</th>
							<td width="85%">
								<input type="password" name="pwd" size="15" class="">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-right">
								<input type="submit" class="btn btn-info" value="작성">
								<a href="../board/list.do" class="btn btn-danger">취소</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>
</body>
</html>