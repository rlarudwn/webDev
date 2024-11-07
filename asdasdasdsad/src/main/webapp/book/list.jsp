<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.*,com.sist.vo.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function toggleRecentBooks() {
    const container = document.querySelector('.recent-books-container');
    const toggleIcon = container.querySelector('.toggle-icon');
    if (container.classList.contains('expanded')) {
        container.classList.remove('expanded');
        toggleIcon.textContent = '+';
    } else {
        container.classList.add('expanded');
        toggleIcon.textContent = '-';
    }
}

$(function() {
    let id = '${id}'
    let bno = $('#bno').val()
    $('.content').each(function() {
    	
        let $item = $(this)
        let bno = $item.find('input[name="bno"]').val()
        let $likeButton = $item.find('.like-button')
        let $likeIcon = $likeButton.find('img')
        let likeCheck = false;

        if (id.length > 0) {
            $.ajax({
                type: 'post',
                url: '../like/likeCheck.do',
                data: {
                    'tno': bno,
                    'type': 5
                },
                success: function(result) {
                    if (result === 'OK') {
                        likeCheck = true
                        $likeIcon.attr('src', '../book/fullheart.png')
                    } else {
                        likeCheck = false
                        $likeIcon.attr('src', '../book/heart.png')
                    }
                }
            })
        }

        $likeButton.click(function(event) {
            if (id.length === 0) {
                alert('해당 기능은 로그인 시 이용하실 수 있습니다')
                return
            }

            event.preventDefault()
            if (likeCheck) {
                $.ajax({
                    type: 'post',
                    url: '../like/likeOff.do',
                    data: {
                        'tno': bno,
                        'type': 5
                    },
                    success: function(result) {
                        if (result >= 0) {
                            likeCheck = false
                            $likeIcon.attr('src', '../book/heart.png')
                        }
                    }
                })
            } else {
                $.ajax({
                    type: 'post',
                    url: '../like/likeOn.do',
                    data: {
                        'tno': bno,
                        'type': 5
                    },
                    success: function(result) {
                        if (result >= 0) {
                            likeCheck = true
                            $likeIcon.attr('src', '../book/fullheart.png')
                        }
                    },
                    error: function(request, status, error) {
                        alert('Error: ' + error)
                    }
                })
            }
        })
    })
})

</script>
<link rel="stylesheet" href="../book/bstyle.css">
<style type="text/css">
.item {
	display: flex;
	flex-direction: column;
	align-items: left;
}

.thumb {
	position: relative;
	overflow: hidden;
}

.thumb img {
	width: 100%;
	height: 100%; 
	border-radius: 23px;
}

.down-content {
	text-align: left;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	padding: 10px; 
}

.down-content p {
  text-align: left;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin: 0; 
}

.live-stream .thumb {
	position: relative;
	overflow: hidden;
	margin-bottom: 0px;
}

.live-stream small {
	font-size: 12px;
	color: #757575;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.search {
	position: relative;
	display: flex; 
	justify-content: flex-end; 
	margin: -30px 30px 20px 0;
}

.search-input {
	background-color: #f5f5f5; 
	width: 300px;
	height: 40px;
	border-radius: 20px;
	border: 1px solid #ccc; 
	color: #666;
	font-size: 14px;
	padding: 0 15px; 
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
}

.search-input input {
	width: calc(100% - 30px); 
	height: 100%;
	border: none;
	outline: none;
	background: transparent; 
	color: #666;
	font-size: 14px;
}

.search-input a {
	position: absolute;
	right: 20px; 
	top: 50%;
	transform: translateY(-50%);
	color: #999;
	cursor: pointer; 
}

.heading-section h3 {
	color: #FFFFFF;
	font-size: 34px;
	text-decoration: none;
	margin-top: -30px;
	margin-bottom: -45px;
}

.page {
	list-style: none;
	padding: 0;
	margin: 20px auto; 
	display: flex;
	justify-content: center; 
	font-family: Arial, sans-serif;
}

.page li {
	margin: 0 3px; 
}

.page a {
	text-decoration: none;
	color: #0197A3; 
	padding: 8px 12px;
	border: 1px solid #0197A3; 
	border-radius: 4px; 
	transition: background-color 0.3s, color 0.3s; 
}

.page a:hover {
	background-color: #0197A3; 
	color: #fff; 
}

.page .current a {
	background-color: #0197A3; 
	color: #fff;
	border: 1px solid #0197A3; 
	pointer-events: none; 
}

.page .current a:hover {
	background-color: #0197A3; 
	color: #fff; 
}

.page li:first-child a {
	border-radius: 4px 0 0 4px;
}

.page li:last-child a {
	border-radius: 0 4px 4px 0;
}
.rounded-box {
    border: 2px solid #ddd; 
    border-radius: 15px; 
    padding: 20px; 
    background-color: #ffffff; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    margin: 0 auto; 
    margin-bottom: 30px;
    margin-right: 25px;
}

.genre-select {
    position: relative;
    display: flex;
    justify-content: flex-end;
    margin-top: -30px; 
	  margin-bottom: -30px;
}

.genre-select select {
    background-color: #f5f5f5;
    border: 1px solid #ccc;
    border-radius: 20px;
    color: #666;
    font-size: 14px;
    padding: 10px 15px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    width: 200px;
    transition: background-color 0.3s, color 0.3s;
}

.genre-select select:focus {
    border-color: #0197A3;
    color: #333;
}

.genre-select label {
    margin-right: 10px;
    font-weight: bold;
    color: #333;
    line-height: 40px;
}
.recent-books-container {
    position: fixed; 
    right: 60px; 
    bottom: 20px; 
    width: 200px; 
    background-color: #ffffff; 
    border: 2px solid #ddd; 
    border-radius: 15px; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    padding: 20px; 
    z-index: 1000; 
    transition: height 0.3s ease, bottom 0.3s ease; 
    overflow: hidden; 
    height: 60px; 
}

.recent-books-header {
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.recent-books-header h4 {
    margin: 0; 
    font-size: 18px; 
    color: #333;
}

.recent-books-content {
    display: flex; 
    flex-wrap: wrap; 
    margin-top: 10px;
}

.recent-books-content ul {
    list-style: none; 
    padding: 0; 
    margin: 0;
    display: flex; 
    flex-wrap: wrap;
}

.recent-books-content li {
    margin: 5px; 
}

.recent-books-content img {
    border-radius: 8px; 
    display: block; 
}

.recent-books-container.expanded {
    padding: 25px;
    height: 250px; 
    bottom: 60px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row" style="margin-top: 150px">
			<div class="most-popular2">
				<div class="search">
					<form action="../book/list.do" method="post" id="searchForm">
						<div class="search-input">
							<input type="text" placeholder="Type Something" id="searchText"
								name="search" onkeypress="handle(event)"/>
							<button type="submit" class="fa fa-search" style="border:none; background:transparent"></button>
						</div>
					</form>
				</div>
				<div class="featured-games2 rounded-box">
					<div class="heading-section">
						<span style="font-weight: bold; font-size: 25px; color: #979797;">&emsp;#
							&nbsp;최신&nbsp;도서</span>
					</div>
					<div class="row" style="height: 420px;">
						<div class="col-lg-1">
							<div class="blank"></div>
						</div>
						<div class="col-lg-10">
							<h3>
								<br>
							</h3>
							<div class="owl-features owl-carousel">
								<c:forEach var="vo" items="${hList}">
									<div class="item">
										<div class="thumb">
											<a href="../book/cookie.do?bno=${vo.bno }" class="thumb-link">
												<img src="${vo.cover }" alt=""
												style="width: 220px; height: 300px;">
											</a> <span
												style="font-size: 15px; font-weight: bold; width: 220px; height: 300px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
												${vo.btitle } <br> <small
												style="color: #979797; font-weight: 250;">${vo.writer }${vo.writer != null ? ' 저 | ' : ''}${vo.publisher }</small>
											</span>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ***** Featured Games End ***** -->
			<div class="row">
				<div class="col-lg-12">
					<div class="page-content" style="margin-top: 0px;">
						<div class="heading-section">
							<h3>Book List</h3>
						</div>
						<div class="genre-select">
							<select id="genre" name="genre"
								onchange="window.location.href=this.value;">
								<option value="#" disabled selected>장르 선택</option>
								<c:forEach var="g" items="${genres}" varStatus="i">
								<option value="../book/list.do?genre=${i.index}">${i.index==0?'전체':g}</option>
								</c:forEach>
							</select>
						</div>
						<div class="live-stream">
							<div class="col-lg-12"></div>
							<div class="row">
								<c:forEach var="vo" items="${bList}" varStatus="i">
									<div class="col-lg-3 col-sm-6" style="text-align: center;">
										<div class="item">
											<div class="thumb">
												<a href="../book/cookie.do?bno=${vo.bno }"
													class="thumb-link"> <img src="${vo.cover }"
													alt="${vo.btitle }" style="width: 200px; height: 250px;">
												</a>
												<div class="hover-effect">
													<div class="content">
														<ul>
															<li><a href="#" class="like-button"> <img
																	src="../book/heart.png"
																	style="width: 18px; height: 18px;"> like
															</a></li>
															<li><a href="#"><i class="fa fa-cart-plus"
																	style="margin-right: 8px;"></i> to cart</a></li>
														</ul>
													</div>
												</div>
											</div>
											<div class="down-content" style="margin-left: 18px;">
												<p>${vo.btitle }</p>
												<small>${vo.writer }${vo.writer != null ? ' 저 | ' : ''}${vo.publisher }</small><br>
												<p>
													<fmt:formatNumber value="${vo.sale_price}" type="number" />
													원
												</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<nav>
				<ul class="page page-lg">
					<c:if test="${startPage > 1}">
						<li><a
							href="../book/list.do?page=${startPage-1}&genre=${genre}&search=${search}">&laquo;
								Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li ${i == curpage ? "class='current'" : ""}><a
							href="../book/list.do?page=${i}&genre=${genre}&search=${search}">${i}</a></li>
					</c:forEach>
					<c:if test="${endPage < totalpage}">
						<li><a
							href="../book/list.do?page=${endPage+1}&genre=${genre}&search=${search}">Next
								&raquo;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<div class="recent-books-container">
    <div class="recent-books-header" onclick="toggleRecentBooks()">
        <h4>최근 본 도서</h4>
        <span class="toggle-icon">+</span>
    </div>
    <div class="recent-books-content">
        <ul>
            <c:forEach var="vo" items="${cList}">
                <li>
                    <figure><a href="../book/cookie.do?bno=${vo.bno}">
                        <img class="radius-10 btmspace-10" src="${vo.cover}" style="width: 60px; height: 80px;"></a>
                    </figure>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
</html>
