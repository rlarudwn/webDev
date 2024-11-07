<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.listImg {
	width: 45px !important;
	height: 45px !important;
}

.iconImg {
	width: 20px !important;
	height: 20px !important;
}

.listChart tr td {
	padding: 0px;
}

.row .row {
	width: 800px;
}
</style>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<h2>곡</h2>
			<table class="table listChart">
				<tr>
					<th width="5%" class="text-center">번호</th>
					<th width="7%" class="text-center"></th>
					<th width="73%" class="text-center">곡정보</th>
					<th width="5%" class="text-center">듣기</th>
					<th width="5%" class="text-center">추가</th>
					<th width="5%" class="text-center">MV</th>
				</tr>
				<c:forEach var="mvo" items="${mList}" varStatus="i">
					<tr style="vertical-align: middle;">
						<td width="5%" class="text-center">${i.index+1}</td>
						<td width="7%" class="text-center"><img src="${mvo.poster}" class="listImg"></td>
						<td width="73%">${mvo.title}<br>${mvo.aname}</td>
						<td width="5%" class="text-center"><a> <img class="iconImg" src="play.png">
						</a></td>
						<td width="5%" class="text-center"><a>+</a></td>
						<td width="5%" class="text-center"><a href="${mvo.urlmp4}" id="btn" target="_blank"> <img class="iconImg" src="mv.png">
						</a></td>
					</tr>
				</c:forEach>
			</table>
			<a href="../music/musicList.do?ss=${ss}" style="text-align: right;">검색결과 더보기</a>
		</div>
		<div style="height: 50px;"></div>
		<div class="row">
			<h2>앨범</h2>
			<div class="text-center">
				<div class="row" style="">
					<c:forEach var="alvo" items="${alList }">
						<div class="col-sm-4">
							<img src="${alvo.poster }">
						</div>
					</c:forEach>
				</div>
			</div>
			<a href="../music/albumList.do?ss=${ss }" style="text-align: right;">검색결과 더보기</a>
		</div>
		<div style="height: 50px;"></div>
		<div class="row">
			<h2>아티스트</h2>
			<div class="text-center">
				<div class="row" style="">
					<c:forEach var="avo" items="${aList }">
						<div class="col-sm-3">
							<img src="${avo.poster }">
						</div>
					</c:forEach>
				</div>
			</div>
			<a href="../music/artistList.do?ss=${ss}" style="text-align: right;">검색결과 더보기</a>
		</div>
	</div>
</body>
</html>