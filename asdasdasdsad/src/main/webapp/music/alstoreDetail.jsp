<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style type="text/css">
li {
	color: white !important;
	font-size: 20px !important;
}

.sp {
	/*  	margin-top: 10px !important;
	margin-bottom: 10px !important; */
	float: left !important;
}

.sl {
	/*  	margin-top: 10px !important;
	margin-bottom: 10px !important; */
	text-align: right !important; /* 오른쪽 정렬 */
	color: black !important;
}

.db {
	height: 230px !important;
	text-align: center !important; /* 전체 리스트를 가운데 정렬 */
}
.black{
	color: black !important;
}
.img{
	width: 1115px;
}
</style>
</head>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="page-content">

				<!-- ***** Banner Start ***** -->
				<div class="row">
					<div class="col-lg-12">
						<div class="gaming-library profile-library">
							<div class="row">

								<div class="col-lg-4">
									<img src="${vo.aphoto}" alt="" style="border-radius: 23px;">
								</div>

								<div class="col-lg-8">
									<div class="heading-section">
										<h3 class="black">${vo.aname }</h3>
									</div><br>
									<div class="item">
										<ul>
											<li><span class="sp">아티스트</span></li>
											<li></li>
											<li></li>
											<li></li>
											<li class="black"> ${vo.aartist }</li>
										</ul>
									</div>
									<div class="item">
										<ul>
											<li><span class="sp">발매일</span></li> 
											<li></li>
											<li></li>
											<li></li>
											<li class="black">${vo.aldate }</li>
										</ul>
									</div>
									<div class="item">
										<ul>
											<li><span class="sp">정가</span></li> 
											<li class="black">${vo.aprice}</li>
											<li></li>
											<li><span class="sp">할인가</span></li> 
											<li class="black">${vo.adisprice}</li>
										</ul>
									</div>
									<div class="item last-item">
										<ul>
											<li><span class="sp">평점</span></li> 
											<li class="black">${vo.arating }</li>
										</ul>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- ***** Banner End ***** -->

				<!-- ***** Gaming Library Start ***** -->
				<div class="gaming-library profile-library">
					<div class="col-lg-12">
						<div class="heading-section">
							<h3 class="black">${vo.aname }</h3>
						</div>
						<br><br>
						<div class="item">
								<h4 class="black">음반 소개</h4><br>
							<table>	
								<tr>					
								<td class="black">${vo.aintro}</td>
								</tr>
							</table>
						</div>
						<div class="item">
							<div>
							<h4 class="black">음반 사양</h4><br>
								<table>	
								<tr>					
								<td class="white">${vo.adetail}</td>
								</tr>
							</table>
							</div>
						</div>
						
							<div class="item last-item">
									<h4 class="black">상세 이미지</h4><br>
							    <ul>
							        <c:if test="${vo.aimg != null}">
							            <li><img class="img" src="${vo.aimg}" alt=""></li>
							        </c:if>
							        <c:if test="${vo.aimg == null }">
							        	<li></li>
							        </c:if>
							    </ul>
							</div>

					</div>
				</div>
				<!-- ***** Gaming Library End ***** -->
			</div>
		</div>
	</div>
</div>


<!-- Scripts -->
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<script src="assets/js/isotope.min.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/tabs.js"></script>
<script src="assets/js/popup.js"></script>
<script src="assets/js/custom.js"></script>


</body>

</html>
