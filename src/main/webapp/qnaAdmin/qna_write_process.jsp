<%--page directive --%>
<%@page import="qna.AdminQnaDTO"%>
<%@page import="qna.AdminQnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>

<%
if(!"POST".equals(request.getMethod())){
%>
<c:redirect url="../index.html"/>
<%	
}
%>


<% 
request.setCharacterEncoding("UTF-8");

String reply = request.getParameter("reply").trim();
String num = request.getParameter("inquiryNum");
String currentPage = request.getParameter("currentPage");
String field = request.getParameter("field");
String keyword = request.getParameter("keyword");


int inquiryNum = 0;
if(num!=null && !num.isEmpty())
{
	inquiryNum=Integer.parseInt(num);
}

pageContext.setAttribute("num", num);
pageContext.setAttribute("reply", reply);
pageContext.setAttribute("currentPage",currentPage);
pageContext.setAttribute("field",field);
pageContext.setAttribute("keyword",keyword);




%>
<script type="text/javascript">
<c:choose>
<c:when test="${empty num}">
alert("글을 먼저 선택해주세요");
history.back();
</c:when>

<c:when test="${empty reply}">
alert("답변을 입력해주세요.");
history.back();
</c:when>

<c:when test="${reply eq '<br>'}">
alert("답변을 입력해주세요.");
history.back();
</c:when>

<c:otherwise>

<%
AdminQnaService qService = AdminQnaService.getInstance();
boolean flag = qService.modifyQna(inquiryNum, reply);
pageContext.setAttribute("flag", flag);
%>

<c:if test="${flag}">
alert("답변 완료")
location.href="qna.jsp?currentPage=${currentPage}&field=${field}&keyword=${keyword}";
</c:if>

</c:otherwise>

</c:choose>

</script>

