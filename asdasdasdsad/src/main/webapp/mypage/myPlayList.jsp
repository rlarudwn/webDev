<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="URF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
.caret {
	display: none !important;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-right" colspan="6"><span style="height: 30px; width:130px; display: block; border: 1px solid black; padding:5px; cursor: pointer;" class="playlistBtn" data-toggle="modal"
						data-target="#myModal">플레이리스트 추가</span></td>
				</tr>
				<tr>
					<th width="5%" class="text-center">번호</th>
					<th width="45%" class="text-center">이름</th>
					<th width="20%" class="text-center">생성일</th>
					<th width="10%" class="text-center">노래개수</th>
					<th width="20%" class="text-center"></th>
				</tr>
				<c:forEach var="vo" items="${list}" varStatus="i">
					<tr style="vertical-align: middle;">
						<td class="text-center">${i.index+1}</td>
						<td style="text-align: left;"><a href="../mypage/myPlayListDetail.do?plno=${vo.plno}">${vo.plname}</a></td>
						<td class="text-center">${vo.dbday}</td>
						<td class="text-cemter">${vo.count}</td>
						<td class="text-cemter inline">
							<button type="button">이름수정</button> <a href="../mypage/myPlayListDelete.do?plno=${vo.plno}" class="btn">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			<h2 class="text-center">플레이리스트 생성</h2>
				<div class="modal-body">
					<form action="../mypage/myPlayListMake.do" method="post">
						<input type="text" name="plname"> <input type="submit" value="생성">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>