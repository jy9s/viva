<%@page import="kr.co.viva.modifyInfo.ModifyInfoService"%>
<%@page import="kr.co.viva.modifyInfo.ModifyInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/siteproperty.jsp" %>
<%
	
ModifyInfoDTO miDTO = new ModifyInfoDTO();
String id= request.getParameter("user_id");
String birth= request.getParameter("birth");
String tel= request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
String email= request.getParameter("email1")+"@"+request.getParameter("email2");
String zipcodeStr= request.getParameter("zipcode");
int zipCode=0;
try{
zipCode= Integer.parseInt(zipcodeStr);
}catch(NumberFormatException nfe){
	
}

String addr= request.getParameter("addr");
String addrDetail= request.getParameter("addrDetail");

miDTO.setId(id);
miDTO.setBirth(birth);
miDTO.setTel(tel);
miDTO.setEmail(email);
miDTO.setZipCode(zipCode);
miDTO.setAddr(addr);
miDTO.setAddrDetail(addrDetail);





ModifyInfoService mis = ModifyInfoService.getInstance();

boolean flag =false;
flag = mis.modifyInfo(miDTO);

String url = flag?"/mypage/Mypage.jsp":"/mypage/Mypage.jsp";

pageContext.setAttribute("url", url);
%>
<c:redirect url="${CommonURL}${url}"/>