<%@page import="kr.co.viva.payHistory.payHistoryDTO"%>
<%@page import="kr.co.viva.payHistory.payHistoryService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%

payHistoryService rhs = payHistoryService.getInstance();

payHistoryDTO rdDTO = new payHistoryDTO();
int num= Integer.parseInt(String.valueOf(request.getParameter("num")));
rdDTO = rhs.searchPayDetail(num);

JSONObject jsonObj = new JSONObject();
String ins =rdDTO.getInstallment()==0?"일시불":rdDTO.getInstallment()+"개월";
//2.JSONObject에 응답할 값을 설정
jsonObj.put("tName", rdDTO.gettName());
jsonObj.put("payDate",rdDTO.getPayDate() );
jsonObj.put("adultCnt", rdDTO.getAdultCnt());
jsonObj.put("teenCnt", rdDTO.getTeenagerCnt());
jsonObj.put("kidsCnt", rdDTO.getKidsCnt());
jsonObj.put("price", rdDTO.getPrice());
jsonObj.put("installment", ins);


//3.JSONObject을 출력
out.print(jsonObj.toJSONString());
%>