<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/LoginChk.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% session.removeAttribute("UserId"); %>

<c:redirect url="${CommonURL}/login/loginPg_Include.jsp" />