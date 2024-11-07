<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	width: 350px;
}
</style>
<script type="text/javascript">
let index=1
let check=1
function prev() {
	index--
	if(index<1)
		index=5
	let img=document.querySelector('img')
	img.src=index+'.png'
}
let next=()=>{
	index++
	if(index>5)
		index=1
	let img=document.querySelector('img')
	img.src=index+'.png'
}
function auto() {
	setInterval(() => {
		next()
	}, 1000);

}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-center">
						<img src="1.png" style="width: 320px; height: 320px;">
					</td>
				</tr>
				<tr>
					<td class="text-center">
						<input type="button" class="btn btn-sm btn-info" value="이전" onclick="prev()">
						<input type="button" class="btn btn-sm btn-success" value="다음" onclick="next()">
						<input type="button" class="btn btn-sm btn-default" value="자동" onclick="auto()">

					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>