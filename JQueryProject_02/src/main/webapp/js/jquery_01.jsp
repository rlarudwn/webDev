<%--
	태그 생성
		createElement('태그명')
			=> $().html()
		createTextNode()	=> <태그>값</태그>
			=> $().text
		<태그>
			<태그></태그>	=> appendChild()	=> 태그첨부
										=> $().append
		</태그>
		
	이벤트
		onload	=> 브라우저에서 HTML태그를 메모리에 읽어서 화면에 출력된 상태
		onclick	=> button / span / img / a...
		onkeyup	=> 검색	=> text, onkeydown
		onmouseover / onmouseout	=> css효과
		onsubmit	=> 데이터 전송
		onchange	=> 선택 변경 : <select>checkbox...
	이벤트 처리 방법
		인라인 이벤트 모델 : 태그 한개에서 제어
			<button onclick="show()">
		고전적인 이벤트 모델
		표준 이벤트 모델
		이벤트 리스너	=> jquery, vue, react, next
	요청값 전송
		ajax:data:{
		id:'aaa',
		pwd:'1234'
		}
		axios:param:{			=> react-qeury, vue3
		id:'aaa',
		pwd:'1234'
		}
	응답 받기
		json	=> parser : 데이터를 hrml을 이요해 출력
		서버에서는 json을 문자열 형식으로 받음	=> js:JSON.parse()
		
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let h3=document.createElement('h3')
	let text=document.createTextNode('hello javascript')
	h3.appendChild(text)
	document.body.appendChild(h3)
}
let show=()=>{
	alert('버튼 클릭')
}
</script>
</head>
<body>
<button onclick="show()">이벤트 버튼</button>
</body>
</html>