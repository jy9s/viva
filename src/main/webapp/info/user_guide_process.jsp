<%@page import="kr.co.viva.operate.OperateServiceDTO"%>
<%@page import="kr.co.viva.operate.OperateService"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/siteproperty.jsp" %>
	
<%
  String date = request.getParameter("Date");
	
  OperateService os = OperateService.getInstance();
  
  List<OperateServiceDTO> list = os.searchAtrraction(date);
  
  if(list==null){
%>
	
	<c:redirect url="${CommonURL}/fragments/detail-empty.jsp"/>	  
<%	  
	return;
  }//end if
 	

  JSONArray OperDataObjArr = new JSONArray();
  JSONObject OperDataObj= null;
  
  for(int i=0; i<list.size(); i++){
	  OperateServiceDTO osDTO = list.get(i);
	  OperDataObj = new JSONObject();
	  OperDataObj.put("num",osDTO.getAttracNum());
	  OperDataObj.put("name",osDTO.getAttracName());
	  OperDataObj.put("preview",osDTO.getAttracPreview());
	  
	  
	  OperDataObjArr.add(OperDataObj);
	  
  }//end for
  
  
  
  	String OperDataArrStr =OperDataObjArr.toJSONString();
	out.print(OperDataArrStr);
	

  			
	

%>
