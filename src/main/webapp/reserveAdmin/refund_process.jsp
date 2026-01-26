<%--page directive --%>
<%@page import="reserve.AdminReserveService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>
<%

request.setCharacterEncoding("UTF-8");

String num = request.getParameter("resNum");
String type = request.getParameter("type");
String resType = null;
boolean flag = false;

if(num.equals("") || num!=null){
	try{
	int resNum = Integer.parseInt(num);
	if(type.equals("ticket")){
		resType = "ticket_reserve";
	}else if(type.equals("perf")){
		resType = "perf_reserve";	
	}
	AdminReserveService arService = AdminReserveService.getInstance();
	int payNum = arService.searchPayInfo(resNum, resType);
	flag = arService.refundReserve(payNum, resType);
	
	}catch(NumberFormatException nfe){
	}catch(NullPointerException nf){
	}
}

String currentPage = request.getParameter("currentPage");
String field = request.getParameter("field");
String keyword = request.getParameter("keyword");



pageContext.setAttribute("flag", flag);
pageContext.setAttribute("resType", resType);
pageContext.setAttribute("currentPage",currentPage);
pageContext.setAttribute("field",field);
pageContext.setAttribute("keyword",keyword);

%>



<script type="text/javascript">
<c:choose>
<c:when test="${flag eq true}">

msg="성공적으로 환불 하였습니다.";
alert(msg);
//여기서부터 다시
var resType = "${resType}";
var currentPage = "${currentPage}";
var field = "${field}";
var keyword = "${keyword}";

location.href= resType+".jsp?currentPage=" + currentPage + "&field=" + field + "&keyword=" + keyword;

</c:when>

<c:otherwise>
var msg="환불에 실패하였습니다.";
alert(msg);
history.back();

</c:otherwise>
</c:choose>
</script>




