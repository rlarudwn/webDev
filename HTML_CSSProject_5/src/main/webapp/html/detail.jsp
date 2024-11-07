<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%

	// 데이터 가져오기
	// 1. 보내준 값을 받는다
	// http://localhost/HTML_CSSProject_5/html/detail.jsp?no=53
	String no = request.getParameter("no");
	GoodsDAO dao = GoodsDAO.newInstance();
	GoodsVO vo = dao.goodsDetailData(Integer.parseInt(no));
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="table.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script>
		var IMP = window.IMP;
		IMP.init("imp60688173");

		function requestPay() {
			IMP.request_pay({
				pg: "html5_inicis",
				pay_method: "card",
				merchant_uid: "ORD20180131-0000011",   // 주문번호
				name: $('#title').text(),
				amount: $('#price').attr('data-value'),                         // 숫자 타입
				buyer_email: "gildong@gmail.com",
				buyer_name: "홍길동",
				buyer_tel: "010-4242-4242",
				buyer_addr: "서울특별시 강남구 신사동", 
				buyer_postcode: "01181"
			}, function (rsp) { // callback
				$.ajax({
					type: 'POST',
					url: '/verify/' + rsp.imp_uid
				}).done(function (data) {
					if (rsp.paid_amount === data.response.amount) {
						alert("결제 성공");
					} else {
						alert("결제 실패");
					}
				});
			});
		}
	</script>
	<style>
		.table_content {
			margin: 0 auto;
		}

		#image {
			width: 400px;
			height: 400px;
			border-radius: 20px;
		}

		#title {
			font-size: 25px;
			font-weight: bold;
		}

		#sub {
			color: grey;
			text-align: center;
		}

		#percent {
			font-size: 25px;
			color: pink;
			font-weight: bold;
		}

		#price {
			font-size: 25px;
			color: black;
			font-weight: bold;
		}

		#psub {
			font-size: 12px;
			color: #999;
		}

		#star {
			color: orange;
			font-weight: bold;
		}

		.bold {
			font-weight: bold;
		}

		#count {
			color: gray;
		}

		#sel {
			width: 100%;
			height: 40%;
		}

		#cart,
		#buy {
			width: 250px;
			height: 70px;
			border: 2px green solid;
			font-weight: bold;
			border-radius: 10px;
			font-size: 20px;
			box-shadow: 5px 5px 5px #a9a9a9;
		}

		#cart:hover,
		#buy:hover {
			cursor: pointer;
		}

		#cart {
			background-color: white;
			color: green;
		}

		#buy {
			background-color: green;
			color: white;
		}
	</style>
</head>

<body>
	<table class="table_content" width="1000">
		<tr>
			<td width="30%" align="center" rowspan="9">
				<img src="<%=vo.getPoster()%>"
					id="image">
			</td>
			<td colspan="2" class="tdcenter">
				<span id="title">
					<%=vo.getName()%>
				</span>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<span id="sub">
					<%=vo.getSub()%>
				</span>
			</td>
		<tr>
			<td width="60%">
				<span id="percent"><%=vo.getDiscount()%>%</span>&nbsp;
				<span id="price" data-value="<%=vo.getRprice()%>"><%=vo.getFirst_price() %></span>
				<p><del id="psub"><%=vo.getPrice()%></del></p>
			</td>
		</tr>
		</tr>
		<tr>
			<td width="60%">
				<span id="star">★★★★★</span>
				<span id="bold">4.8</span>
				<span id="count">(5)</span>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_delivery3.png" width="20" height="20">
				배송&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="del">무료배송</span>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<img src="https://recipe1.ezmember.co.kr/img/mobile/icon_point.png" width="20" height="20">
				적립&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="del"> 1,595원 적립 (모든 회원 구매액의 0.5% 적립)</span>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<select id="sel">
					<option>옵션선택</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="60%">
				<input type="button" value="장바구니" id="cart">
				<input type="button" value="바로구매" id="buy"
				onclick="requestPay()">
			</td>
		</tr>
	</table>
</body>

</html>