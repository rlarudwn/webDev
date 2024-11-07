<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		$('#postBtn').click(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('#post1').val(data.zonecode)
					$('#addr1').val(data.address)
				}
			}).open()
		})
	})
</script>
<style type="text/css">
.joinRow {
	width: 800px
}
.joinRow {
	width: 800px .
}

.black {
	color: black;
}
.listImg {
	width: 45px !important;
	height: 45px !important;
}

.iconImg {
	width: 20px !important;
	height: 20px !important;
}

.listBody {
	padding: 30px;
	width: 900px;
	background-color: aliceblue;
	border-radius: 30px;
/* 	margin-left: 30px; 
 */}

.listChart {
	background: white;
	padding: 5px;
	vertical-align: middle !important;
}

.listChart tr td {
	height: 50px;
	margin: 0px;
}

.row .row {
	width: 800px;
}

.page {
	padding: 0;
	margin: 20px 0;
	display: flex;
	justify-content: center;
	font-family: Arial, sans-serif;
}

.page {
	list-style: none;
	padding: 0;
	margin: 20px auto; /* 위와 아래 여백을 추가하고 자동으로 가운데 정렬 */
	display: flex;
	justify-content: center; /* 네비게이션 항목을 가운데로 정렬 */
	font-family: Arial, sans-serif;
}

.page li {
	margin: 0 3px; /* 네비게이션 항목 간의 여백 */
}

.page a {
	text-decoration: none;
	color: #0197A3; /* 링크 색상 */
	padding: 8px 12px;
	border: 1px solid #0197A3; /* 링크 테두리 색상 */
	border-radius: 4px; /* 둥근 모서리 */
	transition: background-color 0.3s, color 0.3s; /* 부드러운 색상 변화 */
}

.page a:hover {
	background-color: #0197A3; /* 호버 시 배경색 */
	color: #fff; /* 호버 시 텍스트 색상 */
}

.page .current a {
	background-color: #0197A3; /* 현재 페이지 배경색 */
	color: #fff; /* 현재 페이지 텍스트 색상 */
	border: 1px solid #0197A3; /* 현재 페이지 테두리 색상 */
	pointer-events: none; /* 현재 페이지 클릭 방지 */
}

.page .current a:hover {
	background-color: #0197A3; /* 현재 페이지 호버 시 배경색 */
	color: #fff; /* 현재 페이지 호버 시 텍스트 색상 */
}

.page li:first-child a {
	border-radius: 4px 0 0 4px; /* 왼쪽 끝 모서리 둥글게 */
}

.page li:last-child a {
	border-radius: 0 4px 4px 0; /* 오른쪽 끝 모서리 둥글게 */
}

.listTitle {
	font-size: 13px;
}

.listTitle a {
	color: black;
}

.listArtist {
	font-size: 11px;
}

.genreTable {
	border: transparent;
	margin-top: 15px;
	margin-bottom: -1px;
}

.genreTable td {
	padding: 0px;
	vertical-align: middle;
}

.genreTable td a {
	text-align: center;
	color: #aaa;
	display: block;
	width: 100%;
	border: 2px solid #aaa;
	border-bottom: 2px solid #777;
	border-right: none;
	border-radius: 7px 7px 0px 0px;
	height: 35px;
	vertical-align: middle;
	background: white;
	font-size: 13px;
	padding-top: 6px;
}

.genreTable td:first-child a {
	
}

.genreTable td:last-child a {
	width: 100%;
	border: 2px solid #aaa;
}

.genreTable .active a {
	border-left: 2px solid #777 !important;
	border-top: 2px solid #777 !important;
	border-right: 2px solid #777 !important;
	border-bottom: 2px solid #777 !important;
	background-color: white;
}

.genreTable .anext a {
	border-left: none !important;
}

.genreTable td {
	padding: 0px !important;
	border: none;
}
.btnposi{
	margin-left: 80px;
}
</style>
</head>
<body>
	<div class="listBody">
		<main class="listChart">
			<div class="row joinRow">
			
				<form method="post" action="../mypage/my_edit_member_ok.do"
					name="frm">
					<table class="table">
						<tr>
							<th class="text-right" width="15%">ID</th>
							<td width="85%" class="inline"><input type="text" size=20
								class="input-sm text-center" name="id" id="id"
								value="${sessionScope.id}" readonly>
							</td>
						</tr>
						<tr>
							<th class="text-right" width="15%">닉네임</th>
							<td width="85%" class="inline"><input type="text" size=20
								class="input-sm" name="nickname" id="nickname"></td>
						</tr>

						<tr>
							<th class="text-right" width="15%">이름</th>
							<td width="85%"><input type="text" size=20 class="input-sm"
								name="name" id="name" value="${sessionScope.name }">
							</td>
						</tr>
						<tr>
							<th class="text-right" width="15%">성별</th>
							<td width="85%" class="inline" ><input type="radio"  style="margin-top: 10px;"
								name="sex" value="남자" ${vo.sex=='남자'?"checked":"" }>남자 <input
								type="radio" name="sex" value="여자" ${vo.sex=='여자'?"checked":"" }>여자
							</td>
						</tr>
						<tr>
							<th class="text-right" width="15%">생년월일</th>
							<td width="85%"><input type="date" size=30 class="input-sm"
								name="birthday" id="day" value="${sessionScope.bday }"></td>
						</tr>
						<tr>
							<th class="text-right" width="15%">이메일</th>
							<td width="85%"><input type="text" size=70 class="input-sm"
								name="email" id="email">
							</td>
						</tr>
						<tr>
							<th class="text-right" width="15%">우편번호</th>
							<td width="85%" class="inline"><input type="text" size=15
								class="input-sm" name="post" readonly id="post1"
								value="${sessionScope.post}"> <input type=button value="우편번호검색"
								class="btn btn-sm btn-primary" id="postBtn"></td>
						</tr>
						<tr>
							<th class="text-right" width="15%">주소</th>
							<td width="85%"><input type="text" size=70 class="input-sm"
								name="addr1" readonly id="addr1" value="${sessionScope.addr1 }"></td>
						</tr>
						<tr>
							<th class="text-right" width="15%">상세주소</th>
							<td width="85%"><input type="text" size=70 class="input-sm"
								name="addr2" value="${sessionScope.addr2 }"></td>
						</tr>
						<tr>
							<th class="text-right" width="15%">전화번호</th>
							<td width="85%" class="inline"><select class="input-sm"
								name="phone1">
									<option>010</option>
							</select> <input type="text" size=20 class="input-sm" name="phone2"
								id="phone2" value="${sessionScope.phone }"></td>
						</tr>
 						<tr>
							<th class="text-right" width="15%">비밀번호 확인</th>
							<td width="85%" class="inline"><input type="password"
								size=20 class="input-sm" name="pwd" id="pwd"></td>
						</tr> 
						<tr>
							<td colspan="2" class="text-center inline"><input
								type="submit" value="저장" class=" btnposi btn-sm btn-info" id="joinBtn">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type=button value="취소" class=" btn-sm btn-warning"
								onclick="window.location.href='../mypage/mypage_main.do'"></td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>
</body>
</html>