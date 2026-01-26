<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List" %>
<%@page import="ticket.MyTicketService" %>
<%@page import="ticket.MyTicketDTO" %>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
Integer memberNumObj = (Integer) session.getAttribute("UserNum");
if(memberNumObj == null){
    response.setStatus(401);
    out.print("{\"error\":\"LOGIN_REQUIRED\"}");
    return;
}
int memberNum = memberNumObj;

MyTicketService service = MyTicketService.getInstance();
List<MyTicketDTO> list = service.searchTicket(memberNum);

JSONArray jsonArr = new JSONArray();
for(MyTicketDTO t : list){
    JSONObject jsonObj = new JSONObject();
    jsonObj.put("ticketNum", t.getTicketNum());
    jsonObj.put("ticketName", t.getAdultTicket()); // JS에서 ticketName 사용
    jsonObj.put("adultTicket", t.getAdultTicket());
    jsonObj.put("adultCount", t.getAdultCount());
    jsonObj.put("teenTicket", t.getTeenTicket());
    jsonObj.put("teenCount", t.getTeenCount());
    jsonObj.put("childTicket", t.getChildTicket());
    jsonObj.put("childCount", t.getChildCount());
    jsonObj.put("payMethod", t.getPayMethod());
    jsonObj.put("useDate", String.valueOf(t.getUseDate()));
    jsonArr.add(jsonObj);
}
out.print(jsonArr.toJSONString());
%>