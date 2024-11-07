<%@page import="com.sist.dao.GoodsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.sist.dao.GoodsDAO"></jsp:useBean>
<%
String mode = request.getParameter("mode");
String strPage = request.getParameter("page");
if (strPage == null)
	strPage = "1";
int curPage = Integer.parseInt(strPage);
int totalPage = dao.goodsTotalPage();
List<GoodsVO> list = dao.goodsListData(curPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<%
		for (GoodsVO vo : list) {
		%>
		<div class="col-sm-2">
			<a href="../main/main.jsp?mode=4&no=<%=vo.getNo()%>">
				<div class="thumbnail a">
					<img src="<%=vo.getPoster()%>" style="width: 160px; height: 200px;">
					<p><%=vo.getName()%></p>
				</div>
			</a>
		</div>
		<%
		}
		%>
	</div>
	<div style="">
		<div class="row">
			<div class="text-center">
			<a href="../main/main.jsp?mode=3&page=<%=curPage>1?curPage-1:curPage%>" class="btn btn-sm btn-primary">이전</a>
			<%=curPage %> page/<%=totalPage %> page
			<a href="../main/main.jsp?mode=3&page=<%=curPage<totalPage?curPage+1:curPage%>" class="btn btn-sm btn-primary">다음</a>
			</div>
		</div>
	</div>
</body>
</html>