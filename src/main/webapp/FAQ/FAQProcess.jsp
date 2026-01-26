<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.viva.faq.FaqDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.viva.faq.RangeDTO"%>
<%@page import="kr.co.viva.faq.FaqService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
			FaqService fs = FaqService.getInstance();
			RangeDTO rDTO = new RangeDTO();
			
			
			int pageScale = fs.pageScale();
			
			int currentPage =1;
			
			int startNum = fs.startNum(currentPage, pageScale);
			int endNum = fs.endNum(startNum, pageScale);
			rDTO.setStartNum(startNum);
			rDTO.setEndNum(endNum);
			rDTO.setUrl("FAQ.jsp");
			String category = request.getParameter("category");
			rDTO.setCategory(category);

			int totalCnt = fs.searchFaqTotalCnt(rDTO);
			int totalPage = fs.totalPage( totalCnt, pageScale);
			rDTO.setTotalPage(totalPage);
			List<FaqDTO> list = new ArrayList<FaqDTO>();
			list = fs.searchFaq(rDTO);
			
			String pagination = fs.pagination(rDTO);
			
			pageContext.setAttribute("faqList", list);
			pageContext.setAttribute("pagination", pagination);
			
			
			 
			JSONObject finalJson = new JSONObject();
			JSONArray jsonArr = new JSONArray();
			for(int i =0; i<list.size();i++){
			JSONObject jsonObj = new JSONObject();
				FaqDTO fDTO = list.get(i);
				jsonObj.put("listNum",i);
				jsonObj.put("category",fDTO.getCategory());
				jsonObj.put("msg",fDTO.getMsg());
				jsonObj.put("num",fDTO.getNum());
				jsonObj.put("title",fDTO.getTitle());
				
				jsonArr.add(jsonObj);
			}
			
			finalJson.put("listSize",list.size());
			finalJson.put("faqList",jsonArr);
			finalJson.put("pagination", pagination);
			
			
			
			out.print(finalJson.toJSONString());
			
			%>