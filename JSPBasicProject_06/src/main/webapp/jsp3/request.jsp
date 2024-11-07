<%--
	HttpServletRequest request
		서버 정보 / 브라우저 정보
			http://localhost/JSPBasicProject_06/jsp3/request.jsp	=> URL
							====================================	=> URI
							===================						=> ContextPath
			================	=> 서버IP / PORT	=> PORT 80은 생략 가능
				getServerName()	=> localhost
					AWS : 각자 고정 IP 부여
				getProtocol() : 약속	=> http
				getPort() : 80
		사용자 요청 정보
			사용자가 보내준 데이터를 받는 메소드
				getParameter() : 단일값을 받을 경우
				getParameterValues() : 여러개 값을 받음
				setCharacterEncoding() : 디코딩
		데이터 추가 정보
			setAttribute() : 추가
			getAttribute() : 추가된 데이터 읽기
			removeAttribute() : 삭제
	HttpServletResponse response
	PageContext pageContext;
    HttpSession session = null;
    ServletContext application;
    ServletConfig config;
    JspWriter out = null;
    Object page = this;
    Exception e;
--%>
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
	width: 600px;
}
</style>
</head>
<body>
	<div class="container">
		<h3 class="text-center">전송</h3>
		<div class="row">
			<form action="request_ok.jsp" method="post">
				<table class="table">
					<tr>
						<th width="20%">이름</th>
						<td width="80%">
							<input type="text" size="20" class="input-sm" name="name">
						</td>
					</tr>
					<tr>
						<th width="20%">성별</th>
						<td width="80%">
							<input type="radio" value="남자" name="sex" checked="checked">
							남자
							<input type="radio" value="여자" name="sex">
							여자
						</td>
					</tr>
					<tr>
						<th width="20%">전화</th>
						<td width="80%">
							<select name="phone1" class="input-sm">
								<option>010</option>
								<option>011</option>
							</select>
							<input type="text" size="20" class="input-sm" name="phone2">
						</td>
					</tr>
					<tr>
						<th width="20%">소개</th>
						<td width="80%">
							<textarea rows="5" cols="30" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th width="20%">취미</th>
						<td width="80%">
							<input type="checkbox" name="hobby" value="등산">
							등산
							<input type="checkbox" name="hobby" value="독서">
							독서
							<input type="checkbox" name="hobby" value="게임">
							게임
							<input type="checkbox" name="hobby" value="영화">
							영화
							<input type="checkbox" name="hobby" value="낚시">
							낚시
							<input type="checkbox" name="hobby" value="여행">
							여행
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<input type="submit" value="전송" class="btn-primary btn-sm">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>