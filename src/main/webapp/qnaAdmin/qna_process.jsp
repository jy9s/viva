<%--page directive --%>
<%@page import="qna.AdminQnaDTO"%>
<%@page import="qna.AdminQnaService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>

<%


//1. JSONObject 생성
JSONObject jsonObj= new JSONObject();

//2. 값을 할당
String num = request.getParameter("num");
int inquiryNum=Integer.parseInt(num);

AdminQnaService qService = AdminQnaService.getInstance();

AdminQnaDTO qDTO = qService.searchOneQna(inquiryNum);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

if (qDTO == null) {
    jsonObj.put("error", "no data");
    out.print(jsonObj.toJSONString());
    return;
}


jsonObj.put("num", inquiryNum);
jsonObj.put("title", qDTO.getInquiryTitle());
jsonObj.put("email", qDTO.getMemberEmail());
jsonObj.put("id", qDTO.getMemberName());
jsonObj.put("msg", qDTO.getInquiryMsg());
jsonObj.put("msg2", qDTO.getInquiryReturn());
jsonObj.put("date", sdf.format(qDTO.getInquiryDate()));

//3. 출력
//out.print(jsonObj);
out.print(jsonObj.toJSONString());

%>