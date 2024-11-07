<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
String strPage = request.getParameter("page");
if (strPage == null) {
	strPage = "1";
}
int curPage = Integer.parseInt(strPage);

DataBoardDAO dao = DataBoardDAO.newInstance();
List<DataBoardVO> list = dao.databoardListData(curPage);
final int BLOCK = 10;
int startPage = (curPage - 1) / BLOCK * BLOCK + 1;
int endPage = startPage + BLOCK - 1;
int count = dao.databoardRowCount();
int totalPage = (int) (Math.ceil(count / 10.0));
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
	width: 600px;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h3>자료실</h3>
		<div class="row">
			<table class="table">
				<tr class="text-right">
					<td>
						<a href="insert.jsp" class="btn btn-primary btn-sm">새글</a>
					</td>
				</tr>
			</table>
			<table class="table table-hover">
				<thead>
					<tr class="danger">
						<th class="text-center" width="10%">번호</th>
						<th class="text-center" width="45%">제목</th>
						<th class="text-center" width="15%">이름</th>
						<th class="text-center" width="20%">작성일</th>
						<th class="text-center" width="10%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (DataBoardVO vo : list) {
					%>
					<tr>
						<td class="text-center"><%=vo.getNo()%></td>
						<td>
							<a href="detail.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject()%>
								<%
								String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
								if (today.equals(vo.getDbday())) {
								%>
								&nbsp;<sup style="color: red">new</sup>
								<%
								}
								%>
							</a>
						</td>
						<td class="text-center"><%=vo.getName()%></td>
						<td class="text-center"><%=vo.getDbday()%></td>
						<td class="text-center"><%=vo.getHit()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<table class="table">
				<tr class="text-center">
					<td>
						<a href="list.jsp?page=<%=curPage > 1 ? curPage - 1 : curPage%>" class="btn btn-sm btn-info">이전</a>
						<%=curPage%>page/<%=totalPage%>page
						<a href="list.jsp?page=<%=curPage < totalPage ? curPage + 1 : totalPage%>" class="btn btn-sm btn-danger">다음</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>