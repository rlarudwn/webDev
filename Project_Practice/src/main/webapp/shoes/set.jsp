<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.container-fluid {
	margin-top: 10px;
	margin-left: 150px;
	margin-right: 150px;
}

.row {
	margin: 0 auto;
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.list_img-hover {
	border: 1px solid gray;
}

.item-hover {
	border: 1px solid gray;
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
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="la.jpg" alt="Los Angeles">
			</div>

			<div class="item">
				<img src="chicago.jpg" alt="Chicago">
			</div>

			<div class="item">
				<img src="ny.jpg" alt="New York">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span>
		</a>
	</div>
</body>
</html>