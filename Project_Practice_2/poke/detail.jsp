<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td rowspan="6">
						<img src="${detail.poster}">
					</td>
					<th class="text-center" width="15%" style="vertical-align: middle;">도감번호</th>
					<td width="35%" style="vertical-align: middle;">${detail.pno}</td>
					<th class="text-center" width="15%" style="vertical-align: middle;">좋아요</th>
					<td width="35%" style="vertical-align: middle;">${detail.like}</td>
				</tr>
				<tr>
					<th class="text-center" width="15%" style="vertical-align: middle;">이름</th>
					<td width="35%" style="vertical-align: middle;">${detail.name}<br>
						<c:if test="${detail.form!=null}">
							<small style="color: gray;">${detail.form }</small>
						</c:if>
					</td>
					<th class="text-center" width="15%" style="vertical-align: middle;">좋아요</th>
					<td width="35%" style="vertical-align: middle;">
						<c:if test="${sessionScope.id!=null}">
							<c:choose>
								<c:when test="${check}">
									<a href="../poke/unlike.do?no=${detail.no}">
										<img src="../image/like_on.png" width="35" height="30">
									</a>
								</c:when>
								<c:otherwise>
									<a href="../poke/like.do?no=${detail.no}">
										<img src="../image/like_off.png" width="35" height="30">
									</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
				</tr>
				<tr>
					<th class="text-center" style="vertical-align: middle;">타입</th>
					<td style="vertical-align: middle;">
						<img height="30" width="30" src="../image/${detail.type1}.png">${detail.type1}<c:if test="${detail.type2!=null}"> / <img height="30" width="30" src="../image/${detail.type2}.png">${detail.type2}</c:if>
					</td>
					<th class="text-center" style="vertical-align: middle;">세대</th>
					<td style="vertical-align: middle;">${detail.gen}세대</td>
				</tr>
				<tr>
					<th class="text-center" style="vertical-align: middle;">무게</th>
					<td style="vertical-align: middle;">${detail.weight }</td>
					<th class="text-center" style="vertical-align: middle;">키</th>
					<td style="vertical-align: middle;">${detail.height }</td>
				</tr>
				<tr>
					<th class="text-center" style="vertical-align: middle;">분류</th>
					<td style="vertical-align: middle;">${detail.species}</td>
					<th class="text-center" style="vertical-align: middle;">특성</th>
					<td style="vertical-align: middle;">${detail.ability1}<c:if test="${detail.ability2!=null}">
							<br>${detail.ability2}</c:if>
					</td>
				</tr>
				<tr>
					<th class="text-center" style="vertical-align: middle;">설명</th>
					<td colspan="3" style="vertical-align: middle;">${detail.comm}</td>
				</tr>
				<tr>
					<td colspan="5" class="text-right">
						<a href="javascript:history.back()" class="btn btn-sm btn-info">목록</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>