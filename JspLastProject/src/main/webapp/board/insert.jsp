<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
	margin: 0px auto;
	width: 800px;
}
</style>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">자유게시판</h2>
			<div class="row row1">
				<form action="../board/insert_ok.do" method="post">
					<table class="table">
						<tr>
							<th width="15%" class="text-right">이름</th>
							<td>
								<input type="text" name="name" size="10" class="input input-sm" required>
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-right">제목</th>
							<td>
								<input type="text" name="subject" size="30" class="input input-sm" required>
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-right">내용</th>
							<td>
								<textarea rows="20" cols="50" required name="content"></textarea>
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-right">비밀번호</th>
							<td>
								<input type="password" name="pwd" size="10" class="input input-sm" required>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="글쓰기" class="btn btn-sm btn-primary" style="display: inline-block;">
								<input type="button" value="취소" class="btn btn-sm btn-warning" onclick="javascript:history.back()">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>
</body>
</html>