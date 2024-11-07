<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
<h3 class="text-center">Request객체</h3>
<table class="table">
<tr>
<th width="20%">클래스명</th>
<td width="80%">HttpServletRequest</td>
</tr>
<tr>
<th width="20%">클래스명</th>
<td width="80%">HttpServletRequest</td>
</tr>
<tr>
<th width="20%">기능</th>
<td width="80%">
<ul>
<li>사용자가 전송한 데이터 관리</li>
<li>브라우저 정보</li>
<li>데이터 추가 기능</li>
</ul>
</td>
</tr>
<tr>
<th width="20%">주요메소드</th>
<td width="80%"><ul>
<li>String getParameter(String key) 사용자가 보내준 값을 받을 때 사용(단일값)</li>
<li>String getParameterValues(String key) 사용자가 보내준 값을 받을 때 사용(여러 값)</li>
<li>void setCharacterEncoding("java")	=> 한글코드</li>
<li>String getRemoteAddress</li>
<li>String getrequestURI : 사용자가 요청한 파일의 경로</li>
<li>String getContextPath : 프로젝트명</li>
</ul></td>
</tr>
</table>
</div>
</body>
</html>