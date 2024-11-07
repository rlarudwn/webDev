<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 800px;
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	$.ajax({
		type:'post',
		url:'type.do',
		success:function(result){
			$('#print').html(result)
		}
	})
	$('.typeBtn').on('click', function() {
		let no=$(this).attr('data-type')
		$.ajax({
			type:'post',
			url:'type.do',
			data:{
				"type":no
			},
			success:function(result){
				$('#print').html(result)
			}
		})
	})
})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<button class="btn btn-sm btn-default typeBtn" data-type="1">한식</button>
				<button class="btn btn-sm btn-danger typeBtn" data-type="2">중식</button>
				<button class="btn btn-sm btn-info typeBtn" data-type="3">양식</button>
				<button class="btn btn-sm btn-success typeBtn" data-type="4">일식</button>
				<button class="btn btn-sm btn-warning typeBtn" data-type="5">분식</button>
			</div>
		</div>
		<div class="text-center">
			<div id="print"></div>
		</div>
		<div class="row">
			<div class="text-center">
				<a class="btn btn-sm btn-info">이전</a>
				${curPage}page/${totalPage}page
				<a class="btn btn-sm btn-info">다음</a>
			</div>
		</div>
	</div>
</body>
</html>