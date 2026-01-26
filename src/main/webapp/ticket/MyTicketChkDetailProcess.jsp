<%@page import="ticket.MyTicketDTO"%>
<%@page import="ticket.MyTicketService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Integer memberNumObj = (Integer) session.getAttribute("UserNum");
String ticketNumStr = request.getParameter("ticketNum");

if(memberNumObj == null || ticketNumStr == null || ticketNumStr.trim().equals("")){
    response.setStatus(401);
    return;
}

int ticketNum = 0;
try {
    ticketNum = Integer.parseInt(ticketNumStr);
} catch(NumberFormatException e){
    response.setStatus(400);
    return;
}

int memberNum = memberNumObj;
MyTicketService service = MyTicketService.getInstance();
MyTicketDTO t = service.searchTicketDetail(memberNum, ticketNum);

if(t == null){
    response.setStatus(404);
    return;
}

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

out.print("{");
out.print("\"ticketNum\":" + t.getTicketNum() + ",");
out.print("\"adultTicket\":\"" + t.getAdultTicket() + "\",");
out.print("\"adultCount\":" + t.getAdultCount() + ",");
out.print("\"teenTicket\":\"" + t.getTeenTicket() + "\",");
out.print("\"teenCount\":" + t.getTeenCount() + ",");
out.print("\"childTicket\":\"" + t.getChildTicket() + "\",");
out.print("\"childCount\":" + t.getChildCount() + ",");
out.print("\"payMethod\":\"" + t.getPayMethod() + "\",");
out.print("\"useDate\":\"" + (t.getUseDate() != null ? sdf.format(t.getUseDate()) : "") + "\",");
out.print("\"tResDate\":\"" + (t.gettResDate() != null ? sdf.format(t.gettResDate()) : "") + "\",");
out.print("\"qrCode\":\"" + t.getQrCode() + "\"");
out.print("}");
%>