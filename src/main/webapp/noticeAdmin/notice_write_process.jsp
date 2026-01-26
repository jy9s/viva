<%@page import="notice.AdminNoticeDTO"%>
<%@page import="notice.AdminNoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>
<%
request.setCharacterEncoding("UTF-8");

String currentPage = (String)request.getParameter("currentPage");
String keyword = (String)request.getParameter("keyword");
String field = (String)request.getParameter("field");

String category = (String)request.getParameter("fieldType");
pageContext.setAttribute("currentPage", currentPage);
pageContext.setAttribute("keyword", keyword);
String intro = (String)request.getParameter("intro");
String title = (String)request.getParameter("title");


pageContext.setAttribute("field", field);

String serviceFlag = (String)request.getParameter("flag");
String num= (String)request.getParameter("num");

int tempNum = 0;
if(num!=null && !num.isEmpty()){
	try{
	tempNum = Integer.parseInt(num);
	}catch(NumberFormatException nfe){
	}
}



boolean deleteFlag = false;
boolean addFlag= false;
boolean modifyFlag = false;
AdminNoticeService nService = AdminNoticeService.getInstance();
AdminNoticeDTO nDTO = new AdminNoticeDTO();
String adminId = (String)session.getAttribute("AdminId");
nDTO.setAdminName("파피");
if(adminId.equals("bibi")){
	nDTO.setAdminName("비비");
}

if(serviceFlag.equals("3")){ //delete
	deleteFlag = nService.removeNotice(tempNum);	
}else{

nDTO.setNoticeNum(tempNum);
nDTO.setNoticeTitle(title);
nDTO.setNoticMsg(intro);
nDTO.setNoticeType(category);
}


pageContext.setAttribute("nDTO", nDTO);
pageContext.setAttribute("deleteFlag", deleteFlag);

%>

<script type="text/javascript">
<c:choose>
	<c:when test="${deleteFlag}">
	alert("내용을 삭제하였습니다");
	location.href="notice.jsp?currentPage=${currentPage}&field=${field}&keyword=${keyword}";
	</c:when>
	<c:when test="${empty nDTO.noticMsg}">
	alert("내용을 입력해주세요.");
	history.back();
	</c:when>
	<c:when test="${nDTO.noticMsg eq '<br>'}">
	alert("내용을 입력해주세요.");
	history.back();
	</c:when>
	<c:when test="${empty nDTO.noticeTitle}">
	alert("제목을 입력해주세요.");	
	history.back();
	</c:when>
<c:otherwise>
	<%
	if(serviceFlag.equals("1")){
		addFlag = nService.addNotice(nDTO);
	}
	
	if(serviceFlag.equals("2")){
		modifyFlag = nService.modifyNotice(nDTO);
	}
	pageContext.setAttribute("flag", addFlag);
	pageContext.setAttribute("modifyflag", modifyFlag);
	%>
	<c:choose>
	<c:when test="${flag}">
	alert("공지를 작성하였습니다.");
	location.href="notice.jsp";
	</c:when>
	<c:when test="${modifyflag}">
	alert("공지를 수정하였습니다.");
	location.href="notice.jsp?currentPage=${currentPage}&field=${field}&keyword=${keyword}";
	</c:when>
	<c:otherwise>
	alert("문제가 발생했습니다. 잠시 후 다시 시도해주세요.");
	location.href="notice.jsp";
	</c:otherwise>
	</c:choose>
	
</c:otherwise>
</c:choose>
</script>
