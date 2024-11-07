<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../movie/mstyle.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<style>
    .form-group{
    	width:210px !important ;
    }
     .datepicker-days td.day-sat {
        color: blue !important; 
    }
    .datepicker-days td.day-sun {
        color: red !important; 
    }
    .datepicker-days td.active {
        font-weight:bold;
        color: white !important;
    }
    .datepicker-days td.active:hover {
        font-weight:bold;
        color: white !important;
    }
</style>
<script type="text/javascript">
$(function() {
    $('#calendar').datepicker({
        format: 'yyyy-mm-dd',
        startDate: '2024-08-25', 
        endDate: '2024-08-31', 
        autoclose: true,
        showOtherMonths: true,
        selectOtherMonths: true,
        beforeShowDay: function(date) {
            
        	 var day = date.getDay();
             if (day === 0) { 
                 return { classes: 'day-sun' };
             }
             if (day === 6) { 
                 return { classes: 'day-sat' };
             }
             return;
        }
    }).on('changeDate', function(e) {
        let rdate = e.format('yyyy-mm-dd')
        $('#rdate').text(rdate)
        $.ajax({
    		type:'post',
    		url: '../movie/dateinfo.do',
    		data:{"rdate":rdate},
    		success:function(result)
    		{
    			$('#moviecalendar').html(result)
    		},
    		error:function(request,status,error)
    		{
    			console.log(error)
    		}
    	   })
    	   
  $(function(){
		$.ajax({
			type:'post',
			url:'../movie/timetableinfo.do',
			data: {"rdate":rdate},
			success:function(result)
			{
				console.log("success")
			},
			error:function(request,status,error)
			{
				console.log(error)
			}
		})
	})
   })
})
</script>
</head>
<body>
    <div class="container">
        <div class="form-group">
            <input type="text" class="form-control" id="calendar" placeholder="날짜 선택">
        </div>
    </div>
</body>
</html>
