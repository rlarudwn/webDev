<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#idBtn').click(function() {
		let id=$('#id').val()
		if(id.trim()===''){
			$('#id').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../member/idCheckOk.do',
			data:{
				'id':id
			},
			success:function(result){
				let count=Number(result.trim())
				if(count===0){
					$('#ok').show()
					$('#res').html('<span style="color:blue;">'+id+'는(은) 사용 가능한 아이디 입니다</span>')
					$('#id').prop('disabed', true)
				}
				else{
					$('ok').hide()
					$('#res').html('<span style="color:red;">'+id+'는(은) 이미 사용중인 아이디 입니다</span>')
					$('#id').val('')
					$('#id').focus
				}
			}
		})
	})
	$('#okBtn').click(function() {
		parent.frm.id.value=$('#id').val()
		parent.Shadowbox.close()
	})
})
</script>
<style type="text/css">
.row{
margin-top: 50px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr class="text-center">
					<td>
						ID:
						<input type="text" id="id" name="id" size="15" class="input input-sm">
						<input type="button" value="중복체크" class="btn btn-sm btn-primary" id="idBtn">
					</td>
				</tr>
				<tr>
					<td class="text-center" id="res"></td>
				</tr>
				<tr id="ok" style="display: none;">
				<td class="text-center">
				<input type="button" id="okBtn" class="btn btn-sm btn-success" value="확인">
				</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>