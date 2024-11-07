<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 관리</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    
    <!-- Tempus Dominus Bootstrap 4 CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.39.0/css/tempusdominus-bootstrap-4.min.css" />

    <!-- jQuery first -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- Then Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Moment.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

   
</head>

<body>
	<div class="container mt-4">
        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>회원관리</h3>

        <div class="content">
            <div class="bg-light rounded p-4">
                <h6 class="mb-4">회원 목록</h6>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col" width="5%" align="center">번호</th>
                                <th scope="col" width="5%" align="center">회원 등급</th>
                                <th scope="col" width="20%" align="center">회원 id</th>
                                <th scope="col" width="10%" align="center">이름</th>
                                <th scope="col" width="20%" align="center">전화번호</th>
                                <th scope="col" width="40%" align="center">Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="vo" items="${memberList}" varStatus="status">
                                <tr>
                                    <td width="5%">${status.count}</td>
                                    <td width="5%">${vo.grade}</td>
                                    <td width="20%">${vo.id}</td>
                                    <td width="10%">${vo.name}</td>
                                    <td width="20%">${vo.phone}</td>
                                    <td width="40%">${vo.email}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:if test="${startPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="../adminpage/member_list.do?page=${startPage-1}">&laquo; 이전</a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                            <li class="page-item ${i == curpage ? 'active' : ''}">
                                <a class="page-link" href="../adminpage/member_list.do?page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${endPage < totalpage}">
                            <li class="page-item">
                                <a class="page-link" href="../adminpage/member_list.do?page=${endPage+1}">다음 &raquo;</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
                
            </div>
        </div>
    </div>
</body>

</html>