<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
function send(){
	sendRequest('sub.jsp', null, ok, 'POST')
}
function ok(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			let div=document.querySelector('#print')
			div.innerHTML=httpRequest.responseText
		}
	}
}
</script>
</head>
<body>
<button onclick="send()">전송</button>
<div id="print"></div>
</body>
</html>