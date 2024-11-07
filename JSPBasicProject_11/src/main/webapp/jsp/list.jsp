<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
String strPage = request.getParameter("no");
if (strPage == null)
	strPage = "1";
int curPage = Integer.parseInt(strPage);
SeoulDAO dao = SeoulDAO.newInstance();
List<LocationVO> list = dao.seoulLocationListData(curPage);
final int BLOCK = 10;
int startPage = (curPage - 1) / BLOCK * BLOCK + 1;
int endPage = startPage + BLOCK - 1;
int totalPage = dao.seoulLocationTotalPage();
if (endPage > totalPage)
	endPage = totalPage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 960px;
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<%
			for (LocationVO vo : list) {
			%>
			<div class="col-sm-3">
				<div class="thumbnail">
					<a href="#">
						<img src="<%=vo.getPoster()%>" style="height: 200px; width: 200px;">
					</a>
					<p class="a"><%=vo.getTitle()%></p>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<div class="row">
		<div class="text-center">
			<ul class="pagination">
				<%
				if (startPage > 1) {
				%>
				<li><a href="list.jsp?no=<%=startPage - 1%>">&lt;</a></li>
				<%
				}
				%>
				<%
				for (int i = startPage; i <= endPage; i++) {
				%>
				<li class="<%=curPage == i ? "active" : ""%>"><a href="list.jsp?no=<%=i%>"><%=i%></a></li>
				<%
				}
				%>
				<%
				if (endPage < totalPage) {
				%>
				<li><a href="list.jsp?no=<%=endPage + 1%>">&gt;</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
	<div style="height: 20px;"></div>
	<div class="row">
		<h3>최근 방문 서울 여행</h3>
		<hr>
	</div>
</body>
</html>