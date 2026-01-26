<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- springflower05      pass05 -->
<c:if test="${empty sessionScope.UserId}">
    <script type="text/javascript">
        alert("로그인이 필요한 서비스입니다.");
        // EL 변수인 ${CommonURL}을 자바스크립트 안에서 그대로 사용할 수 있습니다.
        location.href = "${CommonURL}/login/loginPg_Include.jsp";
    </script>
</c:if>
