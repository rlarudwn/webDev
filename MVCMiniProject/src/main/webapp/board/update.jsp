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
	width: 800px;
}
</style>
</head>
<body>
	<div class="wrapper_row3">
		<main class="container clear">
			<div class="brow">
				<h2 class="sectiontitle">수정</h2>
				<form action="../board/update_ok.do" method="post">
					<table class="table">
						<tr>
							<th width="15%" class="text-center">이름</th>
							<td width="85%">
								<input type="text" name="name" size="20" class="" value="${detail.name}">
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-center">제목</th>
							<td width="85%">
								<input type="text" name="subject" size="20" class="" value="${detail.subject}">
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-center">내용</th>
							<td width="85%">
								<textarea rows="10" cols="60" name="content">${detail.content}</textarea>
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
								<input type="hidden" name="no" value="${detail.no}">
								<input type="submit" class="btn btn-info" value="수정">
								<input type="button" class="btn btn-danger" onclick="javascript:history.back()" value="취소">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>
</body>
</html>