<%--page directive --%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="performance.AdminPerformDTO"%>
<%@page import="performance.AdminPerformService"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../fragments/siteProperty.jsp" %>
<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>
<% request.setCharacterEncoding("UTF-8");%>

<%
	
	File saveDir = new File("C:/dev/workspace/viva/src/main/webapp/upload");
	//2. 최대 크기 설정
	int maxSize = 1024*1024*10; //10Mb로 제한
	//업로드 크기를 설정
	int uploadSize = 1024*1024*600;				
	
	//3. FileUpload 객체 (MultipartRequest)를 생성. => 생성 하자마자 업로드 된다.
	MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
	String perfNum = mr.getParameter("perfNum");
	String perfType = mr.getParameter("perfType"); //pDTO.setPerfType(Integer.parseInt(request.getParameter("perfType")));
	String perfLoc = mr.getParameter("perfLoc"); // pDTO.setPerfLoc(Integer.parseInt(request.getParameter("perfLoc")));
	String showTime = mr.getParameter("showTime"); // pDTO.setPerfShowTime(Integer.parseInt(request.getParameter("showTime")));
	String perfPrice = mr.getParameter("perfPrice");
	String perfTitle = mr.getParameter("perfTitle"); // pDTO.setPerfTitle(request.getParameter("perfTitle"));
	String perfSubTitle = mr.getParameter("perfSubTitle"); // pDTO.setPerfSubTitle(request.getParameter("perfSubTitle"));
	String perfStartDate = mr.getParameter("perfStartDate"); // pDTO.setPerfStartDate(java.sql.Date.valueOf(request.getParameter("perfStartDate")));
	String perfEndDate = mr.getParameter("perfEndDate"); //pDTO.setPerfEndDate(java.sql.Date.valueOf(request.getParameter("perfEndDate")));
	String perfTime = mr.getParameter("perfTime"); //pDTO.setPerfTime(request.getParameter("perfTime"));
	String perfPreviewSrc = mr.getParameter("perfPreviewSrc"); //pDTO.setPerfPreview(request.getParameter("perfPreviewSrc"));
	String perfImgSrc = mr.getParameter("perfImgSrc"); //pDTO.setPerfImg(request.getParameter("perfImgSrc"));	
	String typeFlag = mr.getParameter("typeFlag");
	String currentPage = mr.getParameter("currentPage");
	String field = mr.getParameter("field");
	String keyword = mr.getParameter("keyword");
	
	
	String PreviewfileSystemName = mr.getFilesystemName("thumbfile");
	String ImgfileSystemName = mr.getFilesystemName("imgfile");
	
	//파일명은 parameter로 받을 수 없다.
	//String fileName = mr.getParameter("upfile");
	
	//업르도된 파일의 크기를 얻어서, 업로드 가능 크기와 비교한다.
	//파일이 크다면 사용자에게 "에러메시지를 보여준다." 파일을 삭제한다.
	File PreviewCompareFile = new File(saveDir.getAbsolutePath()+"/"+PreviewfileSystemName);
	File ImgCompareFile = new File(saveDir.getAbsolutePath()+"/"+ImgfileSystemName);
	
	boolean sizeFlag=false;
	if(PreviewCompareFile.length()>maxSize){
		PreviewCompareFile.delete();
		sizeFlag = true;
	}
	if(ImgCompareFile.length()>maxSize){
		ImgCompareFile.delete();
		sizeFlag = true;
	}

	AdminPerformDTO pDTO = new AdminPerformDTO();
	
	pDTO.setPerfType(Integer.parseInt(perfType));
	pDTO.setPerfLoc(Integer.parseInt(perfLoc));
	pDTO.setPerfShowTime(Integer.parseInt(showTime));
	pDTO.setPerfPrice(Integer.parseInt(perfPrice));
	pDTO.setPerfTitle(perfTitle);
	pDTO.setPerfSubTitle(perfSubTitle);
	pDTO.setPerfStartDate(java.sql.Date.valueOf(perfStartDate));
	pDTO.setPerfEndDate(java.sql.Date.valueOf(perfEndDate));
	pDTO.setPerfTime(perfTime);
	
	//파일명은 parameter로 받을 수 없다.
	pDTO.setPerfPreview(PreviewfileSystemName==null?perfPreviewSrc:PreviewfileSystemName);
	pDTO.setPerfImg(ImgfileSystemName==null?perfImgSrc:ImgfileSystemName);
	
	
	AdminPerformService pfService = new AdminPerformService();
	int flag = 0;
	
	if(typeFlag.equals("1")){ //수정
		pDTO.setPerfNum(Integer.parseInt(perfNum));
		flag = pfService.modifyPerform(pDTO);
	}else if(typeFlag.equals("2")){ //삭제
		pDTO.setPerfNum(Integer.parseInt(perfNum));
		flag = pfService.removePerform(pDTO.getPerfNum());
	}else if(typeFlag.equals("3")){ //추가 성공하면 3으로 전달.
		flag = pfService.addPerform(pDTO);
	}
	
	
			
	pageContext.setAttribute("flag",flag);
	pageContext.setAttribute("currentPage",currentPage);
	pageContext.setAttribute("field",field);
	pageContext.setAttribute("keyword",keyword);
	
/* 	if(!saveDir.exists()){ 
		saveDir.mkdirs();
	} */
	
%>


<script type="text/javascript">
<c:choose>
<c:when test="${flag eq 1}">

msg="성공적으로 행사를 수정하였습니다.";
alert(msg);

var currentPage = "${currentPage}";
var field = "${field}";
var keyword = "${keyword}";

location.href="perf_schedule.jsp?currentPage=" + currentPage + "&field=" + field + "&keyword=" + keyword;

</c:when>

<c:when test="${flag eq 3}">

msg="성공적으로 행사를 추가하였습니다..";
alert(msg);
location.href="perf_schedule.jsp"

</c:when>

<c:otherwise>
var msg="수정중 문제가 발생했습니다.";
alert(msg);
history.back();
</c:otherwise>
</c:choose>
</script>