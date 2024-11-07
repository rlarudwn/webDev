<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../movie/mstyle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">
<link rel="stylesheet" href="../assets/css/fontawesome.css">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
        <div class="page-content2">
        <!-- 검색 창 시작 -->
        <div class="search-input2">
            <form method="post" id="search2" action="../movie/moviefind1.do">
            <input type="text" placeholder="영화명 검색" id='searchText' name="ss"  value="${ss}"/>
             <button type="submit" class="fa fa-search" id="i" ></button>
            </form>
        </div>
        <!-- 검색 창 끝 -->
            <!-- ***** 영화목록 메뉴 시작 ***** -->
        <div class="btn2-category-container">
            <a id="listbtnactive" href="../movie/movielist1.do" class="btn2-category">박스오피스</a>
            <a id="listbtn"href="../movie/movielist2.do" class="btn2-category">독립＆예술영화</a>
        </div>
        
        <!-- ***** 영화목록 메뉴 끝 ***** -->
           <!-- ***** 검색 결과 시작 ***** -->
           <div class="container">
           <div class="live-stream2">
                   <div class="row">
                        <c:forEach var="vo" items="${mfList1 }" varStatus="s">
                            <div class="col-md-3">
                                <div class="item">
                                    <div class="thumb">
                                        <a href="#"><img src="https://www.kobis.or.kr${vo.mposter}" alt="${vo.mtitle}"></a>
                                       	  <div class="hover-effect">
                                            <h6 id="hetext"><a href="../movie/moviedetail_before.do?mno=${vo.mno }"><i class="fa fa-eye"></i>&nbsp; 상세보기 &nbsp;</a></h6>
                                          </div>
                                      </div>
                                    <div class="down-content">
                                        <div class="avatar2">
                                            <c:choose>
                                                <c:when test="${vo.mgrade eq '전체관람가'}">
                                                    <img src="https://img.megabox.co.kr/static/pc/images/common/txt/ALL_46x46.png" alt="" >
                                                </c:when>
                                                <c:when test="${vo.mgrade eq '12세이상관람가'}">
                                                    <img src="https://img.megabox.co.kr/static/pc/images/common/txt/12_46x46.png" alt="" >
                                                </c:when>
                                                <c:when test="${vo.mgrade eq '15세이상관람가'}">
                                                    <img src="https://img.megabox.co.kr/static/pc/images/common/txt/15_46x46.png" alt="" >
                                                </c:when>
                                                <c:when test="${vo.mgrade eq '청소년관람불가'}">
                                                    <img src="https://img.megabox.co.kr/static/pc/images/common/txt/19_46x46.png" alt="" >
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <h4 id=text3>${vo.mtitle}</h4>
                                        <h5 id=text4>&emsp;&emsp;개봉일&nbsp;:&nbsp;${vo.mrday}<br></h5>
                                        </div>
                                        
                                        <div class="bokdBtns">
                                        	<c:choose>
                                                <c:when test="${vo.mstate == '1'}">
                                                 <a href="#" title="영화 예매하기"><input type="button" id="bokdBtn1" value="예매"></a>
                                                </c:when>
                                                <c:when test="${vo.mstate == '2'}">
                                                  <a href="#" title="영화 상영예정"><input type="button" id="bokdBtn2" value="상영예정" disabled></a>
                                                </c:when>
                                                <c:when test="${vo.mstate == '3'}">
                                                   <a href="#" title="영화 상영종료"><input type="button" id="bokdBtn3" value="상영종료" disabled></a>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                   </div>
                               </div>
                        </c:forEach>
                    </div>
           		</div>
            <!-- ***** 검색 결과 끝 ***** -->
            <!-- ***** 페이지 나누기 시작*****-->
         <nav>
            <ul class="pagination">
                <c:if test="${curpage > 1}">
                    <li class="page-item"><a class="page-link" href="../movie/moviefind1.do?page=${curpage - 1}&ss=${ss}">&laquo; 이전</a></li>
                </c:if>
                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                    <li class="page-item ${i == curpage ? 'active' : ''}">
                        <a class="page-link" href="../movie/moviefind1.do?page=${i}&ss=${ss}">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${curpage < totalpage}">
                    <li class="page-item"><a class="page-link" href="../movie/moviefind1.do?page=${curpage + 1}&ss=${ss}">다음 &raquo;</a></li>
                </c:if>
            </ul>
        </nav>
      <!-- ***** 페이지 나누기 끝*****-->
      </div>
      </div>
  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  </body>
</html>
