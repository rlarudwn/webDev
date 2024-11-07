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
	width: 960px;
}

.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<script type="text/javascript" src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">
let food_list=[]
let startPage=0
let endPage=0
let curPage=0
let totalPage=0
window.onload=()=>{
	axios.get("http://localhost/JavaScriptProject_03/js/food_find_js.do").then(function(response){
		let html=''
		food_list=response.data
		curPage=response.data[0].curPage
		totalPage=response.data[0].totalPage
		startPage=response.data[0].startPage
		endPage=response.data[0].endPage
		food_list.map((vo)=>{
			html+='<div class="col-sm-3">'
					+'<div class="thumbnail">'
					+'<div class="text-center">'
					+'<img src="'+vo.poster+'" style="width:100%" onclick="detail('+vo.fno+')">'
					+'<p class="a">'+ vo.name+'</p>'
					+'</div>'
					+'</div>'
					+'</div>'
		})
	let main=document.querySelector('#poster')
	main.innerHTML=html
	pages='<a href="#" class=btn btn-sm btn-danger>이전</a>'
	+curPage+' page/'+totalPage+'page'
	+'<a href="#" class=btn btn-sm btn-warning>다음</a>'
	let page=document.querySelector('#pages')
	page.innerHTML=pages
	})
}
function imgChange() {
	let html=''
	let page=''
	let addr=document.querySelector("#addr").value
	if(addr.trim()===''){
		alert("검색어를 입력하시오")
		document.querySelector("#addr").focus()
		return
	}
	axios.get("http://localhost/JavaScriptProject_03/js/food_find_js.do", 
			{
		params:{
		page:1,
		addr:addr
			}
		}).then(function(response){
		food_list=response.data
		curPage=response.data[0].curPage
		totalPage=response.data[0].totalPage
		startPage=response.data[0].startPage
		endPage=response.data[0].endPage
		food_list.map((vo)=>{
			html+='<div class="col-sm-3">'
					+'<div class="thumbnail">'
					+'<div class="text-center">'
					+'<img src="'+vo.poster+'" style="width:100%" onclick="detail('+vo.fno+')">'
					+'<p class="a">'+ vo.name+'</p>'
					+'</div>'
					+'</div>'
					+'</div>'
		})
	let main=document.querySelector('#poster')
	main.innerHTML=html
	})
}
function detail(fno){
	axios("http://localhost/JavaScriptProject_03/js/food_detail_js.do", {
		params:{
			fno:fno
		}
	}).then(function(response){
		let dd=response.data
		console.log(dd)
		let div=document.querySelector('#detail')
		div.style.display=''
		document.querySelector('#title').innerHTML=dd.name
		document.querySelector('#score').innerHTML=dd.score
		document.querySelector('#address').innerHTML=dd.address
		document.querySelector('#phone').innerHTML=dd.phone
		document.querySelector('#theme').innerHTML=dd.theme
		document.querySelector('#type').innerHTML=dd.type
		document.querySelector('#image').src=dd.poster
	})
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<input type="text" id="addr" size="20" class="input-sm">
			<input type="button" value="검색" class="btn btn-sm btn-info" onclick="imgChange()">
			<div style="height: 20px;"></div>
			<div class="row">
				<div class="col-sm-8" id="poster"></div>
				<div class="col-sm-4" style="display: none;" id="detail">
					<table class="table">
						<tr>
							<td width="30%" class="text-center" rowspan="6">
								<img src="" style="width: 100%" id="image">
							</td>
							<td colspan="2">
								<h3>
									<span id="title">&nbsp;</span><span style="color: orange;" id="score"></span>
								</h3>
							</td>
						</tr>
						<tr>
							<td width="20%" class="text-center">종류</td>
							<td width="50%" ><span id="type"></span></td>
						</tr>
						<tr>
							<td width="20%" class="text-center">주소</td>
							<td width="50%" ><span id="address"></span></td>
						</tr>
						<tr>
							<td width="20%" class="text-center">전화번호</td>
							<td width="50%" ><span id="phone"></span></td>
						</tr>
						<tr>
							<td width="20%" class="text-center">테마</td>
							<td width="50%" ><span id="theme"></span></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div id="pages"></div>
		</div>
	</div>
</body>
</html>