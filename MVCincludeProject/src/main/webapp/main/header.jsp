<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">MVC</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="../main/main.do">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
						맛집 <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">맛집 검색</a></li>
					</ul></li>
				<li><a href="../goods/list.do">스토어</a></li>
				<li><a href="../music/list.do">뮤직</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h3>Navbar With Dropdown</h3>
		<p>This example adds a dropdown menu for the "Page 1" button in the navigation bar.</p>
	</div>
</body>
</html>