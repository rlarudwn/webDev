<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result=true}"></c:if>
<c:if test="${result=false}"></c:if>
<script>
alert('비밀번호가 틀립니다')
history.back()
</script>