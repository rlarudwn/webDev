<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper row3">
		<main class="container clear">
			<div class="content">
				<div id="gallery">
					<figure>
						<header class="heading">
							<span style="font-size: 25px; font-weight: bold; color: green;"></span><fmt:formatNumber value="${count }" type="number"/>개의 맛있는 레시피가 있습니다
						</header>
						<ul class="nospace clear">
							<c:forEach var="vo" items="${list}" varStatus="i">
								<li class="one_quarter ${i.index%4==0?'first':''}">
									<a href="../recipe/recipeDetail.do?no=${vo.no}">
										<img src="${vo.poster}" title="${vo.title}">
									</a>
								</li>
							</c:forEach>
						</ul>
					</figure>
				</div>
				<div style="height: 10px;"></div>
				<div class="text-center">
				<a href="../recipe/chefMake.do?page=${curPage>1?curPage-1:curPage}&chef=${chef}" class="btn btn-sm btn-info">이전</a>
				${curPage}page/${totalPage}page
				<a href="../recipe/chefMake.do?page=${curPage<totalPage?curPage+1:curPage}&chef=${chef}" class="btn btn-sm btn-info">다음</a>
				</div>
			</div>
		</main>
	</div>
</body>
</html>