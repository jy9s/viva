<%@page import="kr.co.viva.login.SearchService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String birth = request.getParameter("birth"); 
String tel   = request.getParameter("tel"); 

SearchService ss = new SearchService();
String foundId = null;

try{
    foundId = ss.findId(birth, tel);
}catch(Exception e){
    foundId = null;
}

if(foundId != null){
    response.sendRedirect("findIdResult.jsp?id=" + java.net.URLEncoder.encode(foundId, "UTF-8"));
    return;
} else {
%>
<script>
  alert("일치하는 회원정보가 없습니다.");
  history.back();
</script>
<%
}
%>
