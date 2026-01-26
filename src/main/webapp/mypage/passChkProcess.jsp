<%@page import="kr.co.viva.login.UserDTO"%>
<%@page import="kr.co.viva.login.LoginUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/LoginChk.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

LoginUserService lus = LoginUserService.getInstance();
String pass = request.getParameter("pass");
String id=(String)session.getAttribute("UserId");

UserDTO uDTO = new UserDTO();

uDTO = lus.searchUser(id, pass);


if(uDTO.getId()!=null){
 response.sendRedirect("modifyInfo_Inculde.jsp");	
}else{
	%>
<script>
alert("비밀번호를 확인해주세요.");
history.back();
</script>		
	<%
	}
	%>