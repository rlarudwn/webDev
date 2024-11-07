<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#writeBtn').click(function() {
		let type=$('#type').val()
		if(type.trim()==='999'){
			alert('카테고리를 선택해주세요')
			$('#type').focus()
			return
		}
		let subject=$('#subject').val()
		if(subject.trim()===''){
			alert('제목을 입력해주세요')
			$('#subject').focus()
			return
		}
		let content=$('#content').val()
		if(content.trim()===''){
			alert('내용을 입력해주세요')
			$('#content').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../board/boardInsertOk.do',
			data:{
				'type':type,
				'subject':subject,
				'content':content
			},
			success:function(result){
				location.href="../board/boardList.do"
			}
		})
		console.log(type)
		console.log(subject)
		console.log(content)
	})
})
</script>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row" style="width: 800px; margin: 0px auto;">
			<h4 class="text-center" style="margin-bottom: 25px;">글작성</h4>
			<form action="../board/boardInsert.do" method="post">
				<table class="table">
					<tr>
						<td colspan="2" style="padding: 2px 8px; border-radius: 9px;">
							<select name="type" class="input input-sm" id="type" style="width: 35%; height: 33px;" required>
								<option value="999">카테고리 선택</option>
								<option value="1">자유</option>
								<option value="2">영화</option>
								<option value="3">책</option>
								<option value="4">음악</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding: 3px 8px;">
							<input type="text" style="border: none; border-radius: 5px; height: 33px; width: 100%; background: #ddd;" placeholder="제목을 입력해 주세요" id="subject" name="subject" required>
						</td>
					</tr>
					<tr>
						<td>
							<textarea rows="15" cols="50" id="content" style="width: 100%; resize: none; border-radius: 9x; border: 1px solid gray;" placeholder="내용을 입력하세요" name="content" required></textarea>
						</td>
					</tr>
					<tr style="text-align: right;">
						<td>
							<input type="button" value="작성" id="writeBtn">
							<input type="button" value="취소" onclick="javascript:history.back()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>