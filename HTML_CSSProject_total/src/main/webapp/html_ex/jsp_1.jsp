<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
FoodDAO dao = FoodDAO.newInstance();
List<FoodVO> list = dao.foodListData();
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
	width: 960px;
	margin: 0 auto;
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

tr.infos:hover {
	cursor: pointer;
	background: yellow;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('.infos').click(function() {
			let name = $(this).attr("data-name");
			let poster = $(this).attr("data-poster");

			$('#name').text()("업체명:" + name);
			$('#poster').attr("src", poster);
		})
	})
</script>
</head>
<body>
	<%-- 	<div class="container">
		<div class="row">
			<div class="text-center">
				<%
				for (FoodVO vo : list) {
				%>
				<div class="col-sm-3">
					<a href="#"> <img src="<%=vo.getPoster()%>" style="width: 240px; height: 200px;">
						<p class="a"><%=vo.getName() %></p>
					</a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div> --%>
	<div class="container">
		<div class="row">
			<div class="table">
				<tr>
					<td>
						<table class="table">
							<caption>
								<h3>맛집정보</h3>
							</caption>
							</td>
							</tr>
							<tr>
								<th></th>
								<th>업체명</th>
							</tr>
							<%
							for (FoodVO vo : list) {
							%>
							<tr class="infos" data-name="<%=vo.getName()%>" data-poster="<%=vo.getPoster()%>">
								<td class="text-center"><img src="<%=vo.getPoster()%>" style="width: 50px; height: 50px;"></td>
								<td><%=vo.getName()%></td>
							</tr>
							<%
							}
							%>
						</table>
					</td>
					<td>
						<table class="table">
							<caption>
								<h3>예약정보</h3>
							</caption>
							<tr>
								<td><span> <img src="" style="width: 100px; height: 200px" id="poster">
								</span></td>
							</tr>
							<tr>
								<td><span> <p id="name"></p>
								</span></td>
							</tr>
						</table>
					</td>
				</tr>
			</div>
		</div>
	</div>
</body>
</html>