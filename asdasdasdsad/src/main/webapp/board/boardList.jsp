<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title {
	color: black;
}

.genreTable {
	border: transparent;
	margin-top: 15px;
	margin-bottom: -1px;
	width: 300px;
}

.genreTable td {
	padding: 0px;
	vertical-align: middle;
}

.genreTable td a {
	text-align: center;
	color: #aaa;
	display: block;
	width: 100%;
	border: 2px solid #aaa;
	border-bottom: 2px solid #777;
	border-right: none;
	border-radius: 7px 7px 0px 0px;
	height: 35px;
	vertical-align: middle;
	background: white;
	font-size: 13px;
	padding-top: 6px;
}

.genreTable td:nth-child(5) a {
	width: 100%;
	border: 2px solid #aaa;
	border-bottom: 2px solid #777;
}

.genreTable .active a {
	border-left: 2px solid #777 !important;
	border-top: 2px solid #777 !important;
	border-right: 2px solid #777 !important;
	border-bottom: none !important;
}

.genreTable .anext a {
	border-left: none !important;
}

.genreTable td {
	padding: 0px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	function check(id) {
		if (id === '')
			alert('로그인이 필요합니다')
		else {
			location.href = "../board/boardInsert.do"
		}
	}
</script>
</head>
<body>
	<div class="container" style="margin-top: 130px;">
		<div class="row">
			<h4 class="text-center" style="margin-bottom: 25px;">자유게시판</h4>
			<table class="table" style="margin-bottom: 50px; border: transparent;">
				<tr>
					<td width="72%" style="text-align: right;">
						<select name="option">
							<option value="0">검색 옵션 선택</option>
							<option value="1">닉네임</option>
							<option value="2">제목</option>
							<option value="3">내용</option>
						</select>
						<input type="text" size="25" name="ss" class="input input-sm">
						<input type="button" value="검색">
					</td>
				</tr>
			</table>
			<table class="table genreTable">
				<tr>
					<td width="20%" class="genreBtn ${type==''?'active':''}">
						<a href="../board/boardList.do">전체</a>
					</td>
					<td width="20%" class="genreBtn ${type==1?'active':type==''?'anext':''}">
						<a href="../board/boardList.do?type=1">자유</a>
					</td>
					<td width="20%" class="genreBtn ${type==2?'active':type=='1'?'anext':''}">
						<a href="../board/boardList.do?type=2">영화</a>
					</td>
					<td width="20%" class="genreBtn ${type==3?'active':type==2?'anext':''}">
						<a href="../board/boardList.do?type=3">책</a>
					</td>
					<td width="20%" class="genreBtn ${type==4?'active':type==3?'anext':''}">
						<a href="../board/boardList.do?type=4">음악</a>
					</td>
				</tr>
			</table>
			<table class="table">
				<tr>

				</tr>
				<tr>
					<th width="5%" class="text-center">번호</th>
					<th width="50%" class="text-center">제목</th>
					<th width="15%" class="text-center">닉네임</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
				<tbody style="height: 500px;">
					<c:forEach var="vo" items="${bList }" varStatus="i">
						<tr style="height: 50px;">
							<td width="5%" class="text-center">${count-i.index}</td>
							<td width="50%">
								<a href="../board/boardDetail.do?fbno=${vo.fbno}" class="title">[${vo.typeDetail}]${vo.fbsubject }</a>
							</td>
							<td width="15%" class="text-center">${vo.nick }</td>
							<td width="20%" class="text-center">${vo.dbday }</td>
							<td width="10%" class="text-center">${vo.fbhit }</td>
						</tr>
					</c:forEach>
					<tr>
				</tbody>
				<td colspan="5" style="text-align: right;">
					<input type="button" class="btn" id="writeBtn" value="글 작성" onclick="check('${sessionScope.id}')">
				</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>