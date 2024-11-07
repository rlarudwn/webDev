<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
    $('.Ttname').click(function() {
    	let rtname = $(this).text().trim();
        $.ajax({
            type: 'post',
            url: '../movie/theaterinfo2.do',
            data: { "rtname": rtname },
            success: function(result) {
                $('#rtname').text(rtname)
            },
            error: function(request, status, error) {
                console.log(error)
            }
        })
    })

})
</script>
</head>
<body>
<table class="table" id="mtnametable">
      <c:forEach var="tvo" items="${tnList }">
			<tr  class="dataTname" data-tloc="${tvo.tname }">
			<th> 영화관&nbsp;선택</th>
			<td class="Ttname">${tvo.tname }</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>