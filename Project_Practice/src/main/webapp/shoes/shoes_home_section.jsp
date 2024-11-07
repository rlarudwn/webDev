<%@page import="com.sist.model.ShoesModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$('.carousel[data-type="multi"] .item').each(function() {
		var next = $(this).next();
		if (!next.length) {
			next = $(this).siblings(':first');
		}
		next.children(':first-child').clone().appendTo($(this));

		for (var i = 0; i < 2; i++) {
			next = next.next();
			if (!next.length) {
				next = $(this).siblings(':first');
			}

			next.children(':first-child').clone().appendTo($(this));
		}
	});
</script>
<style type="text/css">
.product-slider {
	padding: 45px;
}

.product-slider #carousel {
	border: 4px solid #1089c0;
	margin: 0;
}

.product-slider #thumbcarousel {
	margin: 12px 0 0;
	padding: 0 45px;
}

.product-slider #thumbcarousel .item {
	text-align: center;
}

.product-slider #thumbcarousel .item .thumb {
	border: 4px solid #cecece;
	width: 20%;
	margin: 0 2%;
	display: inline-block;
	vertical-align: middle;
	cursor: pointer;
	max-width: 200px;
}

.product-slider #thumbcarousel .item .thumb:hover {
	border-color: #1089c0;
}

.product-slider .item img {
	width: 100%;
	height: auto;
}

.carousel-control {
	color: #0284b8;
	text-align: center;
	text-shadow: none;
	font-size: 30px;
	width: 30px;
	height: 30px;
	line-height: 20px;
	top: 23%;
}

.carousel-control:hover, .carousel-control:focus, .carousel-control:active
	{
	color: #333;
}

.carousel-caption, .carousel-control .fa {
	font: normal normal normal 30px/26px FontAwesome;
}

.carousel-control {
	background-color: rgba(0, 0, 0, 0);
	bottom: auto;
	font-size: 20px;
	left: 0;
	position: absolute;
	top: 30%;
	width: auto;
}

.carousel-control.right, .carousel-control.left {
	background-color: rgba(0, 0, 0, 0);
	background-image: none;
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>
</head>
<body>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<c:forEach var="i" begin="0" end="4">
				<div class="item ${i==0?"active":""}">
					<div class="text-center">
						<a href="shoes_home.do?mode=2&no=${rank[i].no}">
							<img src="${rank[i].poster }" alt="Flower" width="1000px" height="700px">
							<div class="carousel-caption">
								<h3>${rank[i].name }</h3>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<div class="product-slider">

		<div class="clearfix">
			<div id="thumbcarousel" class="carousel slide" data-interval="false">
				<div class="carousel-inner">
					<c:forEach var="i" begin="0" end="2">
						<div class="item ${i==0?"active":""}">
							<c:forEach var="j" begin="0" end="4">
								<div data-target="#carousel" data-slide-to="${i*5+j}" class="thumb">
									<a href="shoes_home.do?mode=2&no=${rank[i*5+j].no}">
										<img src="${rank[i*5+j].poster }">
										<p class="a">${rank[i*5+j].name}</p>
									</a>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				<!-- /carousel-inner -->
				<a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev">
					<i class="fa fa-angle-left" aria-hidden="true"></i> &lt;
				</a>
				<a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next">
					<i class="fa fa-angle-right" aria-hidden="true"></i> &gt;
				</a>
			</div>
			<!-- /thumbcarousel -->

		</div>
	</div>

</body>


</html>