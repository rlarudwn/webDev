<%@page import="com.sist.dao.DiaryVO"%>
<%@page import="com.sist.dao.DiaryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="com.sist.dao.DiaryVO">
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
int[] max={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
if(((vo.getYear()%4==0) && (vo.getYear()%100!=0)) || (vo.getYear()%400==0))
	max[2]=29;
request.setCharacterEncoding("UTF-8");
DiaryService dao=DiaryService.newInstance();
dao.diaryUpdate(vo);
if(vo.getDay()>max[vo.getMonth()]||vo.getDay()==0){
%>
<script type="text/javascript">
alert("날짜를 정확히 입력하세요")
history.back()
</script>
<%
}
response.sendRedirect("diary_list.jsp?year="+vo.getYear()+"&month="+vo.getMonth()+"&day="+vo.getDay());
%>