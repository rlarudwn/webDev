<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../book/bookstyle.css">
<style type="text/css">
.page-line {
	padding: 40px;
	background-color: #FFFFFF;
	border-radius: 24px;
	margin: 20px auto;
	max-width: 1200px;
}

body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

.book-list {
	display: flex;
	flex-direction: column;
	gap: 20px;
	padding: 40px;
	background-color: #f9f9f9;
	border-radius: 24px;
}

.book-item {
	display: flex;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #fff;
	padding: 15px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	height: auto; /* Dynamic height for each book item */
	box-sizing: border-box;
	position: relative;
}

.book-cover {
	flex-shrink: 0;
	width: 120px;
	height: 160px;
	margin-right: 20px;
	overflow: hidden;
}

.book-cover img {
	width: 100%;
	height: 100%;
	border-radius: 4px;
	border: 0.5px solid #ddd;
}

.book-info {
	flex: 1;
	text-align: start;
	margin-left: 15px;
}

.book-title {
	font-size: 1.2em;
	margin: 0;
	color: #333;
}

.book-author, .book-genre {
	margin: 2px 0;
	color: #666;
	font-size: 12px;
}

.book-price {
	color: #E53935;
	font-weight: bold;
	margin-bottom: 10px;
}

.book-price .discount {
	font-size: 0.8em; /* 할인 부분의 폰트 크기를 줄임 */
	color: #E53935; /* 할인 부분의 색상을 조정 (선택 사항) */
	margin-top: 5px; /* 상단 여백 추가 */
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</script>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="page-line" style="margin-top: 150px;">
				<h2 style="color: black; margin-top: -50px; margin-bottom: 40px; text-align: center;">추천 도서</h2>
				<div class="book-list">
					<div class="container">
						<div class="row" style="margin-top: 20px">
							<div class="most-popular2">
								<div class="featured-games2 rounded-box">
									<div class="heading-section">
										<span style="font-weight: bold; font-size: 25px; color: #979797;">&emsp;#
											&nbsp;장바구니에 담은 도서 연관 추천</span>
									</div>
									<div class="row" style="justify-content: center; height: 420px;">
										<div class="col-lg-10" style="width: 900px; height: 500px;">
											<h1>
												<br>
											</h1>
											<div class="owl-features owl-carousel">
												<c:forEach var="vo" items="${cRList}">
													<div class="item">
														<div class="thumb">
															<a href="../book/cookie.do?bno=${vo.bno }"
																class="thumb-link"> <img src="${vo.cover }" alt=""
																style="width: 200px; height: 280px;">
															</a> <span
																style="font-size: 15px; font-weight: bold; width: 200px; height: 80px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
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
						</div>
					</div>
					<div class="container">
						<div class="row" style="margin-top: 20px">
							<div class="most-popular2">
								<div class="featured-games2 rounded-box">
									<div class="heading-section">
										<span style="font-weight: bold; font-size: 25px; color: #979797;">&emsp;#
											&nbsp;구입한 도서 연관 추천</span>
									</div>
									<div class="row" style="justify-content: center; height: 420px;">
										<div class="col-lg-10" style="width: 900px; height: 500px;">
											<h1>
												<br>
											</h1>
											<div class="owl-features owl-carousel">
												<c:forEach var="vo" items="${bRList}">
													<div class="item">
														<div class="thumb">
															<a href="../book/cookie.do?bno=${vo.bno }"
																class="thumb-link"> <img src="${vo.cover }" alt=""
																style="width: 200px; height: 280px;">
															</a> <span
																style="font-size: 15px; font-weight: bold; width: 200px; height: 80px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
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
						</div>
					</div>
					<div class="container">
						<div class="row" style="margin-top: 20px">
							<div class="most-popular2">
								<div class="featured-games2 rounded-box">
									<div class="heading-section">
										<span style="font-weight: bold; font-size: 25px; color: #979797;">&emsp;#
											&nbsp;랜덤 도서 추천</span>
									</div>
									<div class="row" style="justify-content: center; height: 420px;">
										<div class="col-lg-10" style="width: 900px; height: 500px;">
											<h1>
												<br>
											</h1>
											<div class="owl-features owl-carousel" style="margin-left:5px">
												<c:forEach var="vo" items="${rRList}">
													<div class="item">
														<div class="thumb">
															<a href="../book/cookie.do?bno=${vo.bno }"
																class="thumb-link"> <img src="${vo.cover }" alt=""
																style="width: 200px; height: 280px;">
															</a> <span
																style="font-size: 15px; font-weight: bold; width: 200px; height: 80px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="recent-books-container">
        <div class="recent-books-header" onclick="toggleRecentBooks()">
            <h4>최근 본 도서</h4>
            <span class="toggle-icon">+</span>
        </div>
        <div class="recent-books-content">
            <ul>
                <c:forEach var="vo" items="${sessionScope.recentBooks}">
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