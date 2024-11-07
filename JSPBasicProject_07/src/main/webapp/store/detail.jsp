<%@page import="com.sist.dao.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.dao.GoodsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.sist.dao.GoodsDAO"></jsp:useBean>
<jsp:useBean id="rdao" class="com.sist.dao.ReplyDAO"></jsp:useBean>

<%
String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");

String no = request.getParameter("no");
GoodsVO vo = dao.goodsDetailData(Integer.parseInt(no));
List<ReplyVO> list = rdao.replyListData(Integer.parseInt(no), 2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<table class="table">
			<tr>
				<td rowspan="5" width="50%">
					<img src="<%=vo.getPoster()%>" style="width: 100%; height: 100%;">
				</td>
				<th width="10%">제품명</th>
				<td width="40%"><%=vo.getName()%></td>
			</tr>
			<tr>
				<th width="10%">설명</th>
				<td width="40%"><%=vo.getSub()%></td>
			</tr>
			<tr>
				<th width="10%">가격</th>
				<td width="40%"><%=vo.getPrice()%></td>
			</tr>
			<tr>
				<th width="10%">할인율</th>
				<td width="40%"><%=vo.getDiscount()%>%
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-right">
					<a href="#" class="btn btn-sm btn-primary">찜하기</a>
					<a href="#" class="btn btn-sm btn-danger">좋아요</a>
					<a href="#" class="btn btn-sm btn-warning">예약</a>
					<a href="../main/main.jsp?mode=3" class="btn btn-sm btn-info">목록</a>
				</td>
			</tr>
		</table>
		<table class="table">
			<td>
				<%
				for (ReplyVO rvo : list) {
				%>
				<table class="table">
					<tr>
						<td class="text-left"><%=rvo.getName()%>
							&nbsp;
							<%=rvo.getDbday()%></td>
						<%
						if (rvo.getId().equals(id)) {
						%>
						<td class="text-right">
							<a href="../reply/delete.jsp?rno=<%=rvo.getRno()%>&fno=<%=rvo.getFno()%>&type=2" class="btn btn-sm btn-danger">삭제 </a>
						</td>
						<%
						}
						%>
					</tr>
					<tr>
						<td colspan="2"><%=rvo.getMsg()%></td>
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
			<form method="post" action="../reply/insert.jsp">
			<td>
				<input type="hidden" name="type" value="2">
				<input type="hidden" name="fno" value="<%=no%>">
				<textarea rows="4" cols="70" name="msg" style="float: left;"></textarea>
				<button class="btn-sm btn-info" style="width: 80px; height: 80px">댓글작성</button>
			</td>
			</form>
		</table>
		<%
		}
		%>
	</div>
</body>
</html>