<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == true}">
    <script>
        alert("탈퇴되었습니다");
        window.location.href = "../main/main.do";
    </script>
</c:if>
<c:if test="${result == false}">
    <script>
        alert("비밀번호가 틀립니다.");
        history.back();
    </script>
</c:if>
