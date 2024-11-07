<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-sm-12">
	<div class="bg-light rounded h-100 p-4">
		<h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>회원목록</h3>

		<!-- <div class="content"> -->
			<!-- <div class="container-fluid pt-4 px-4"> -->
					
					<table class="table table-hover">
						
						<thead>
							<tr>
								<th scope="col">회원 번호</th>
								<th scope="col">회원 등급</th>
								<th scope="col">회원 id</th>
								<th scope="col">이름</th>
								<th scope="col">전화번호</th>
								<th scope="col">Email</th>
							</tr>
						</thead>
	
						<tbody>
							
							<c:forEach var="vo" items="${noticeList}" varStatus="status">
							<tr>
								<td>${staus.count }</td>
								<td>${vo.grade }</td>
								<td>${vo.subject }</td>
								<td>${vo.id }</td>
								<td>${vo.name }</td>
								<td>${vo.phone }</td>
								<td>${vo.email }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
			
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:if test="${startPage>1}">
								<li class="page-item disabled">
									<a href="../adminpage/notice_list.do?page=${startPage-1 }">&laquo;이전</a>
								</li>
							</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<li ${i==curpage?"class=current":""}>
										<a href="../adminpage/notice_list.do?page=${i }">${i }</a>
									</li>
								</c:forEach>
							<c:if test="${endPage<totalpage }">
								<li><a href="../adminpage/notice_list.do?page=${endPage+1}">다음&raquo;</a></li>
							</c:if>
						</ul>
					</nav>
		</div>
	</div>
</body>
</html>