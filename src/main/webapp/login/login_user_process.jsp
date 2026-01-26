<%@page import="kr.co.viva.login.UserDTO"%>
<%@page import="kr.co.viva.login.LoginUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
if(!"POST".equals(request.getMethod())){
%>
<c:redirect url="../index.html"/>
<%	
}
%>

<%
LoginUserService logService = LoginUserService.getInstance();
String id = request.getParameter("id");
String pass = request.getParameter("password");


UserDTO uDTO = logService.searchUser(id, pass);


if(uDTO.getId()!=null){
	session.setAttribute("UserId", uDTO.getId());
	session.setAttribute("UserName", uDTO.getName());
	session.setAttribute("UserNum", uDTO.getUserNum());
	
	//세션 인터벌 60*60초(1시간) 지정.
	session.setMaxInactiveInterval(60*60);
%>

<!--  로그인 성공하면 갈 페이지 입니다. -->
<c:redirect url="${CommonURL}/main/mainPg_Include.jsp"/>
<%
}
%>
<script type="text/javascript">
//로그인 실패시 갈 페이지
alert("아이디와 비밀번호를 확인해주세요");
window.location.href = "../index.html";
</script>
