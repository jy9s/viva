<%@page import="kr.co.viva.inquiry.InquiryDTO"%>
<%@page import="kr.co.viva.inquiry.InquiryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/siteproperty.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

InquiryService is = InquiryService.getInstance();
InquiryDTO iDTO = new InquiryDTO();
String id =String.valueOf(session.getAttribute("UserId"));
int num = is.searchMemberNum(id);
String title = request.getParameter("title");
String msg = request.getParameter("msg");
String url="";
iDTO.setTitle(title);
iDTO.setMemberNum(num);
iDTO.setMsg(msg);
if(is.addInquiry(iDTO)){
	url="/inquiry/successMsg.jsp?type=1";
}else{
	url="/inquiry/successMsg.jsp?type=4";
};


pageContext.setAttribute("url", url);
%>
<c:redirect url= "${CommonURL}${url}"/>
