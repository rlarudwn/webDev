<%@page import="java.util.List"%>
<%@page import="com.sist.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"></jsp:useBean>
<jsp:useBean id="rdao" class="com.sist.dao.ReplyDAO"></jsp:useBean>
<%
String id = (String) session.getAttribute("id");
String strFno = request.getParameter("fno");
int fno = Integer.parseInt(strFno);
FoodVO vo = dao.foodDetailData(fno);
List<ReplyVO> list = rdao.replyListData(fno, 1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://node.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let u = 0;
	$(function() {
		$('.updates').click(function() {
			$('.ups').hide();
			let rno = $(this).attr("data-no");
			if (u == 0) {
				u = 1;
				$(this).text("취소");
				$('#ups' + rno).show();
			} else {
				u = 0;
				$(this).text("수정");
				$('#ups' + rno).hide();
			}
		})
	})
</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-8">
			<table class="table">
				<tr>
					<td rowspan="8" width="40%" class="text-center">
						<img src="<%=vo.getPoster()%>" width="100%">
					</td>
					<td width="60%" colspan="2" class="text-center">
						<h3><%=vo.getName()%>&nbsp; <span style="color: red;"><%=vo.getScore()%></span>
						</h3>
					</td>
				</tr>
				<tr>
					<th width="10%">업종</th>
					<td width="50%" colspan="3"><%=vo.getType()%></td>
				</tr>
				<tr>
					<th width="10%">주소</th>
					<td width="50%" colspan="3"><%=vo.getAddr()%></td>
				</tr>
				<tr>
					<th width="10%">전화번호</th>
					<td width="50%" colspan="3"><%=vo.getPhone()%></td>
				</tr>
				<tr>
					<th width="10%">테마</th>
					<td width="50%" colspan="3"><%=vo.getTheme()%></td>
				</tr>
				<tr>
					<th width="10%">소개</th>
					<td width="50%" colspan="3"><%=vo.getContent()%></td>
				</tr>
				<tr>
					<th width="10%">평점</th>
					<td width="20%"><%=vo.getScore()%></td>
					<th width="10%">좋아요</th>
					<td width="20%"><%=vo.getLikecount()%></td>
				</tr>
				<tr>
					<td class="text-right" colspan="4">
						<a href="#" class="btn btn-xs btn-info">찜하기</a>
						<a href="#" class="btn btn-xs btn-danger">좋아요</a>
						<a href="#" class="btn btn-xs btn-primary">예약</a>
						<a href="../main/main.jsp?mode=0" class="btn btn-xs btn-warning">목록</a>
					</td>
				</tr>
			</table>
			<div style="height: 15px;"></div>

			<table class="table">
				<td>
					<%
					for (ReplyVO rvo : list) {
					%>
					<table class="table">
						<tr>
							<td class="text-left"><%=rvo.getName()%>&nbsp; (<%=rvo.getDbday()%>)
							</td>
							<td class="text-right">
								<%
								if (rvo.getId().equals(id)) {
								%>
								<span class="btn btn-primary btn-xs updates" data-no=<%=rvo.getRno()%>>수정</span>
								<a href="../reply/delete.jsp?rno=<%=rvo.getRno()%>&fno=<%=fno%>&type=1" class="btn btn-danger btn-xs">삭제</a>
								<%
								}
								%>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-left">
								<pre style="white-space: pre-wrap; background-color: white; border: none;"><%=rvo.getMsg()%></pre>
							</td>
						</tr>
						<tr style="display: none;" class="ups" id="ups<%=rvo.getRno()%>">
							<td>
								<form action="../reply/update.jsp" method="post">
									<input type="hidden" name="fno" value="<%=vo.getFno()%>">
									<input type="hidden" name="rno" value="<%=rvo.getRno()%>">
									<textarea rows="4" cols="70" name="msg" style="float: left;" required><%=rvo.getMsg()%></textarea>
									<button style="height: 82px; width: 100px; background: red; color: white;">댓글수정</button>
								</form>
							</td>
						</tr>
					</table>
					<%
					}
					%>
				</td>
			</table>
			<%
			if (id != null) {
			%>
			<table class="table">
				<tr>
					<td>
						<form action="../reply/insert.jsp" method="post">
							<input type="hidden" name="type" value="1">
							<input type="hidden" name="fno" value="<%=vo.getFno()%>">
							<textarea rows="4" cols="70" name="msg" style="float: left;" required></textarea>
							<button style="height: 82px; width: 100px; background: red; color: white;">댓글쓰기</button>
						</form>
					</td>
				</tr>
			</table>
			<%
			}
			%>
		</div>
		<div class="col-sm-4">
			<h1>
				맛집번호 :
				<%=fno%></h1>
		</div>
	</div>
</body>
</html>