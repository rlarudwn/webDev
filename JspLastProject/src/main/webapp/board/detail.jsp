<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([ [ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ], [ 'Commute', 2 ],
				[ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);

		var options = {
			title : 'My Daily Activities',
			is3D : true,
		};

		var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		chart.draw(data, options);
	}
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
	margin: 0px auto;
	width: 800px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	let i=0
	$('#delBtn').click(function() {
		if(i===0){
			i=1
			$('#delBtn').val('취소')
			$('#pwdTr').show('slow')
		}
		else{
			i=0
			$('#delBtn').val('삭제')
			$('#pwdTr').hide('slow')
		}
	})
})
</script>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">자유게시판</h2>
			<div class="row row1">
				<form action="../board/insert_ok.do" method="post">
					<table class="table">
						<tr>
							<th width="15%" class="text-right">번호</th>
							<td>${detail.no }</td>
							<th width="15%" class="text-right">작성일</th>
							<td>${detail.dbday }</td>
						</tr>
						<tr>
							<th width="15%" class="text-right">이름</th>
							<td>${detail.name }</td>
							<th width="15%" class="text-right">조회수</th>
							<td>${detail.hit }</td>
						</tr>
						<tr>
							<th width="15%" class="text-right">제목</th>
							<td colspan="3">${detail.subject}</td>
						</tr>
						<tr>
							<td colspan="4" class="text-left" valign="top" height="200">
								<pre style="white-space: pre-wrap; background-color: white; border: none;">${detail.content}</pre>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" value="삭제" class="btn btn-sm btn-primary" style="display: inline-block;" id="delBtn">
								<a href="../board/update.do?no=${detail.no }" class="btn btn-sm btn-success">수정</a>
								<a href="../board/list.do" class="btn btn-sm btn-info">목록</a>
							</td>
						</tr>
						<tr style="display: none;" class="text-right" id="pwdTr">
							<td colspan="4">
								<input type="password" size="15" style="display: inline-block;">
								<input type="button" class="btn btn-danger btn-sm" value="입력">
							</td>
						</tr>
					</table>
					<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
				</form>
			</div>

		</main>
	</div>
</body>
</html>