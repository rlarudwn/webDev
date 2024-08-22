<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
<script>
	$(function() {
		$('#tabs').tabs()
		$('#eBtn').click(function() {
			let name=$('#eName').val()
			if(name.trim()===''){
				$('#eName').focus()
				$('#resultEmail').html('<font color="red">이름을 입력하세요</font>')
				return
			}
			let email=$('#email').val()
			if(name.trim()===''){
				$('#email').focus()
				$('#resultEmail').html('<font color="red">이메일을 입력하세요</font>')
				return
			}
			$.ajax({
				type:'post',
				url:'../member/idFindOk.do',
				data:{
					'name':name,
					'email':email
				},
				success:function(result){
					if(result==='NO'){
						$('#resultEmail').html('<h3><font color="red">이름이나 이메일이 존재하지 않습니다</font></h3>')
						$('#eName').val('')
						$('#email').val('')
						$('#eName').focus()
					}
					else{
						$('#resultEmail').html('<h3><font color="blue">'+result+'</font></h3>')
					}
				},
				error:function(request, status, error){
					console.log(error)
				}
			})
		})
		$('#pBtn').on('click', function() {
			let name=$('#pName').val()
			if(name.trim()===''){
				$('resultPhone').html('<h3><font color="red">이름을 입력하세요</font></h3>')
				$('#pName').focus()
				return
			}
			let phone=$('#phone').val()
			if(name.trim()===''){
				$('resultPhone').html('<h3><font color="red">전화번호를 입력하세요</font></h3>')
				$('#phone').focus()
				return
			}
			$.ajax({
				type:'post',
				url:'../member/idFindOk.do',
				data:{
					'name':name,
					'phone':phone
				},
				success:function(result){
					if(result==='NO'){
						$('#resultEmail').html('<h3><font color="red">이름이나 전화번호가 존재하지 않습니다</font></h3>')
						$('#pName').val('')
						$('#phone').val('')
						$('#pName').focus()
					}
					else{
						$('#resultPhone').html('<h3><font color="blue">'+result+'</font></h3>')
					}
				}
			})
		})
	})
</script>
<style type="text/css">
#tabs {
	width: 600px;
}
</style>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">아이디 찾기</h2>
			<div id="tabs">
				<ul>
					<li>
						<a href="#tabs-1">이메일로 찾기</a>
					</li>
					<li>
						<a href="#tabs-2">전화번호로 찾기</a>
					</li>
					<li>
						<a href="#tabs-3">Aenean lacinia</a>
					</li>
				</ul>
				<div id="tabs-1">
					<table class="table">
						<tr>
							<td width="20%">이름</td>
							<td width="80%">
								<input type="text" class="input input-sm" name="name" size="25" id="eName">
							</td>
						</tr>
						<tr>
							<td width="20%">이메일</td>
							<td width="80%">
								<input type="text" class="input input-sm" name="email" size="25" id="email">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<input type="button" class="btn btn-sm btn-info" value="검색" id="eBtn">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span id="resultEmail"></span>
							</td>
						</tr>
					</table>
				</div>
				<div id="tabs-2">
					<table class="table">
						<tr>
							<td width="20%">이름</td>
							<td width="80%">
								<input type="text" class="input input-sm" name="name" size="25" id="pName">
							</td>
						</tr>
						<tr>
							<td width="20%">전화번호</td>
							<td width="80%">
								<input type="text" class="input input-sm" name="phone" size="25" id="phone">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<input type="button" class="btn btn-sm btn-info" value="검색" id="pBtn">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span id="resultPhone"></span>
							</td>
						</tr>
					</table>
				</div>
				<div id="tabs-3"></div>
			</div>
		</main>
	</div>
</body>
</html>