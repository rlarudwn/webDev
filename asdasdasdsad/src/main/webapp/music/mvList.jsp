<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.mvList{
cursor:pointer;
}
.mv td iframe {
	width: 100%;
	height: 100%;
	position: absolute;
}

.mv td {
	position: relative;
	width: 100%;
	padding-bottom: 56.25%;
}

.paging {
	position: relative;
	display: inline-flex;
	margin-bottom: 20px;
}

.paging li {
	width: 35px;
	height: 35px;
	border: 2px solid black;
	border-right: none;
}

.paging li:last-child {
	width: 35px;
	height: 35px;
	border: 2px solid black;
}

.paging li a {
	display: block;
	font-size: 25px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		let page = -1
		$('.mvList').click(function() {
			let data = $(this).attr('data-id')
			$('.mv').css('display', 'none')
			if (page != data) {
				page = data
				data = '#mv' + data
				$(data).css('display', '')
			} else {
				page = -1
			}
		})
	})
</script>
</head>
<body>
	<div class="container" style="margin-top: 150px;">
		<div class="row">
			<table class="table">
				<tr>
					<th width="5%" class="text-center">번호</th>
					<th width="15%" class="text-center"></th>
					<th width="40%" class="text-center">제목</th>
					<th width="33%" class="text-center">아티스트</th>
					<th width="7%" class="text-center">좋아요</th>
				</tr>
				<c:forEach var="vo" items="${mvList}" varStatus="i">
					<tr class="mvList" data-id="${i.index}">
						<td width="5%" class="text-center">${(curPage-1)*20+i.index+1}</td>
						<td width="15%" class="text-center"><img src="${vo.thum}"></td>
						<td width="40%">${vo.title}</td>
						<td width="33%" class="text-center">${vo.aname }</td>
						<td width="7%" class="text-center">${vo.likecount }</td>
					</tr>
					<tr id="mv${i.index }" style="display: none; margin-bottom: 30px;" class="mv">
						<td colspan="5"><iframe src="https://www.youtube.com/embed/${vo.urlmp4 }" title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
								referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></td>
					</tr>
				</c:forEach>
			</table>
			<form action="../music/musicMvList.do" method="post" style="display: grid;">
				<table>
					<tr class="text-center">
						<td>
							<ul class="paging">
								<c:if test="${startPage>1}">
									<li><a href="../music/musicMvList.do?page=${startPage-1}&ss=${ss}">&lt;</a></li>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<li><a href="../music/musicMvList.do?page=${i}&ss=${ss}">${i}</a></li>
								</c:forEach>
								<c:if test="${endPage<totalPage}">
									<li><a href="../music/musicMvList.do?page=${endPage+1}&ss=${ss}">&gt;</a></li>
								</c:if>
							</ul>
						</td>
					</tr>
					<tr class="text-center">
						<td><input type="text" size="15" id="ss" name="ss"> <input type="button" value="검색"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>