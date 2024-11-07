<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
.btn-info {
    color: #fff;
    background-color: #ffa657;
    border-color: #ffa657;
}
</style>
</head>
<body>
	<div class="col-12">
		<div class="bg-light rounded h-100 p-4">
			<h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>1:1 문의하기</h3>

			<table class=table>
				<tr>
					<td>
					<a href="../replyboard/insert.do" class="btn btn-info rounded-pill m-2">등록</a>
					</td>
				</tr>
			</table>


			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col" width="10%">번호</th>
						<th scope="col" width="40%">제목</th>
						<th scope="col" width="10%">작성자</th>
						<th scope="col" width="15%">작성일</th>
						<th scope="col" width="25%">답변상태</th>
					</tr>
				</thead>
				<tbody>
				<c:set var="count" value="${count }"/>
				<c:forEach var="vo" items="${rbList }">
					<tr>
						<td width="10%" align="center">${vo.no}</td>
						<td width="40%">
							<c:if test="${vo.group_step>0 }">
							&nbsp;&nbsp;
							</c:if>
						${vo.subject }
						</td>
						<td width="10%">${vo.name }</td>
						<td width="15%">${vo.dbday }</td>
						<td width="25%">
							<c:if test="${vo.isreply==0 }">
								<span class="btn btn-info rounded-pill m-2">답변대기</span>	
							</c:if>
							<c:if test="${vo.isreply!=0 }">
								<span style="color:#FF8F0B;">답변완료</span>
							</c:if>
						</td>
					</tr>
					<c:set var="count" value="${count-1 }"/>
					</c:forEach>
				</tbody>
			</table>
			
			<table >
			 <tr class="text-center">
				 <td class="text-center"> 
					       <c:choose>
						    <c:when test="${curpage > 1}">
						        <a href="../replyboard/list.do?page=${curpage - 1}" class="btn btn-sm btn-success">이전</a>
						    </c:when>
						    <c:otherwise>
						        <a href="#" class="btn btn-sm btn-success disabled">이전</a>
						    </c:otherwise>
						</c:choose>
						
						<span class="mx-2">${curpage} page / ${totalpage} pages</span>
						
						<c:choose>
						    <c:when test="${curpage < totalpage}">
						        <a href="../replyboard/list.do?page=${curpage + 1}" class="btn btn-sm btn-info">다음</a>
						    </c:when>
						    <c:otherwise>
						        <a href="#" class="btn btn-sm btn-info disabled">다음</a>
						    </c:otherwise>
						</c:choose>
						
		     		</td>
		     	</tr>
		     </table>
      <!--   
			<nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${startPage > 1}">
						    <li class="page-item">
						        <a class="page-link" href="../adminpage/reply_list.do?page=${startPage-1}">&laquo; 이전</a>
						    </li>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
						    <li class="page-item ${i==curpage?'active':''}">
						        <a class="page-link" href="../adminpage/reply_list.do?page=${i}">${i}</a>
						    </li>
						</c:forEach>
						<c:if test="${endPage < totalpage}">
						    <li class="page-item">
						        <a class="page-link" href="../adminpage/reply_list.do?page=${endPage+1}">다음 &raquo;</a>
						    </li>
						</c:if>
                    </ul>
                </nav>
		-->
			
		</div>
	</div>
</body>
</html>