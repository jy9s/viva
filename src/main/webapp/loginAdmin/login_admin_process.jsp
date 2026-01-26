<%@page import="login.AdminAdminDTO"%>
<%@page import="login.LoginService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../fragments/siteProperty.jsp" %>

<%


if(!"POST".equals(request.getMethod())){
%>
<c:redirect url="../index.html"/>
<%

	
}
%>

<%


LoginService logService = LoginService.getInstance();
String id = request.getParameter("id");
String pass = request.getParameter("password");



AdminAdminDTO aDTO = logService.searchAdmin(id, pass);


if(aDTO.getAdminId()!=null){
	session.setAttribute("AdminId", aDTO.getAdminId());
	session.setAttribute("AdminName", aDTO.getAdminName());
	
	//세션 인터벌 60*60초(1시간) 지정.
	session.setMaxInactiveInterval(60*60);
%>
<c:redirect url="../dashboardAdmin/dashboard.jsp"/>
<%
}
%>
<script type="text/javascript">
alert("아이디와 비밀번호를 확인해주세요");
window.location.href = "../index.html";
</script>
