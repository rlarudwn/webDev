<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
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

.book-actions {
	width: 140px;
	height: 32px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-left: 20px;
	margin-top: 10px;
}

.book-actions button {
	border: none;
	border-radius: 4px;
	padding: 8px 12px;
	margin-bottom: 8px;
	cursor: pointer;
	font-size: 12px;
}

.book-actions select {
	padding: 8px;
	border-radius: 4px;
	border: 1px solid #ddd;
	margin-bottom: 8px;
}

.book-actions .account-control {
	display: flex;
	gap: 5px;
	justify-content: center;
	margin: 0 0 0 0;
}

.account-control button {
	width: 30px;
	height: 30px;
	font-size: 18px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f0f0f0;
	cursor: pointer;
	transition: background-color 0.3s ease;
	display: flex;
	align-items: center;
	justify-content: center;
}

.account-control button:hover {
	background-color: #ddd;
}

.account-control input {
	width: 72px;
	height: 30px;
	text-align: center;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
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

.buttons a.like-button {
	background-color: transparent;
	border: 1px solid #ccc;
	color: #fff;
	width: 140px;
	height: 28px;
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	margin-bottom: 8px;
}

.buttons a.like-button img {
	width: 20px;
	height: 20px;
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
$(document).ready(function() {
    $('.add-to-cart').click(function(event) {
        event.preventDefault()
 
      let id = '${id}'  
        
      if (id.length === 0) {
			alert('해당 기능은 로그인 시 이용하실 수 있습니다')
			return
		}
        
        let bno = $('#bno').val()
        let count = $('#account').val()
        let price = ${vo.sale_price}

        console.log(bno)
        console.log(count)
        console.log(price)
        
        $.ajax({
            type: 'post',
            url: '../book/cart.do',
            data: {
                'tno': bno,
                'price': price,
                'count': count,
                'type': 2 
            },
            success: function(result) {
                alert('장바구니에 추가되었습니다')
            },
            error: function(request, status, error) {
                alert('오류가 발생했습니다')
            }
        })
    })
})
	  $(function() {
		let id = '${id}';

		$('.book-item').each(function() {
			let $item = $(this)
			let bno = $item.find('input[name="bno"]').val()
			let $likeButton = $item.find('.like-button')
			let $likeIcon = $likeButton.find('img')
			let likeCheck = false

			if (id.length > 0) {
				$.ajax({
					type : 'post',
					url : '../like/likeCheck.do',
					data : {
						'tno' : bno,
						'type' : 5
					},
					success : function(result) {
						if (result === 'OK') {
							likeCheck = true
							$likeIcon.attr('src', 'fullheart.png')
						} else {
							likeCheck = false
							$likeIcon.attr('src', 'heart.png')
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
						type : 'post',
						url : '../like/likeOff.do',
						data : {
							'tno' : bno,
							'type' : 5
						},
						success : function(result) {
							if (result >= 0) {
								likeCheck = false
								$likeIcon.attr('src', 'heart.png')
							}
						}
					})
				} else {
					$.ajax({
						type : 'post',
						url : '../like/likeOn.do',
						data : {
							'tno' : bno,
							'type' : 5
						},
						success : function(result) {
							if (result >= 0) {
								likeCheck = true
								$likeIcon.attr('src', 'fullheart.png')
							}
						},
						error : function(request, status, error) {
							alert(error)
						}
					})
				}
			})
		})

		$('.book-item').each(function() {
			let $item = $(this)
			let $increment = $item.find('.increment')
			let $decrement = $item.find('.decrement')
			let $account = $item.find('.account')

			$increment.click(function() {
				let count = parseInt($account.val())
				$account.val(count + 1)
			})

			$decrement.click(function() {
				let count = parseInt($account.val())
				if (count > 1) {
					$account.val(count - 1)
				}
			})
		})
	})
</script>
</head>
<body>
<div class="row">
				<div class="col-lg-12">
	<div class="page-line" style="margin-top: 150px;">
		<h2 style="color: black; margin-top: -50px; margin-bottom: 40px; text-align: center;">베스트셀러</h2>
		<div class="book-list">
			<c:forEach var="vo" items="${tList}">
				<div class="book-item">
					<div class="book-cover">
						<a href="../book/cookie.do?bno=${vo.bno }"> 
						<img height=100%;	src="${vo.cover }" alt="">
						</a>
					</div>
					<div class="book-info">
						<p class="book-genre">${vo.bgenre }</p>
						<a href="../book/cookie.do?bno=${vo.bno }">
							<h2 class="book-title">${vo.btitle }</h2></a>
							<p class="book-author">${vo.writer}${vo.writer != null ? ' 저 | ' : ''}${vo.publisher}&nbsp;|
								${vo.dbday}</p>
							<p class="book-price">
								<fmt:formatNumber value="${vo.sale_price}" type="number" />원
								<c:choose>
									<c:when test="${vo.sale_price < vo.price}">
										<span class="discount"> (<fmt:formatNumber
												maxFractionDigits="0" type="number"
												value="${((vo.price - vo.sale_price) / vo.price * 100)}" />% 할인)
										</span>
									</c:when>
									<c:otherwise>
										<span class="discount">(할인 없음)</span>
									</c:otherwise>
								</c:choose>
							</p>
					</div>
					<input type="hidden" id="bno" name="bno" value="${vo.bno}" />
							<div class="book-actions">
								<div class="buttons">
									<a href="#" class="like-button" data-bno="${vo.bno}"><img
										src="../book/heart.png" alt=""></a>
								</div>
								<div class="account-control">
									<button class="decrement">-</button>
									<input type="text" class="account" value="1">
									<button class="increment">+</button>
								</div>
								<button type="button" class="fa fa-cart-plus add-to-cart"
									style="background-color: #99D9EA;">&nbsp;Add to Cart</button>
								<button type="button" class="fa fa-credit-card"
									style="background-color: #7396EA">&nbsp;Buy Now</button>
							</div>
				</div>
			</c:forEach>
			</div>
			</div>
			</div>
				<ul class="page page-xg">
					<c:if test="${startPage > 1}">
						<li><a href="../book/best.do?page=${startPage-1}">&laquo;
								Previous</a></li>
					</c:if>
					<c:forEach var="t" begin="${startPage}" end="${endPage}">
						<li ${n == curpage ? "class='current'" : ""}><a
							href="../book/best.do?page=${t}">${t}</a></li>
					</c:forEach>
					<c:if test="${endPage < totalpage}">
						<li><a href="../book/best.do?page=${endPage+1}">Next
								&raquo;</a></li>
					</c:if>
				</ul>
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