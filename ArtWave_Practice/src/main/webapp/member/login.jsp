<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/fontawesome.css">
<link rel="stylesheet" href="../assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="../assets/css/owl.css">
<link rel="stylesheet" href="../assets/css/animate.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.row {
	width: 500px;
}

.page-content {
	text-align: center;
}

#center {
	margin: 0 auto;
}

#header {
	position: relative;
	width: 100%;
	text-align: center;
	height: 80px;
}

#nav {
	display: inline-block;
	width: 100%;
	height: 60px;
}

.header-area .main-nav .nav li a.loginTag {
	font-size: 20px;
	!
	important
}

#page {
	margin-top: 20px;
	padding: 40px 20px 60px 20px;
	background-color: #fff;
}

.active {
	color: #A7DDFF;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
	})
	function login() {
		let id = $('#id').val()
		if (id.trim() === '') {
			alert('아이디를 입력하세요')
			id.focus()
			return
		}
		let pwd = $('#pwd').val()
		if (pwd.trim() === '') {
			alert('비밀번호를 입력하세요')
			pwd.focus()
			return
		}
		$.ajax({
			type:'post',
			url:'login_ok.do',
			data:{
				'id':id,
				'pwd':pwd
			},
			success:function(result){
				if(result==='OK'){
					location.href='../main/main.do'
				}
				else if(result==='NOID'){
					alert('ID가 존재하지 않습니다')
					id.val('')
					pwd.val('')
					id.focus()
					return
				}
				else if(result==='NOPWD'){
					alert('비밀번호가 틀렸습니다')
					pwd.val('')
					pwd.focus()
					return
				}
			}
		})
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row" id="center">
			<div style="height: 100px;"></div>
			<div class="col-lg-12">
				<div class="page-content" id="page">
					<a href="../main/main.do">
						<img class="logo" src="logo6.png" style="border-radius: 15px;">
					</a>
					<header class="header-area" id="header">
						<nav class="main-nav" id="nav">
							<ul class="nav">
								<li>
									<a href="index.html" class="active loginTag square">
										<font color="#A7DDFF">로그인</font>
									</a>
								</li>
								<li>
									<a href="browse.html" class="loginTag square">비회원예매</a>
								</li>
							</ul>
						</nav>
					</header>
					<table class="table">
						<tr class="text-center">
							<td width="100%">
								<input type="text" name="id" id="id" class="input" width="100%" placeholder="ID">
								<input type="password" name="pwd" id="pwd" class="input" width="100%" placeholder="PASSWORD" style="margin-top: 10px;">
							</td>
						</tr>
						<tr>
							<td>
								<input type="button" class="input-btn" value="로그인" onclick="login()">
							</td>
						</tr>
						<tr>
							<td>
								<a href="#">회원가입</a>
								<font color="white"> | </font>
								<a href="#">아이디찾기</a>
								<font color="white"> | </font>
								<a href="#">비밀번호찾기</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/js/isotope.min.js"></script>
	<script src="../assets/js/owl-carousel.js"></script>
	<script src="../assets/js/tabs.js"></script>
	<script src="../assets/js/popup.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>