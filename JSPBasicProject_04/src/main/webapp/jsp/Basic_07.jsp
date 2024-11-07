<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int sum = 0, even = 0, odd = 0;
for(int i = 1 ; i <= 100 ; i++){
	if(i%2==0)
		even+=i;
	else
		odd+=i;
	sum+=i;
}
%>
<%="1~100 총합"+sum%>
<br>
<%="1~100 짝수합"+even%>
<br>
<%="1~100 홀수합"+odd%>
</body>
</html>