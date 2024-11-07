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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#updateBtn').on('click', function() {
		let no=$('#no').val()
		let name=$('#name').val()
		if(name.trim()===''){
			name.focus()
			return
		}
		let sub=$('#subject').val()
		if(sub.trim()===''){
			sub.focus()
			return
		}
		let content=$('#content').val()
		if(content.trim()===''){
			content.focus()
			return
		}
		let pwd=$('#pwd').val()
		if(pwd.trim()===''){
			pwd.focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../board/update_ok.do',
			data:{
				'name':name,
				'subject':sub,
				'content':content,
				'pwd':pwd
			},
			success:function(result){
				if(result==='YES'){
					location.href='../board/detail.do?no='+no			
				}
				else{
					alert('비밀번호가 틀립니다')
					$('#pwd').val()
					$('#pwd').focus()
				}
			},
			error:function(request, status, error){
				console.log(error)
			}
		})
	})
})
</script>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">수정하기</h2>
			<div class="row row1">
				<table class="table">
					<tr>
						<th width="15%" class="text-right">이름</th>
						<td>
							<input type="text" id="name" size="10" class="input input-sm" required value="${detail.name }">
						</td>
					</tr>
					<tr>
						<th width="15%" class="text-right">제목</th>
						<td>
							<input type="text" id="subject" size="30" class="input input-sm" required value="${detail.subject }">
						</td>
					</tr>
					<tr>
						<th width="15%" class="text-right">내용</th>
						<td>
							<textarea rows="20" cols="50" required id="content">${detail.content }</textarea>
						</td>
					</tr>
					<tr>
						<th width="15%" class="text-right">비밀번호</th>
						<td>
							<input type="hidden" value="${detail.no}" id="no">
							<input type="password" id="pwd" size="10" class="input input-sm" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="수정하기" class="btn btn-sm btn-primary" style="display: inline-block;" id="updateBtn">
							<input type="button" value="취소" class="btn btn-sm btn-warning" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</div>
		</main>
	</div>
</body>
</html>