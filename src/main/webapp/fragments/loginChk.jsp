<%--page directive --%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("AdminId");

if(id==null){

%>
<script type="text/javascript">
alert("다시 로그인 해주세요.");
window.location.href = "../index.html";
</script>

<%
}
%>	