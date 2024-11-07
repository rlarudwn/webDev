<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#logInBtn').on('click', function() {
		let id=$('#id').val()
		if(id.trim()===''){
			$('#id').focus()
			return
		}
		let pwd=$('#pwd').val()
		if(pwd.trim()===''){
			$('#pwd').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../member/logIn.do',
			data:{
				'id':id,
				'pwd':pwd
			},
			success:function(result) {
				if(result==='NOID'){
					alert('아이디가 존재하지 않습니다')
					$('#id').val('')
					$('#pwd').val('')
					$('#id').focus()
				}
				else if(result==='NOPWD'){
					alert('비밀번호가 틀립니다')
					$('#pwd').val('')
					$('#pwd').focus()
				}
				else{
					location.href='../main/main.do'
				}
			},
			error:function(request, status, error){
				console.log('code:'+request.status)
				console.log('message:'+request.responseText)
				console.log('error:'+error)
			}
		})
		
	})
	$('#logOutBtn').click(function() {
		$.ajax({
			type:'post',
			url:'../member/logOut.do',
			success:function(result){
				if(result==='OK')
					location.href='../main/main.do'
			},
			error:function(request, status, error){
				console.log('code:'+request.status)
				console.log('message:'+request.responseText)
				console.log('error:'+error)
			}
		})
	})
})
</script>
</head>
<body>
	<div class="wrapper row1">
		<header id="header" class="clear">
			<div id="logo" class="fl_left">
				<h1>
					<a href="../main/main.do">Food and Recipe</a>
				</h1>
			</div>
			<div class="fl_right">
				<c:if test="${sessionScope.id==null}">
					<ul class="inline text-center">
						<li><input type="text" id="id" class="input input-sm" placeholder="ID"></li>
						<li><input type="password" id="pwd" class="input input-sm" placeholder="PASSWORD"></li>
						<li><input type="button" id="logInBtn" value="LogIn" class="btn btn-sm btn-info"></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.id!=null }">
					<ul class="inline">
						<li>${sessionScope.name}(${sessionScope.admin=='y'?'관리자':'일반' })님</li>
						<li><input type="button" id="logOutBtn" value="LogOut" class="btn btn-sm btn-info"></li>
					</ul>
				</c:if>
			</div>
		</header>
	</div>
	<div class="wrapper row2">
		<nav id="mainav" class="clear">
			<ul class="clear">
				<li class="active"><a href="index.html">Home</a></li>
				<c:if test="${sessionScope.id==null}">
					<li><a class="drop" href="#">member</a>
						<ul>
							<li><a href="../member/join.do">회원가입</a></li>
							<li><a href="../member/idFind.do">아이디찾기</a></li>
							<li><a href="../member/pwdFind.do">비밀번호 찾기</a></li>
						</ul></li>
				</c:if>
				<li><a class="drop" href="#">foodhouse</a>
					<ul>
						<li><a href="pages/gallery.html">맛집찾기</a></li>
						<c:if test="${sessionScope.id!=null }">
							<li><a href="pages/full-width.html">맛집예약</a></li>
						</c:if>
						<li><a href="pages/sidebar-left.html">맛집추천</a></li>
					</ul></li>
				<li><a class="drop" href="#">recipe</a>
					<ul>
						<li><a href="pages/gallery.html">회원가입</a></li>
						<li><a href="pages/full-width.html">아이디찾기</a></li>
						<li><a href="pages/sidebar-left.html">비밀번호 찾기</a></li>
					</ul></li>
				<li><a class="drop" href="#">store</a>
					<ul>
						<li><a href="pages/gallery.html">전체상품</a></li>
						<li><a href="pages/full-width.html">베스트상품</a></li>
						<li><a href="pages/sidebar-left.html">특가상품</a></li>
					</ul></li>
				<li><a class="drop" href="#">trip</a>
					<ul>
						<li><a href="pages/gallery.html">명소</a></li>
						<li><a href="pages/gallery.html">자연/관광</a></li>
						<li><a href="pages/gallery.html">호텔</a></li>
						<li><a href="pages/full-width.html">쇼핑</a></li>
						<li><a href="pages/sidebar-left.html">날씨</a></li>
					</ul></li>
				<li><a class="drop" href="#">comunity</a>
					<ul>
						<li><a href="../board/list.do">자유게시판</a></li>
						<c:if test="${sessionScope.id!=null }">
							<li><a href="pages/gallery.html">문의게시판</a></li>
						</c:if>
						<li><a href="pages/full-width.html">공지사항</a></li>
						<c:if test="${sessionScope.id!=null }">
							<li><a href="pages/sidebar-left.html">실시간채팅</a></li>
						</c:if>
					</ul></li>
				<c:if test="${sessionScope.id!=null }">
					<c:if test="${sessionScope.admin=='n'}">
						<li><a href="#">myPage</a></li>
					</c:if>
					<c:if test="${sessionScope.admin=='y'}">
						<li><a href="#">admin</a></li>
					</c:if>

				</c:if>
			</ul>
		</nav>
	</div>
</body>
</html>