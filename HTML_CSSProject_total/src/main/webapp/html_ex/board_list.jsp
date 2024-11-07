<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
request.setCharacterEncoding("UTF-8");
String type = request.getParameter("type");
if (type == null) {
	type = "1";
}
String key = request.getParameter("key");
if (key == null)
	key = "";
else
	key = key.trim();
String strPage = request.getParameter("page");
if (strPage == null)
	strPage = "1";
int curPage = Integer.parseInt(strPage);
BoardDAO dao = BoardDAO.newInstance();
List<BoardVO> list = dao.boardListData(Integer.parseInt(type), key, curPage);
int count = dao.boardTotalPage(Integer.parseInt(type), key);
int totalpage = (int) (Math.ceil(count / 10.0));
count = count - (curPage * 10 -10);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 30px;
}

.row {
	margin: 0px auto;
	width: 800px;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>자유 게시판</h3>
		<div class="row">
			<table class="table">
				<tr>
					<td>
						<a href="board_insert.jsp" class="btn btn-xs btn-danger">새글</a>
					</td>
				</tr>
			</table>
			<table class="table table-striped">
				<tr>
					<th width="10%" class="text-center">번호</th>
					<th width="45%" class="text-center">제목</th>
					<th width="15%" class="text-center">이름</th>
					<th width="20%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회수</th>
				</tr>
				<%
				for (BoardVO vo : list) {
				%>
				<tr>
					<td widtd="10%" class="text-center"><%=count--%></td>
					<td width="45%">
						<a href="board_detail.jsp?no=<%=vo.getNo()%>"> <%=vo.getSubject()%> <%
 String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
 if (today.equals(vo.getDb_day())) {
 %> &nbsp;<sup style="color: red;">new</sup> <%
 }
 %>
						</a>
					</td>
					<td widtd="15%" class="text-center"><%=vo.getName()%></td>
					<td widtd="20%" class="text-center"><%=vo.getDb_day()%></td>
					<td widtd="10%" class="text-center"><%=vo.getHit()%></td>
				</tr>
				<%
				}
				%>
			</table>
			<table class="table">
				<tr>
					<td class="text-left">
						<form action="board_list.jsp?type=<%=type%>&key=<%=key%>">
							<select class="input-sm" name="type">
								<option value="1">이름</option>
								<option value="2">제목</option>
								<option value="3">내용</option>
							</select>
							<input type="text" size="15" class="input-sm" name="key">
							<input type="submit" value="검색" class="btn-sm btn-success">
						</form>
					</td>
					<td class="text-right">
						<a href="board_list.jsp?type=<%=type%>&key=<%=key%>&page=<%=curPage > 1 ? curPage - 1 : curPage%>" class="btn btn-sm btn-primary">이전</a>
						<%=curPage%>page /
						<%=totalpage%>page <a href="board_list.jsp?type=<%=type%>&key=<%=key%>&page=<%=curPage < totalpage ? curPage + 1 : curPage%>" class="btn btn-sm btn-primary">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>