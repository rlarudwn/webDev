<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 960px;
}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
let bCheck=false
function boardDelete(){
	if(!bCheck){
		let btn=document.querySelector('#delBtn')
		btn.value='취소'
		let tr=document.querySelector('#delTr')
		tr.style.display=''
		bCheck=true
	}
	else{
		let btn=document.querySelector('#delBtn')
		btn.value='삭제'
		let tr=document.querySelector('#delTr')
		tr.style.display='none'
		bCheck=false
	}
}
function boardRealDelete(no){
	let pwd=document.querySelector('#pwd')
	if(pwd.value.trim()===''){
		alert('비밀번호를 입력하시오')
		pwd.focus()
		return
	}
	axios.get('delete.do', {
		params:{
			no:no,
			pwd:pwd.value
		}
	}).then(function(response) {
		if(response.data==='no'){
			alert('비밀번호가 틀립니다\n다시 입력하세요')
			pwd.value=''
			pwd.focus()
			return
		}
		else{
			location.href="list.do"
		}
	})
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<th width="10%" class="text-center">번호</th>
					<td width="40%">${detail.no }</td>
					<th width="10%" class="text-center">작성일</th>
					<td width="40%">${detail.dbday }</td>
				</tr>
				<tr>
					<th width="10%" class="text-center">이름</th>
					<td width="40%">${detail.name }</td>
					<th width="10%" class="text-center">조회수</th>
					<td width="40%">${detail.hit }</td>
				</tr>
				<tr>
					<th width="10%" class="text-center">제목</th>
					<td width="90%" colspan="3">${detail.subject }</td>
				</tr>
				<tr>
					<td colspan="4" class="text-left" valign="top" height="200">
						<pre style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden; background: white; height: 200px;">
						${detail.content }
						</pre>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<a href="../board/update.do?no=${detail.no}" class="btn btn-sm btn-warning">수정</a>
						<input type="button" class="btn btn-sm btn-danger" value="삭제" onclick="boardDelete()" id="delBtn">
						<a href="../board/list.do" class="btn btn-sm btn-primary">목록</a>
					</td>
				</tr>
				<tr id="delTr" style="display: none;">
					<td colspan="4" class="text-right">
						비밀번호:
						<input type="password" size="15" class="input-sm" id="pwd">
						<input type="button" value="삭제" class="btn btn-sm btn-danger" onclick="boardRealDelete(${detail.no})">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>