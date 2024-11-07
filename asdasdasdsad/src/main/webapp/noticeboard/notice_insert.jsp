<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>공지 등록</h3>
	<div class="container mt-4">
	<form method="post" action="../adminpage/noticeboard_insert_ok.do">
		<table class="table table-borderless">
			<tbody>
				<tr>
					<th scope="col" >구분</th>
					<td width="80%">
						<select class="input-sm" name="type">
					        <option value="1">일반공지</option>
					        <option value="2">이벤트공지</option>
					        <option value="3">맛집공지</option>
					        <option value="4">여행공지</option>
					      </select>
					</td>
				</tr>
				<tr>
					<th scope="row" width=20% class="text-center">제목</th>
					<td scope="col"  width="80%">  
					 <input class="form-control mb-3" type="text" placeholder="제목을 입력하세요"
                  aria-label="default input example">
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td scope="col">  
					<textarea class="form-control" placeholder="내용을 입력하세요"
               id="floatingTextarea" style="height: 150px;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<button type="submit" class="btn btn-primary m-2">등록</button>
						<button type="button" class="btn btn-outline-secondary m-2" onclick="history.back()">취소</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>