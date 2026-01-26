<%@page import="kr.co.viva.login.SearchService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String tel = request.getParameter("tel");

SearchService ss = new SearchService();
boolean ok = false;

try {
    ok = ss.verifyForPasswordChange(id, tel);
} catch(Exception e){
    ok = false;
}

if(ok){
    // 인증 통과한 id를 세션에 저장 (권장)
    session.setAttribute("verifiedId", id);

    // 새 비번 입력 페이지로 이동
    response.sendRedirect("passModify.jsp");
    return;
} else {
%>
<script>
  alert("아이디/전화번호가 일치하지 않습니다.");
  history.back();
</script>
<%
}
%>
    