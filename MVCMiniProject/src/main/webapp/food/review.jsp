<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.rating {
	display: inline-block;
	position: relative;
	height: 25px;
	line-height: 25px;
	font-size: 25px;
}

.rating label {
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	cursor: pointer;
}

.rating label:last-child {
	position: static;
}

.rating label:nth-child(1) {
	z-index: 5;
}

.rating label:nth-child(2) {
	z-index: 4;
}

.rating label:nth-child(3) {
	z-index: 3;
}

.rating label:nth-child(4) {
	z-index: 2;
}

.rating label:nth-child(5) {
	z-index: 1;
}

.rating label input {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
}

.rating label .icon {
	float: left;
	color: transparent;
}

.rating label:last-child .icon {
	color: #000;
}

.rating:not(:hover) label input:checked ~ .icon, .rating:hover label:hover input 
	 ~ .icon {
	color: #c7b900;
}

.rating label input:focus:not(:checked) ~ .icon:last-child {
	color: #000;
	text-shadow: 0 0 5px #09f;
}
</style>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
	$("input:radio[name='radioButton']").on("change", function() {
		let test = $(this).attr('data-no');
		$('#rating').html('<img src="../food/'+test+'.png" style="width:100%">');
	});
	$(':radio').change(function() {
		console.log('New star rating: ' + this.value);
	});
</script>
</head>
<body>

	<!-- partial -->
	<div class="wrapper_row3">
		<main class="container clear">
			<div class="brow">
				<h2 class="sectiontitle">글쓰기</h2>
				<form action="../board/insert_ok.do" method="post">
					<table class="table">
						<tr>
							<th width="15%" class="text-center">이름</th>
							<td width="85%">
								<span>${sessionScope.name}</span>
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-center">가게명</th>
							<td width="85%">
								<span>${fvo.name}</span>
							</td>
						</tr>
						<tr>
							<th width="15%" class="text-center">내용</th>
							<td rowspan="2" width="85%">
								<textarea rows="10" cols="60" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<td id="rating">
							</td>
						</tr>
						<tr>
							<td>
								<div class="rating">
									<label>
										<input class="stars" type="radio" name="stars" value="1" data-no="1"/>
										<span class="icon">★</span>
									</label>
									<label>
										<input class="stars" type="radio" name="stars" value="2" data-no="2"/>
										<span class="icon">★</span> <span class="icon">★</span>
									</label>
									<label>
										<input class="stars" type="radio" name="stars" value="3" data-no="3"/>
										<span class="icon">★</span> <span class="icon">★</span> <span class="icon">★</span>
									</label>
									<label>
										<input class="stars" type="radio" name="stars" value="4" data-no="4"/>
										<span class="icon">★</span> <span class="icon">★</span> <span class="icon">★</span> <span class="icon">★</span>
									</label>
									<label>
										<input class="stars" type="radio" name="stars" value="5" data-no="5"/>
										<span class="icon">★</span> <span class="icon">★</span> <span class="icon">★</span> <span class="icon">★</span> <span class="icon">★</span>
									</label>
								</div>
							</td>
							<td colspan="1" class="text-right">
								<input type="submit" class="btn btn-info" value="작성">
								<a href="../board/list.do" class="btn btn-danger">취소</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</main>
	</div>
</body>
</html>