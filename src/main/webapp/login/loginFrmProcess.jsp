<%@page import="kr.co.viva.login.SearchDTO"%>
<%@page import="kr.co.viva.login.SearchService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String password = request.getParameter("password");
String returnUrl = request.getParameter("returnUrl");

System.out.println(password);

SearchService service = new SearchService();
SearchDTO user = service.login(id, password); 

if(user == null){
%>
    <script>
        alert("아이디 또는 비밀번호가 올바르지 않습니다.");
        history.back();
    </script>
<%
    return;
}

session.setAttribute("UserId", user.getId());
session.setAttribute("UserName", user.getName());
session.setAttribute("UserNum", user.getMember_num());

if(returnUrl == null || returnUrl.trim().isEmpty()){
    returnUrl = request.getContextPath() + "/index.jsp";
}

response.sendRedirect(returnUrl);
%>
