<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jqueyr.js"></script>
<script type="text/javascript">
let jjimCheck=false;
	$(function() {
		replyList(${param.fno})
		$('#writeBtn').click(function() {
			let msg = $('#msg').val()
			if(msg.trim()===''){
				$('msg').focus()
				return
			}
			let cno=$(this).attr('data-cno')
			$.ajax({
				type:'post',
				url:'../allReply/insert.do',
				data:{
					'cno':cno,
					'msg':msg,
					'type':1
				},
				success:function(result){
					if(result==='OK'){
						replyList(cno)
					}
					else{
						alert(result)
					}
				},
				error:function(request, status, error){
					console.log(error)
				}
			})
		})
		 $('#jjimBtn').click(function() {
					let cno=$(this).attr("data-cno")
					$.ajax({
						type:'post',
						url:'../allJjim/insert.do',
						data:{
							'cno':cno, 'type':1
						},
						success:function(result){
							console.log(result)
							if(result==='OK'){
								location.href="../food/detail.do?fno="+cno+"&type=1"
							}
							else{
								alert(result)
							}
						}
					})
				})
			
		})
function replyList(cno)
 {
	 $.ajax({
		 type:'post',
		 url:'../allReply/list.do',
		 data:{"cno":cno, 'type':1},
		 success:function(json)
		 {
			 json=JSON.parse(json)
			 let html=''
			 
			 json.map(function(reply){
				 //for(let reply of json){
				 html+='<table class="table">'
					 html+='<tr>'
					 html+='<td class="text-left">◑'+reply.name+'('+reply.dbday+')</td>'
					 html+='<td class="text-right">'
				      if(reply.id===reply.sessionId)
				      {
				    	  html+='<span class="btn btn-xs btn-success ups" onclick="replyUpdate('+reply.rno+')">수정</span>&nbsp;' 
				    	  html+='<input type=button class="btn btn-xs btn-warning" value="삭제" onclick="replyDelete('+reply.rno+','+reply.cno+')">' 
				      }
					 html+='</td>'
					 html+='</tr>'
					 html+='<tr>'
					 html+='<td colspan="2">'
					 html+='<pre style="white-space:pre-wrap;border:none;background:white">'+reply.msg+'</pre>'
					 html+='</td>'
					 html+='</tr>'
				     html+='<tr class="updates" id="m'+reply.rno+'" style="display:none">'
				     html+='<td>'
				     html+='<textarea rows="4" cols="70" id="msg'+reply.rno+'" style="float: left">'+reply.msg+'</textarea>'
				     html+='<input type=button value="댓글수정" onclick="replyUpdateData('+reply.rno+', '+cno+')" style="width: 100px;height: 85px;background-color: green;color:black">'
				     html+='</td>'
				     html+='</tr>'
					 html+='</table>'
				 //}
			 })
			 console.log(html)
			 $('#reply').html(html)
		 },
		 error:function(request,status,error)
		 {
			 console.log(error)
		 }
	 })
 }
	function replyDelete(rno, cno) {
		$.ajax({
			type:'post',
			url:'../allReply/delete.do',
			data:{'rno':rno},
			success:function(result){
				if(result==='OK'){
					replyList(cno)
				}
				else{
					alert(result)
				}
			},
			error:function(request, status, error){
				console.log(error)
			}
		})
	}
	function replyUpdate(rno, cno) {
		$('updates').hide()
		$('#m'+rno).show()
	}
	function replyUpdateData(rno, cno) {
		let msg=$('#msg'+rno).val()
		if(msg.trim()===''){
			$('#msg').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../allReply/update.do',
			data:{'rno':rno, 'msg':msg},
			success:function(result){
				if(result==='OK'){
					replyList(cno)
				}
				else{
					alert(result)
				}
				$('#m'+rno).hide()
			},
			error:function(request, status, error){
				console.log(error)
			}
		})
	}
</script>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">상세보기</h2>
			<div class="flexslider carousel basiccarousel btmspace-80">
				<ul class="slides">
					<c:forTokens items="${detail.images}" delims="^" var="image">
						<li>
							<figure>
								<img class="radius-10 btmspace-10" src="http://menupan.com${image}" width="320px" height="180px">
							</figure>
						</li>
					</c:forTokens>
				</ul>
			</div>
			<table class="table">
				<tr>
					<td width="30%" class="text-center" rowspan="7">
						<img src="http://menupan.com${detail.poster}" width="100%">
					</td>
					<td colspan="2">
						<h3>${detail.name}&nbsp;<span style="color: orange;">${vo.score}</span>
						</h3>
					</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray;" width="15%">업종</td>
					<td width="55%">${detail.type }</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray;" width="15%">전화</td>
					<td width="55%">${detail.phone }</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray;" width="15%">주소</td>
					<td width="55%">${detail.address }</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray;" width="15%">테마</td>
					<td width="55%">${detail.theme }</td>
				</tr>
				<tr>
					<td class="text-right" style="color: gray;" width="15%">주차</td>
					<td width="55%">${detail.parking }</td>
				</tr>
				<tr>
					<td colspan="3" class="text-right">
						<c:if test="${sessionScope.id!=null }">
							<a href="" class="btn btn-sm btn-success" id="likeBtn">좋아요</a>
							<c:if test="${check==false}">
								<input type="button" class="btn btn-sm btn-warning" id="jjimBtn" data-cno="${detail.fno}"} value="찜하기">
							</c:if>
							<c:if test="${check==true}">
								<span class="btn btn-sm btn-default">찜하기</span>
							</c:if>
							<a href="" class="btn btn-sm btn-info">예약</a>
						</c:if>
						<a href="../food/list.do" class="btn btn-sm btn-danger">목록</a>
					</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<td>${detail.content }</td>
				</tr>
			</table>
			<div style="height: 10px;"></div>
			<div id="map" style="width: 100%; height: 350px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e5e9b716ff5c97c5d1fe82f3cebfb53&libraries=services"></script>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${detail.address}', function(result, status) {

					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {

						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						// 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : coords
						});

						// 인포윈도우로 장소에 대한 설명을 표시합니다
						var infowindow = new kakao.maps.InfoWindow({
							content : '<div style="width:150px;text-align:center;padding:6px 0;">${detail.name}</div>'
						});
						infowindow.open(map, marker);

						// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						map.setCenter(coords);
					}
				});
			</script>
			<div style="height: 20px;"></div>
			<h2 class="sectiontitle">댓글</h2>
			<table class="table">
				<tr>
					<td id="reply"></td>
				</tr>
			</table>
			<c:if test="${sessionScope.id!=null }">
				<table class="table">
					<tr>
						<td>
							<textarea rows="4" cols="70" id="msg" style="float: left"></textarea>
							<input type=button value="댓글쓰기" style="width: 100px; height: 85px; background-color: green; color: black" id="writeBtn" data-cno="${detail.fno}">
						</td>
					</tr>
				</table>
			</c:if>
			<div style="height: 20px;"></div>
			<h2 class="sectiontitle">최근 방문 맛집</h2>
			<div class="flexslider carousel basiccarousel btmspace-80">
				<ul class="slides">
					<c:forEach var="vo" items="${nList }">
						<li>
							<figure>
								<img class="radius-10 btmspace-10" src="http://menupan.com${vo.poster }" width="250px" height="180px">
								<figcaption>
									<a href="#">${vo.name }</a>
								</figcaption>
							</figure>
						</li>
					</c:forEach>
				</ul>
			</div>
		</main>
	</div>
</body>
</html>