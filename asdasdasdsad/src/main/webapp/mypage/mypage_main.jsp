<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
    .mtop {
        margin-top: 200px;
    }
    .sinav {
        width: 150px;
    }
    .container2 {
    margin-left: 50px;
    margin-top: 150px; /* 원하는 값으로 조정 */
}
	.black {
		color: black;
		text-align: center;
	}
.caret{
	display: none !important;
}
</style>
</head>
<body>
    <div class=" container2 text-center">
        <div class="row" style="margin-top:50px;">
            <div class="col-lg-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">개인정보</h3>
                    </div>
                    <!-- 사이드바 메뉴목록1 -->
                    <ul class="list-group">
                        <li class="list-group-item"><a href="../mypage/my_edit_member.do">회원수정</a></li>
                        <li class="list-group-item"><a href="../mypage/my_change_pwd.do">비밀번호 변경</a></li>
                        <li class="list-group-item"><a href="../mypage/my_member_exit.do">회원탈퇴</a></li>
                    </ul>
                </div>
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title sinav">관리정보</h3>
                    </div>
                    <!-- 사이드바 메뉴목록2 -->
                    <ul class="list-group">
                        <li class="list-group-item"><a href="../mypage/my_reserve.do">예약관리</a></li>
                        <li class="list-group-item"><a href="../mypage/my_text.do">내가 쓴 글</a></li>
                        <li class="list-group-item"><a href="../mypage/my_like.do">내 좋아요</a></li>
                        <li class="list-group-item"><a href="../mypage/my_playlist.do">플레이 리스트</a></li>
                        <li class="list-group-item"><a href="../mypage/my_cart.do">장바구니</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-10">
                <h2 class=" black" style="margin-left: 0px">${title}</h2>
                <jsp:include page="${mypage_jsp}"></jsp:include>
            </div>
        </div>
    </div>
</body>
</html>