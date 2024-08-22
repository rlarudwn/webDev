<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<h2 class="sectiontitle">쉐프 목록</h2>
			<table class="table">
				<c:forEach var="vo" items="${list}">
					<tr>
						<td width="15%" class="text-center" rowspan="2">
							<a href="../recipe/chefMake.do?chef=${vo.chef}"><img src=${vo.poster } style="width: 100px; height: 100px" class="img-circle"></a>
						</td>
						<td colspan="4">
							<h4 style="color: orange;"><a href="../recipe/chefMake.do?chef=${vo.chef}">${vo.chef}</a></h4>
						</td>
					</tr>
					<tr>
						<td class="text-center">
							<img src="../recipe/m1.png">&nbsp;${vo.mem_cont1 }
						<td class="text-center">
							<img src="../recipe/m2.png">&nbsp;${vo.mem_cont3 }
						<td class="text-center">
							<img src="../recipe/m3.png">&nbsp;${vo.mem_cont7 }
						<td class="text-center">
							<img src="../recipe/m4.png">&nbsp;${vo.mem_cont2 }
					</tr>
				</c:forEach>
			</table>
			<table class="table">
				<tr>
					<td class="text-center">
						<a href="../recipe/chefList.do?page=${curPage>1?curPage-1:curPage}" class="btn btn-sm btn-info">이전</a>
						${curPage }page/${totalPage }page
						<a href="../recipe/chefList.do?page=${curPage<totalPage?curPage+1:curPage}" class="btn btn-sm btn-warning">다음</a>
					</td>
				</tr>
			</table>
		</main>
	</div>
</body>
</html>