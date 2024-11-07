<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	const emps=[{"empno":1, "ename":"홍길동", "sex":"남자", "dept":"개발부", "loc":"서울"},
		{"empno":2, "ename":"심청이", "sex":"여자", "dept":"영업부", "loc":"부산"},
		{"empno":3, "ename":"이순신", "sex":"남자", "dept":"자재부", "loc":"제주"},
		{"empno":4, "ename":"춘향이", "sex":"여자", "dept":"총무부", "loc":"경기"},
		{"empno":5, "ename":"박문수", "sex":"남자", "dept":"영업부", "loc":"부산"},
		{"empno":6, "ename":"강감찬", "sex":"남자", "dept":"개발부", "loc":"서울"}
	]
	document.write("<h1>배열 데이터를 for-each를 이용한 출력")
	document.write("<div class=container>")	
	document.write("<div class=row>")	
	document.write("<table class=table")	
	document.write("<thead>")	
	document.write("<tr>")	
	document.write("<th>사번</th>")	
	document.write("<th>이름</th>")	
	document.write("<th>성별</th>")	
	document.write("<th>부서</th>")	
	document.write("<th>근무지</th>")	
	document.write("</tr>")	
	document.write("</thead>")
	document.write("<tbody>")
	emps.forEach((vo)=>{
	document.write("<tr>")
	document.write("<td>"+vo.empno+"</td>")
	document.write("<td>"+vo.ename+"</td>")
	document.write("<td>"+vo.sex+"</td>")
	document.write("<td>"+vo.dept+"</td>")
	document.write("<td>"+vo.loc+"</td>")
	document.write("</tr>")
	})
	document.write("</tbody>")
	document.write("</table>")	
	document.write("</div>")	
	document.write("</div>")	
}
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 800px;
}
</style>
</head>
<body>

</body>
</html>