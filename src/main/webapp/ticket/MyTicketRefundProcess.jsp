<%@page import="org.json.simple.JSONObject"%>
<%@page import="ticket.MyTicketDTO"%>
<%@page import="ticket.MyTicketService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
request.setCharacterEncoding("UTF-8");

Integer memberNumObj = (Integer) session.getAttribute("UserNum");
String ticketNumStr = request.getParameter("ticketNum");

if(memberNumObj == null || ticketNumStr == null || ticketNumStr.trim().equals("")){
    response.setStatus(400);
    return;
}

int ticketNum = 0;
try {
    ticketNum = Integer.parseInt(ticketNumStr);
} catch(NumberFormatException e){
    response.setStatus(400);
    return;
}
boolean flag = false;
MyTicketService service = MyTicketService.getInstance();
flag = service.refundTicket(ticketNum);
System.out.println(flag);

JSONObject jsonObj = new JSONObject();

jsonObj.put("flag", flag);

out.print(jsonObj);
%>