<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.FoodDAO"></jsp:useBean>
<%
String strPage = request.getParameter("page");
if (strPage == null)
	strPage = "1";
int curPage = Integer.parseInt(strPage);
int totalPage = dao.foodTotalPage();
List<FoodVO> list = dao.foodListData(curPage);

Cookie[] cookies = request.getCookies();
List<FoodVO> cList = new ArrayList<FoodVO>();
if (cookies != null) {
	for (int i = cookies.length - 1; i >= 0; i--) {
		if (cookies[i].getName().startsWith("food_")) {
	String fno = cookies[i].getValue();
	FoodVO vo = dao.foodDetailData(Integer.parseInt(fno));
	cList.add(vo);
		}
	}
}
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
		for (FoodVO vo : list) {
		%>
		<div class="col-sm-3">
			<a href="../food/food_detail_before.jsp?fno=<%=vo.getFno()%>">
				<div class="thumbnail">
					<img src="<%=vo.getPoster()%>" style="width: 375px; height: 300px">
					<p><%=vo.getName()%></p>
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
			<a href="../main/main.jsp?page=<%=curPage > 1 ? curPage - 1 : curPage%>" class="btn btn-sm btn-danger">이전</a>
			<%=curPage%>
			page/<%=totalPage%>
			page
			<a href="../main/main.jsp?page=<%=curPage < totalPage ? curPage + 1 : curPage%>" class=" btn btn-sm btn-info">다음</a>
		</div>
	</div>
	<div style="height: 20px;"></div>
	<div class="row">
		<%
		for (FoodVO vo : cList) {
		%>
		<div class="col-sm-2">
			<a href="../main/main.jsp?mode=1&fno=<%=vo.getFno()%>">
				<div class="thumbnail">
					<img src="<%=vo.getPoster()%>" style="width: 150px; height: 130px;">
				</div>
			</a>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>