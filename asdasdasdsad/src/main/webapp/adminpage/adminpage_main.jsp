<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">


    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
		<style>
				
.text-primary {
  background: linear-gradient(
    113.07441835248278deg,
    rgba(255, 156, 156, 1) 7.897508384699059%,
    rgba(255, 156, 156, 1) 11.040067389186005%,
    rgba(255, 147, 5, 1) 89.43417444706309%
  );
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  color: transparent;
}
.sidebar {
    position: relative;
}


</style>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Tempus Dominus CSS -->
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

<!-- style -->
<style>
        table table-hover{
            width: 100%;
            border-collapse: collapse;
            border: none;
            margin: 0 auto;
        }
        td, th {
            text-align: center;    
            vertical-align: middle;
        }
    </style>
<style>
  

</style>
</head>
<body>
<div class="container">
  <div class="row" style="margin-top: 120px;">
    <div class="col-lg-4">
      <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="index.html" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>ArtWave</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">${sessionScope.id}님 </h6>
                        <span>Admin등급</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
               
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">회원목록</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="../adminpage/member_list.do" class="dropdown-item">회원 리스트</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                        </div>
                    </div>
                    
                    
          			<div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">결제관리</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">결제 목록</a>
                            <a href="#" class="dropdown-item">예약 관리</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                        </div>
                    </div>
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">신고 게시판</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">신고게시물</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                        </div>
                    </div>
                  
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">고객센터</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="../adminpage/reply_list.do" class="dropdown-item">1:1문의</a>
                            <a href="../adminpage/notice_list.do" class="dropdown-item">공지사항</a>
                            <a href="#" class="dropdown-item">사전 질문 게시판</a>
                            <a href="#" class="dropdown-item">실시간 상담</a>
                        </div>
                    </div>
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">집계</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                            <a href="#" class="dropdown-item">#</a>
                        </div>
                    </div>
                    
                    
                    
                    
                </div>
            </nav>
  		</div>
    </div>  
    

    <div class="col-lg-8">
      <jsp:include page="${admin_jsp}"></jsp:include>
    </div>
    
  </div>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Moment.js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>

<!-- Tempus Dominus Bootstrap 4 -->
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

</body>
</html>
