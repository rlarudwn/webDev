<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 960px;
}

.brow {
	margin: 0px auto;
	width: 800px;
}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
function update(){
	let name=document.querySelector('#name')
	if(name.value.trim()===''){
		name.focus()
		return
	}
	let subject=document.querySelector('#subject')
	if(subject.value.trim()===''){
		subject.focus()
		return
	}
	let content=document.querySelector('#content')
	if(content.value.trim()===''){
		content.focus()
		return
	}
	let pwd=document.querySelector('#pwd')
	if(pwd.value.trim()===''){
		pwd.focus()
		return
	}
	
	let=document.querySelector('#no')
	
	axios.get('update_ok.do', {
		params:{
			no:no.value,
			name:name.value,
			subject:subject.value,
			content:content.value,
			pwd:pwd.value
		}
	}).then(function(result) {
		console.log(result)
		if(result.data==='yes'){
			location.href="detail.do?no="+no.value
		}
		else{
			alert('비밀번호가 틀립니다\n비밀번호를 다시 입력하세요')
			pwd.value=''
			pwd.focus()
		}
	})
}
</script>
</head>
<body>
	<div class="wrapper_row3">
		<main class="container clear">
			<div class="row">
				<h3 class="sectiontitle text-center">글쓰기</h3>
				<table class="table">
					<tr>
						<th width="15%" class="text-center">이름</th>
						<td width="85%">
							<input type="text" name="name" size="20" class="" value="${detail.name }" id="name">
						</td>
					</tr>
					<tr>
						<th width="15%" class="text-center">제목</th>
						<td width="85%">
							<input type="text" name="subject" size="20" class="" value="${detail.subject }" id="subject">
						</td>
					</tr>
					<tr>
						<th width="15%" class="text-center">내용</th>
						<td width="85%">
							<textarea rows="10" cols="60" name="content" id="content">${detail.content }</textarea>
						</td>
					</tr>
					<tr>
						<th width="15%" class="text-center">비밀번호</th>
						<td width="85%">
							<input type="password" name="pwd" size="15" class="" id="pwd">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-right">
							<input type="hidden" value="${detail.no}" id="no">
							<button class="btn btn-info" onclick="update()">수정</button>
							<a href="../board/list.do" class="btn btn-danger">취소</a>
						</td>
					</tr>
				</table>
			</div>
		</main>
	</div>
</body>
</html>