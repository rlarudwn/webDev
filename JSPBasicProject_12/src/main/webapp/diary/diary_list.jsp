<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
DiaryService dao = DiaryService.newInstance();
DiaryVO vo = new DiaryVO();
String id = (String) session.getAttribute("id");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
vo.setId(id);
vo.setYear(Integer.parseInt(year));
vo.setMonth(Integer.parseInt(month));
vo.setDay(Integer.parseInt(day));
List<DiaryVO> list = dao.diaryListData(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	let i = 0
	$(function() {
		$('.checks').click(function() {
			let no = $(this).attr("data-no");
			$('.msgs').hide();
			if (i == 0) {
				$('#msg' + no).show();
				i = 1;
			} else {
				$('#msg' + no).hide();
				i = 0;
			}
		})
	})
</script>
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 800px;
}

h3 {
	text-align: center
}
</style>
</head>
<body>
	<div class="container">
		<h3><%=session.getAttribute("name")%>님의
			<%=year%>년
			<%=month%>월
			<%=day%>일 일정목록
		</h3>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="50%" class="text-center">일정</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="20%"></th>
					</tr>
				</thead>
				<tbody>
					<%
					for (DiaryVO dvo : list) {
					%>
					<tr>
						<td width="10%" class="text-center"><%=dvo.getNo()%></td>
						<td width="50%"><%=dvo.getSubject()%></td>
						<td width="20%" class="text-center"><%=dvo.getDbDay()%></td>
						<td>
							<span class="btn btn-xs btn-warning checks" data-no="<%=dvo.getNo()%>">일정확인</span>
							<a href="diary_update.jsp?no=<%=dvo.getNo()%>" class="btn btn-xs btn-primary"> 수정 </a>
							<a href="diary_delete.jsp?no=<%=dvo.getNo()%>&year=<%=year%>&month=<%=month%>&day=<%=day%>" class="btn btn-xs btn-danger">삭제</a>
						</td>
					</tr>
					<tr id="msg<%=dvo.getNo()%>" class="msgs" style="display: none;">
						<td colspan="4" class="text-left" valign="top">
							<pre style="white-space: pre-wrap;"><%=dvo.getMsg()%></pre>
						</td>
					</tr>
					<%
					}
					%>
					<tr>
						<td colspan="4" class="text-right">
							<a href="diary.jsp" class="btn btn-xs btn-danger">일정</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>