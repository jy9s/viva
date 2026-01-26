<%@page import="java.util.Date"%>
<%@page import="kr.co.viva.login.JoinDTO"%>
<%@page import="kr.co.viva.login.JoinService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/siteproperty.jsp" %>

<%
	
JoinDTO jDTO = new JoinDTO();
String id= request.getParameter("user_id");
String pass= request.getParameter("user_pw");
String name= request.getParameter("user_name");
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

jDTO.setId(id);
jDTO.setPass(pass);
jDTO.setName(name);
jDTO.setBirth(birth);
jDTO.setTel(tel);
jDTO.setEmail(email);
jDTO.setZipCode(zipCode);
jDTO.setAddr(addr);
jDTO.setAddrDetail(addrDetail);



JoinService js = JoinService.getInstance();



boolean flag =false;
flag = js.addMember(jDTO);

pageContext.setAttribute("isSuccess", flag);
    pageContext.setAttribute("userName", name); // 이름도 따로 저장
%>

<c:choose>
    <c:when test="${isSuccess}">
        <%-- 성공 시: 파라미터를 안전하게 포함하여 리다이렉트 --%>
        <c:url var="welcomeUrl" value="${CommonURL}/login/join_Welcome_css.jsp">
            <c:param name="name" value="${userName}" />
        </c:url>
        <c:redirect url="${welcomeUrl}" />
    </c:when>
    <c:otherwise>
        <%-- 실패 시 --%>
        <c:redirect url="${CommonURL}/ghjg.jsp" />
    </c:otherwise>
</c:choose>