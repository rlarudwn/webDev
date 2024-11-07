<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.times').click(function(){
		let time=$(this).val();
		let tdname = $(this).siblings('input[type="hidden"]').val();
		$.ajax({
			type:'post',
			url:'../movie/timetableinfo.do',
			data: { "time": time, "tdname": tdname },
			success:function(result)
			{
				$('#movietdname').text(tdname)
				$('#movietimedata').html(result)
				$('#rtime').val(time)
				$('#rtdname').val(tdname)
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
})
</script>
</head>
<body>
<table class="table">
  <tr class="text-center">
  <c:forEach var="msvo" items="${ttList }">
  	<td>${msvo.tdname }</td>
  	<td>
  	<input type="hidden" class="times" value="${msvo.tdname }">
    <input type="button" class="times" style="margin-top: 5px;margin-left: 5px" value="${msvo.mstime}">
 	</td>
  </c:forEach>
   </tr>
  </table>
</body>
</html>