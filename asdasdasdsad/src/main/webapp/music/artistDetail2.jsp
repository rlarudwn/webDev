<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rowColor {
	padding: 30px;
	background: white;
	border-radius: 30px;
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

#poster {
	width: 300px !important;
	height: 300px;
	border-radius: 20px;
}

#musicPoster {
	width: 60px !important;
	height: 60px;
}

.musicPoster {
	width: 200px !important;
	height: 200px;
}

#listBtn {
	border: none;
	background-color: transparent;
}

#likeBtn {
	width: 30px;
	height: 30px;
	padding: 0px;
	background-color: transparent;
	border: none;
	margin: 0px;
}

a {
	color: black !important;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	let listCheck=false
	let likeCheck=false
	playListList()
	let id=$('#id').val()
	if(id.length>0){
		console.log(id)
		$.ajax({
			type:'post',
			url:'../like/likeCheck.do',
			data:{
				'tno':${detail.ano},
				'type':3
			},
			success:function(result){
				if(result==='OK'){
					likeCheck=true
					$('#likeBtnIcon').attr('src', 'like_on.png')
				}
				else{
					likeCheck=false
					$('#likeBtnIcon').attr('src', 'like_off.png')
				}
			}
		})
	}
	else{
		$('#likeBtn').css('display', 'none')
	}
	$('#likeBtn').click(function() {
		let ano=$('#ano').val()
		if(likeCheck===true){
			$.ajax({
				type:'post',
				url:'../like/likeOff.do',
				data:{
					'tno':ano,
					'type':3
				},
				success:function(result){
					if(result>=0){
						likeCheck=false
						$('#likeBtnIcon').attr('src', 'like_off.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
		else{
			$.ajax({
				type:'post',
				url:'../like/likeOn.do',
				data:{
					'tno':ano,
					'type':3
				},
				success:function(result){
					if(result>=0){
						likeCheck=true
						$('#likeBtnIcon').attr('src', 'like_on.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
	})
	let length=$('#listBody tr').length
	console.log(length)
	if(length >5){
		$('#listBody tr:gt(4)').css('display', 'none')
	}
	else{
		$('#listBtn').css('display', 'none')
	}
	
	$('#listBtn').click(function(){
		if(listCheck===false){
			$('#listBody tr:gt(4)').css('display', '')
			listCheck=true
			$('#listBtn').val('접기')
		}
		else{
			$('#listBody tr:gt(4)').css('display', 'none')
			listCheck=false
			$('#listBtn').val('펼치기')
		}
	})
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
	let id=$('#id').val()
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
			$('.dropUl').html(html)
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
	<div class="container">
		<div class="row" style="margin-top: 150px; background: aliceblue; padding: 50px; border-radius: 20px;">
			<div class="rowColor">
				<table class="table">
					<tr>
						<td rowspan="6">
							<img src="${detail.poster}" id="poster">
						</td>
						<th width="20%" class="text-center">이름</th>
						<td width="80%" colspan="2">${detail.aname}</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">활동유형</th>
						<td width="80%" colspan="2">${detail.type}</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">데뷔</th>
						<td width="80%" colspan="2">${detail.debutyear}</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">데뷔곡</th>
						<td width="80%" colspan="2">${detail.debutsong}</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">국적</th>
						<td width="80%" colspan="2">${detail.nation}</td>
					</tr>
					<tr>
						<th width="20%" class="text-center">좋아요</th>
						<td width="40%" id="likeCount">${detail.likecount}</td>
						<td>
							<button id="likeBtn">
								<img src="" id="likeBtnIcon">
							</button>
						</td>
					</tr>
					<tr>
						<td colspan="5">${detail.content }</td>
					</tr>
				</table>
			</div>
			<div style="height: 20px;"></div>
			<div class="rowColor">
				<h4 style="color: black;">${detail.aname}&nbsp;앨범LIST</h4>
				<div style="height: 30px;"></div>
				<c:forEach var="avo" items="${aList }">
					<div class="col-sm-3">
						<div class="text-center">
							<a href="../music/albumDetail.do?alno=${avo.alno}">
								<img src="${avo.poster}" style="border-radius: 23px;" class="musicPoster">
								<p class="text-center">${avo.atitle }</p>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div style="height: 20px;"></div>
			<div class="rowColor">
				<h4>${detail.aname}곡list</h4>
				<table class="table">
					<tbody id="listBody">
						<c:forEach var="vo" items="${mList }">
							<tr style="vertical-align: middle; height: 70px; position: relative;">
								<td width="10%">
									<img src="${vo.poster}" id="musicPoster">
								</td>
								<td width="40%">
									<a href="../music/musicDetail.do?mno=${vo.mno}">${vo.title }</a>
								</td>
								<td width="20%" style="text-align: center;">
									<a href="../music/artistDetail.do?ano=${vo.ano}">${vo.aname }</a>
								</td>
								<td width="7%" style="text-align: center;">${vo.genre}</td>
								<td width="13%" style="text-align: center;">${vo.playcount }</td>
								<td width="10%" style="text-align: center; padding: 0px; position: relative;">
									<ul class="nav" style="display: inline; position: relative;">
										<li class="dropdown">
											<span class="toggleMenu">+</span>
											<ul class="dropmenu dropUl" data-mno="${vo.mno}">
											</ul>
										</li>
									</ul>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tr>
						<td colspan="6" style="text-align: center; border: none;">
							<input type="button" id="listBtn" value="펼치기">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<input type="hidden" value="${sessionScope.id}" id="id">
	<input type="hidden" value="${detail.ano}" id="ano">
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