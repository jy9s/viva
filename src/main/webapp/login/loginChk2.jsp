<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("UserNum") == null){
    String returnUrl = request.getRequestURI();
    if(request.getQueryString() != null){
        returnUrl += "?" + request.getQueryString();
    }
    response.sendRedirect(
        "loginFrm.jsp?returnUrl=" +
        java.net.URLEncoder.encode(returnUrl, "UTF-8"));
    return;
}
%>
