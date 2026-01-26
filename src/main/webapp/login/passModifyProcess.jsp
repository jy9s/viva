<%@page import="kr.co.viva.login.SearchService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String id = (String)session.getAttribute("verifiedId");
if(id == null){
%>
<script>
  alert("인증 후 이용 가능합니다.");
  location.href="passInfoChk.jsp";
</script>
<%
  return;
}

String newPass = request.getParameter("newPass");
String newPassChk = request.getParameter("newPassChk");

if(newPass == null || newPassChk == null || newPass.trim().isEmpty() || newPassChk.trim().isEmpty()){
%>
<script>
  alert("비밀번호를 모두 입력해주세요.");
  history.back();
</script>
<%
  return;
}

if(!newPass.equals(newPassChk)){
%>
<script>
  alert("비밀번호가 일치하지 않습니다.");
  history.back();
</script>
<%
  return;
}

if(newPass.length() < 5){
%>
<script>
  alert("비밀번호는 최소 5자 이상이어야 합니다.");
  history.back();
</script>
<%
  return;
}

SearchService ss = new SearchService();
boolean ok = false;

try{
    ok = ss.changePassword(id, newPass);
}catch(Exception e){
    ok = false;
}

if(ok){
    session.removeAttribute("verifiedId");
%>
<script>
  alert("비밀번호가 변경되었습니다.");
  location.href="loginFrm.jsp";
</script>
<%
} else {
%>
<script>
  alert("비밀번호 변경 실패");
  history.back();
</script>
<%
}
%>
    