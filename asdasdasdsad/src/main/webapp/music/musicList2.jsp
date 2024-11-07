<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table>tbody>tr>td {
	vertical-align: middle !important;
}

.caret {
	display: none !important;
}

.toggleMenu::hover {
	background: transparent !important;
}

.toggleMenu::after {
	content: none; /* 가상 요소 내용 제거 */
}

.dropmenu {
	position: absolute; /* 위치를 절대값으로 지정 */
	z-index: 1000; /* 드랍메뉴가 맨 위로 올라오도록 z-index 설정 */
	display: none; /* 기본적으로 드랍메뉴를 숨김 */
	background-color: white; /* 드랍메뉴 배경색 지정 */
}

.dropUl {
	width: 190px;
	z-index: 999;
}

.dropUl li {
	padding: 0px 3px;
	height: 100%;
	border-bottom: 2px solid #aaa;
}

.dropUl li:last-child {
	padding: 0px 3px;
	height: 100%;
	border-bottom: none;
}

.dropUl li span {
	font-size: 15px;
	cursor: pointer;
	display: block;
	margin: 5px 0px;
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
	margin: 0px auto !important;
}

.listChart {
	background: white;
	border-radius: 0px 0px 20px 20px;
	padding: 5px;
}

.listChart tr td {
	padding: 0px;
	height: 50px;
	margin: 0px;
	border: none;
}

.row .row {
	width: 800px;
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
	margin-bottom: -1px !important;
}

.genreTable td {
	padding: 0px !important;
	border-top: transparent !important;
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

.genreTable td:last-child a {
	width: 100%;
	border: 2px solid #aaa;
	border-bottom: 2px solid #777;
}

.genreTable .active a {
	border-left: 2px solid #777 !important;
	border-top: 2px solid #777 !important;
	border-right: 2px solid #777 !important;
	border-bottom: none !important;
}

.genreTable .anext a {
	border-left: none !important;
}

.genreTable td {
	padding: 0px;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	playListList()
	$('.playListBtn').click(function() {
		$(this).next().css('display', '')
		$(this).next().css('z-index', '10')
	})
})
function playListMake() {
	let plname=$('#playListName').val()
	if(plname.trim()===''){
		alert('이름을 입력해주세요')
		$('#playListName').focus()
		return 
	}
	$.ajax({
		type:'post',
		url:'../music/playListMake.do',
		data:{'plname':plname},
		success:function(){
			alert('플레이리스트를 생성했습니다')
			$('#playListName').val('')
			playListList()
		}
	})
}
function playListList() {
	let id='${id}'
	$.ajax({
		type:'post',
		url:'../music/playListList.do',
		success:function(result){
			json=JSON.parse(result)
			console.log(json)
			html=''
			if(id.length>2){
			html+='<li style="width:190px;"><span style="height: 20px; cursor:pointer; display:block;" class="playlistBtn" data-toggle="modal" data-target="#myModal">플레이리스트 추가</span></li>'
			}
			else{
			html+='<li style="width:190px;"><span style="height: 20px; display:block;" class="playlistBtn" >로그인이 필요합니다</span></li>'
			}
			json.map(function(playlist) {
				html+='<li style="width:190px;"><span style="height:20px; cursor:pointer; display:block;" onclick="playListMusicInsert(this, '+playlist.plno+')">'+playlist.plname+'</span></li>'
			})
			$('.dropUI').html(html)
		}
	})
}
function playListMusicInsert(li, plno){
	let no=$(li).parent().parent().attr('data-mno')
	console.log(no)
	console.log(plno)
	$.ajax({
		type:'post',
		url:'../music/playListMusicInsert.do',
		data:{
			'mno':no,
			'plno':plno
		},
		success:function(result){
			if(result==='OK'){
				alert('플레이리스트에 추가했습니다')
			}
			else{
				alert('이미 플레이리스트에 존재하는 음악입니다')
			}
		}
	})
}
</script>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row listBody">
			<h3 style="margin-bottom: 40px;">앨범 목록</h3>
			<table class="table genreTable">
				<tr>
					<td width="11%" class="genreBtn ${genre==1?'active':''}">
						<a href="../music/musicList.do?genre=1">전체</a>
					</td>
					<td width="11%" class="genreBtn ${genre==2?'active':genre==1?'anext':''}">
						<a href="../music/musicList.do?genre=2">댄스</a>
					</td>
					<td width="11%" class="genreBtn ${genre==3?'active':genre==2?'anext':''}">
						<a href="../music/musicList.do?genre=3">드라마</a>
					</td>
					<td width="11%" class="genreBtn ${genre==4?'active':genre==3?'anext':''}">
						<a href="../music/musicList.do?genre=4">발라드</a>
					</td>
					<td width="11%" class="genreBtn ${genre==5?'active':genre==4?'anext':''}">
						<a href="../music/musicList.do?genre=5">인디</a>
					</td>
					<td width="11%" class="genreBtn ${genre==6?'active':genre==5?'anext':''}">
						<a href="../music/musicList.do?genre=6">락</a>
					</td>
					<td width="11%" class="genreBtn ${genre==7?'active':genre==6?'anext':''}">
						<a href="../music/musicList.do?genre=7">랩/힙합</a>
					</td>
					<td width="11%" class="genreBtn ${genre==8?'active':genre==7?'anext':''}">
						<a href="../music/musicList.do?genre=8">트로트</a>
					</td>
					<td width="11%" class="genreBtn ${genre==9?'active':genre==8?'anext':''}">
						<a href="../music/musicList.do?genre=9">R&B/소울</a>
					</td>
				</tr>
			</table>
			<table class="table listChart">
				<tr>
					<th width="7%" class="text-center">번호</th>
					<th width="7%" class="text-center"></th>
					<th width="65%" class="text-center">곡정보</th>
					<th width="7%" class="text-center">듣기</th>
					<th width="7%" class="text-center">추가</th>
					<th width="7%" class="text-center">MV</th>
				</tr>
				<c:forEach var="mvo" items="${list}" varStatus="i">
					<tr style="vertical-align: middle; height: 50px; position: relative;">
						<td width="7%" class="text-center">${(curPage-1)*50+i.index+1}</td>
						<td width="7%" class="text-center">
							<img src="${mvo.poster}" class="listImg">
						</td>
						<td width="65%">
							<span class="listTitle"><a href="../music/musicDetail.do?mno=${mvo.mno}">${mvo.title}</a></span><br> <span class="listArtist"><a style="color: #aaa;" href="../music/artistDetail.do?ano=${mvo.ano}">${mvo.aname}</a></span>
						</td>
						<td width="7%" class="text-center">
							<a>
								<img class="iconImg" src="play.png">
							</a>
						</td>
						<td width="7%" class="text-center" style="position: relative;">
							<ul class="nav" style="display: inline; position: relative;">
								<li class="dropdown">
									<span class="toggleMenu"><i class="fas fa-list"></i></span>
									<ul class="dropmenu dropUI" style="width:190px;" data-mno="${mvo.mno}">
									</ul>
								</li>
							</ul>
						</td>
						<td width="7%" class="text-center">
							<a href="${mvo.urlmp4}" id="btn" target="_blank">
								<img class="iconImg" src="mv.png">
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<nav>
				<ul class="page page-lg">
					<c:if test="${startPage > 1}">
						<li>
							<a href="../music/musicList.do?page=${startPage-1}&ss=${ss}&genre=${genre}">&laquo; Previous</a>
						</li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li ${i == curPage ? "class='current'" : ""}>
							<a href="../music/musicList.do?page=${i}&ss=${ss}&genre=${genre}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${endPage < totalPage}">
						<li>
							<a href="../music/musicList.do?page=${endPage+1}&ss=${ss}&genre=${genre}">Next &raquo;</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<h2 class="text-center">플레이리스트 생성</h2>
				<div class="modal-body">
					<input type="text" id="playListName">
					<input type="button" value="생성" onclick="playListMake()">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>