<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.viva.reserveHistory.ReserveHistoryService"%>
<%@page import="kr.co.viva.reserveHistory.ReserveDetailDTO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
ReserveHistoryService rhs = ReserveHistoryService.getInstance();

ReserveDetailDTO rdDTO = new ReserveDetailDTO();
int num= Integer.parseInt(String.valueOf(request.getParameter("num")));
rdDTO = rhs.searchReserveDetail(num);

JSONObject jsonObj = new JSONObject();

//2.JSONObject에 응답할 값을 설정
jsonObj.put("reserveName", rdDTO.getReserveName());
jsonObj.put("title", rdDTO.getTitle());
jsonObj.put("perfDate",new SimpleDateFormat("yyyy-MM-dd").format(rdDTO.getPerfDate()) );
jsonObj.put("personCnt", rdDTO.getPersonCnt());
jsonObj.put("resDate", new SimpleDateFormat("yyyy-MM-dd").format(rdDTO.getResDate()));
jsonObj.put("loc", rdDTO.getLocStr());
jsonObj.put("resNum", rdDTO.getResNum());
jsonObj.put("state", rdDTO.getState());
jsonObj.put("payDate", new SimpleDateFormat("yyyy-MM-dd").format(rdDTO.getPayDate()));
jsonObj.put("payNum", rdDTO.getPayNum());
jsonObj.put("agency", rdDTO.getPayAgency());
jsonObj.put("price", rdDTO.getPayPrice());
jsonObj.put("installment", rdDTO.getInstallmentStr());


//3.JSONObject을 출력
out.print(jsonObj.toJSONString());
%>