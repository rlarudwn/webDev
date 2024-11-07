<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('.dataTr').click(function() {
			let rmno = $(this).attr("data-mno")
			let mposter = $(this).attr("data-mposter")
			let mtitle = $(this).attr("data-mtitle")
			let mgrade = $(this).attr("data-mgrade")
			$.ajax({
				type : 'post',
				url : '../movie/theaterinfo1.do',
				data : {"rmno" : rmno},
				success : function(result) {
					$('#movieposter').attr("src", mposter)
					$('#movietitle').text(mtitle)
					$('#moviegrade').text(mgrade)
					$('#rmno').val(rmno)
				},
				error : function(request, status, error) {
					console.log(error)
				}
			})
		})
	})
</script>
<style type="text/css">
.dataTr:hover {
	background-color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<table class="table" id="mtitletable" style="overflow-y:scroll">
		<c:forEach var="vo" items="${moList }">  <!--  영화 제목 리스트 --> 
			<tr class="dataTr" data-mno="${vo.mno }"
				data-mposter="https://www.kobis.or.kr${vo.mposter }"
				data-mtitle="${vo.mtitle }" data-mgrade="${vo.mgrade }" >
				<td class="text-left inline-block" class="moviedata">
				<c:choose>
						<c:when test="${vo.mgrade eq '전체관람가'}">
							<img
								src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png"
								alt="" width="30px" height="30px">
						</c:when>
						<c:when test="${vo.mgrade eq '12세이상관람가'}">
							<img
								src="https://img.megabox.co.kr/static/pc/images/common/txt/12_46x46.png"
								alt="" width="30px" height="30px">
						</c:when>
						<c:when test="${vo.mgrade eq '15세이상관람가'}">
							<img
								src="https://img.megabox.co.kr/static/pc/images/common/txt/15_46x46.png"
								alt="" width="30px" height="30px">
						</c:when>
						<c:when test="${vo.mgrade eq '청소년관람불가'}">
							<img
								src="https://img.megabox.co.kr/static/pc/images/common/txt/19_46x46.png"
								alt="" width="30px" height="30px">
						</c:when>
					</c:choose>
					</td>
				<td class="text-center inline-block" class="moviedata">${vo.mtitle }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>