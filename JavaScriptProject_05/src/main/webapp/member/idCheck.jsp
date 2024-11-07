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
	width: 400px;
}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
function idCheck(){
	let id=document.querySelector('#id')
	if(id.value.trim()===''){
		alert('아이디를 입력하시오')
		id.focus()
		return
	}
	axios.get('idCheck_ok.do', {
		params:{
			id:id.value
		}
	}).then(function(result){
		console.log(result.data)
		let count=result.data
		let span=document.querySelector('#check')
		if(count===0){
			span.innerHTML='<font color="blue">'+id.value+'는 사용 가능한 아이디 입니다</font>'			
			let btn=document.querySelector('#okBtn')
			btn.style.display=''
		}
		else{
			span.innerHTML='<font color="red">'+id.value+'는 이미 사용중인 아이디 입니다</font>'			
			id.value=''
			id.focus()
			let btn=document.querySelector('#okBtn')
			btn.style.display='none'
			return
		}
	})
}
function ok(){
	let btn=document.querySelector('#okBtn')
	opener.frm.id.value=id.value
	self.close()
}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">아이디 중복 체크</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-right">
						<input type="text" name="id" size="25" class="input-sm" id="id">
						<input type="button" value="중복확인" class="btn btn-sm btn-info" onclick="idCheck()">
					</td>
				</tr>
				<tr>
					<td>
						<span id="check"></span>
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<input type="button" value="확인" class="btn btn-sm btn-success" onclick="ok()" id="okBtn" style="display: none;">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>