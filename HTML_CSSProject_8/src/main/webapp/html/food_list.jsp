<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
FoodDAO dao = FoodDAO.newInstance();
String strPage = request.getParameter("page");
if (strPage == null)
	strPage = "1";
int curPage = Integer.parseInt(strPage);
List<FoodVO> list = dao.foodListData(curPage);
for (FoodVO vo : list) {
	String img = vo.getPoster();
	img = img.replace("https", "http");
	vo.setPoster(img);
}
int totalPage = dao.foodTotalPage();
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
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
			for (FoodVO vo : list) {
			%>
			<div class="col-sm-3">
				<div class="thumbnail">
					<a href="food_detail.jsp?fno=<%=vo.getFno()%>"> <img
						src="<%=vo.getPoster()%>" style="width: 240px; height: 200px"
						class="img-rounded">
						<p class="a"><%=vo.getName()%></p>
					</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div style="height: 10px"></div>
		<div class="text-center">
			<ul class="pagination">
				<%
				if (startPage > 1) {
				%>
				<li><a href="food_list.jsp?page=<%=startPage - 1%>">&lt;</a></li>
				<%
				}
				%>
				<%
				for (int i = startPage; i <= endPage; i++) {
				%>
				<li class="<%=curPage == i ? "active" : ""%>"><a
					href="food_list.jsp?page=<%=i%>"><%=i%></a></li>
				<%
				}
				%>
				<%
				if (((startPage / 10) / (totalPage / 10)) != 1) {
				%>
				<li><a href="food_list.jsp?page=<%=endPage + 1%>">&gt;</a></li>
				<%
				}
				%>
			
		</div>
	</div>
	</div>
</body>
</html>