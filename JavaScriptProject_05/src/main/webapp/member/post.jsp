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
	width: 400px;
}
</style>
<script type="text/javascript">
function postOk(){
	let dong=document.querySelector('#dong')
	if(dong.value.trim()===''){
		alert('동/읍/면을 입력하시오')
		dong.focus()
		return
	}
	let form=document.querySelector('#frm')
	console.log(dong)
	form.submit()
}
function ok(zip, addr) {
	opener.frm.post.value=zip
	opener.frm.address.value=addr
	self.close()
}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">우편번호 검색</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-right">
						<form name="postFrm" method="post" action="post_ok.do" id="frm">
							<input type="text" name="dong" size="25" class="input-sm" id="dong">
							<input type="button" value="검색" class="btn btn-sm btn-info" onclick="postOk()">
						</form>
					</td>
				</tr>
			</table>
			<c:if test="${count!=0}">
				<table class="table">
					<tr>
						<th class="text-center" width="25%">우편번호</th>
						<th class="text-center" width="75%">주소</th>
					</tr>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td class="text-center">${vo.zipcode }</td>
							<td><a href="javascript:ok('${vo.zipcode}', '${vo.address}')">${vo.address}</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${count==0}">
				<table class="table">
					<tr>
						<td class="text-center">
							<h3>검색된 결과가 존재하지 않습니다</h3>
						</td>
					</tr>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>