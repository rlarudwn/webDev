<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>1:1문의등록</h3>
				<form method=post action="../replyboard/insert_ok.do">
					<table class="table">
						<tr>
							<th width=20% class="text-center">제목</th>
							<td width=80%>
								<input class="form-control mb-3" type="text" placeholder="제목을 입력해주세요" aria-label="default input example">					
								<input type="hidden" name="no" value="${no}">
							</td>
						</tr>
						<tr>
							<th width="20%" class="text-center">내용</th>
							<td width="80%">
								<textarea class="form-control" placeholder="문의내용을 입력해주세요" 
								id="floatingTextarea" style="height: 200px;"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center inline">
							
								<button type="submit" class="btn btn-outline-success m-2">등록</button>
								<input type=button value="취소" class="btn btn-outline-secondary m-2" onclick="javascript:history.back()">
							</td>
						</tr>
					</table>
				</form>
		</main>
	</div>
</body>
</html>