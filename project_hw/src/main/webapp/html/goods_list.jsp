<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
request.setCharacterEncoding("UTF-8");
GoodsDAO dao = GoodsDAO.newInstance();
String key = request.getParameter("key");
if (key == null)
	key = "";
else
	key = key.trim();
String type = request.getParameter("type");
if (type == null)
	type = "1";
String strPage = request.getParameter("page");
if (strPage == null)
	strPage = "1";
int curPage = Integer.parseInt(strPage);
List<GoodsVO> list;
list = dao.goodsListData(Integer.parseInt(type), key, curPage);
int totalPage = dao.totalPage(Integer.parseInt(type), key);
final int BLOCK = 10;
int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
int endPage = startPage + BLOCK - 1;
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
	margin-top: 10px;
}

.row {
	width: 960px;
	margin: 0 auto;
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
			<div class="text-center" style="position: relative;">
				<a href="goods_list.jsp?type=1" class="btn btn-info">ALL</a>
				<a href="goods_list.jsp?type=2" class="btn btn-danger">BEST</a>
				<a href="goods_list.jsp?type=3" class="btn btn-primary">NEW</a>
				<a href="goods_list.jsp?type=4" class="btn btn-warning">SPECIAL</a>
				<form action="goods_list.jsp" method="post" style="display: inline;">
					<input type = "hidden" name = "type" value="<%=type%>">
					<input type="text" name="key" size="20" class="input-sm">
					<input type="submit" value="검색" class="btn-sm btn-primary">
				</form>
			</div>
			<div style="height: 10px"></div>
			<%
			for (GoodsVO vo : list) {
			%>
			<div class="col-sm-3">
				<div class="thumbnail">
					<a href="goods_detail.jsp?type=<%=type%>&no=<%=vo.getNo()%>">
						<img src="<%=vo.getPoster()%>" style="width: 240px; height: 140px;" class="image-rounded">
						<p class="a"><%=vo.getName()%></p>
					</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center">
			<ul class="pagination">
				<%
				if (startPage > 1) {
				%>
				<li><a href="goods_list.jsp?type=<%=type%>&key=<%=key%>&page=<%=startPage - 1%>">&lt;</a></li>
				<%
				}
				for (int i = startPage; i <= endPage; i++) {
				%>
				<li class="<%=curPage == i ? "active" : ""%>"><a href="goods_list.jsp?type=<%=type%>&key=<%=key%>&page=<%=i%>"><%=i%></a></li>
				<%
				}
				%>
				<%
				if (endPage < totalPage) {
				%>
				<li><a href="goods_list.jsp?type=<%=type%>&key=<%=key%>&page=<%=endPage + 1%>">&gt;</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</body>
</html>