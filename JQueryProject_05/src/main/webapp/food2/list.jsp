<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
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
$(function() {
	$.ajax({
		type:'post',
		url:'food.do',
		success:function(result){
			let json=JSON.parse(result)
			foodPrint(json)
		}
	})
	
	$('#prev').click(function() {
		let no=$(this).attr('data-type')
		let cPage=$('#cpage').text()
		let curPage=parseInt(cpage)
		if(curPage>1){
			curPage--
			console.log(curPage)
			$.ajax({
				type:'post',
				url:'food.do',
				data:{
					'type':no,
					'page':curPage
				},success:function(result){
					let json=JSON.parse(result)
					foodPrint(json)
				}
			})
		}
	})
	
	$('#next').click(function() {
		let no=$(this).attr('data-type')
		let cPage=$('#cpage').text()
		let tPage=$('#tpage').text()
		let curPage=parseInt(cPage)
		let totalPage=parseInt(tPage)
		if(curPage<totalPage){
			curPage++
			$.ajax({
					type:'post',
					url:'food.do',
					data:{
						'type':no,
						'page':curPage
					},success:function(result){
						let json=JSON.parse(result)
						foodPrint(json)
				}
			})
		}
	})
})	
function change(no) {
	$.ajax({
		type:'post', 
		url:'food.do',
		data:{
			'type':no
		},
		success:function(result){
			let json=JSON.parse(result)
			foodPrint(json)
		}
	})
	
}
function foodPrint(json) {
	$('#cpage').text(json[0].curPage)
	$('#tpage').text(json[0].totalPage)
	//console.log(json)
	let html=''
	json.map((food)=>{
		html+='<div class="col-sm-3">'
					+'<a href="#">'
					+'<div class="thumbnail">'
					+'<img src="'+food.poster+'" style="width: 100%">'
					+'<p class="a">'+food.name+'</p>'
					+'</div>'
					+'</a>'
					+'</div>'
	})
	$('#prev').attr('data-type', json[0].type)
	$('#next').attr('data-type', json[0].type)
	$('#print').html(html)
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="text-center">
				<input type="button" class="btn btn-sm btn-danger typeBtn" value="한식" onclick="change(1)">
				<input type="button" class="btn btn-sm btn-info typeBtn" value="중식" onclick="change(2)">
				<input type="button" class="btn btn-sm btn-primary typeBtn" value="양식" onclick="change(3)">
				<input type="button" class="btn btn-sm btn-default typeBtn" value="일식" onclick="change(4)">
				<input type="button" class="btn btn-sm btn-success typeBtn" value="분식" onclick="change(5)">
			</div>
		</div>
		<div style="height: 10px;"></div>
		<div class="row" id="print"></div>
		<div style="height: 10px;"></div>
		<div class="row">
			<div class="text-center">
				<input type="button" class="btn btn-sm btn-primary" value="이전" id="prev" data-type="">
				<span id="cpage"></span>page/<span id="tpage"></span>page
				<input type="button" class="btn btn-sm btn-warning" value="다음" id="next" data-type="">
			</div>
		</div>
	</div>
</body>
</html>