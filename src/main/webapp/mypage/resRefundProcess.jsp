<%@page import="kr.co.viva.reserveHistory.ReserveHistoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
try{
	
String temp = request.getParameter("refundNum");
int num = Integer.parseInt(temp);

ReserveHistoryService rhs = ReserveHistoryService.getInstance();
boolean flag = rhs.modifyRefundState(num);

String url= flag?"http://localhost/html_prj/viva/mypage/ReserveHistory.jsp":"http://localhost/html_prj/viva/inquiry/successMsg.jsp?type=4";

pageContext.setAttribute("url", url);

}catch(NumberFormatException nfe){
}


%>
<c:redirect url="${url }"/>