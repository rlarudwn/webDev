
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
/*
http://localhost/HTML_CSSProject_10/food/food_find.jsp
	=> addr = null
http://localhost/HTML_CSSProject_10/food/food_find.jsp?addr=
	=> addr = ''
	
jsp : java server page
	서버에서 실행하는 자바 파일
	메소드 영역
	클래스 제작	=> 컴파일	=> html만 메모리에 저장	=> 저장된 html을 브라우저에서 읽음
	html / xml
*/
FoodDAO dao = FoodDAO.newInstance();
request.setCharacterEncoding("UTF-8");
String addr = request.getParameter("addr");
if (addr == null)
	addr = "마포";
String strPage = request.getParameter("page");
if (strPage == null) {
	strPage = "1";
}
int curPage = Integer.parseInt(strPage);
List<FoodVO> list = dao.foodFindData(addr, curPage);
int totalPage = dao.foodFindTotalPage(addr);
int startPage = curPage / 12 * 12 + 1;
int endPage = startPage + 11;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
			<form action="food_find.jsp?addr=<%=addr%>" method="post">
				<input type="text" name="addr" size="20" class="input-sm" value="<%=addr%>">
				<input type="submit" value="검색" class="btn-sm btn-danger">
			</form>
		</div>
		<div style="height: 20px"></div>
		<%
		for (FoodVO vo : list) {
		%>
		<div class="col-sm-3">
			<a href="#">
				<div class="thumbnail">
					<img src="<%=vo.getPoster()%>" style="width: 240px; height: 240px;" class="img-rounded">
					<p class="a"><%=vo.getName()%></p>
				</div>
			</a>
		</div>
		<%
		}
		%>
	</div>
	<div style="height: 20px;"></div>
	<div class="row">
		<div class="text-center">
			<%
			if (curPage > 1) {
			%>
			<a href="food_find.jsp?addr=<%=addr%>&page=<%=curPage - 1%>" class="btn btn-sm btn-primary">이전</a>
			<%
			}
			%>
			<%=curPage%>
			page /
			<%=totalPage%>
			page
			<%
			if (curPage < totalPage) {
			%>
			<a href="food_find.jsp?addr=<%=addr%>&page=<%=curPage + 1%>" class="btn btn-sm btn-primary">다음</a>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>