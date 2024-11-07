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
	<h3 class="text-primary">
		<i class="fa fa-hashtag me-2"></i>회원관리
	</h3>

	<div class="content">
		<div class="container-fluid pt-4 px-4">
			<div class="col-sm-12">
				<div class="bg-light rounded h-100 p-4">
					<h6 class="mb-4">회원 목록</h6>
					
					<table class="table table-hover">
						
						<thead>
							<tr>
								<th scope="col" width="10%">번호</th>
								<th scope="col" width="55%">제목</th>
								<th scope="col" width="10%">작성자</th>
								<th scope="col" width="15%">작성일</th>
								<th scope="col" width="10%">조회수</th>
							</tr>
						</thead>
	
						<tbody>
							<c:set var="count" value="${count }"/>
							<c:forEach var="vo" items="${noticeList}">	
							<tr>
								<td>${vo.no }</td>
								<td><a href="../notice/detail.do?=${vo.no }">[${vo.notice_type}]${vo.subject }</a></td>
								<td>${vo.name }</td>
								<td>${vo.dbday }</td>
								<td>${vo.hit}</td>
							</tr>							
							<c:set var="count" value="${count-1 }"/>
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
		</div>
	</div>
</body>
</html>