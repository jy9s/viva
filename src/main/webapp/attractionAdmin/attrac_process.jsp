<%--page directive --%>
<%@page import="attr.AdminAttractionService"%>
<%@page import="attr.AdminAttractionDTO"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>

<%
request.setCharacterEncoding("UTF-8");
//1. 업로드된 파일을 저장할 경로 설정
File saveDir = new File("C:/dev/workspace/viva/src/main/webapp/upload");
//2. 최대 크기 설정
int maxSize = 1024 * 1024 * 10; //10Mb로 제한
//업로드 크기를 설정
int uploadSize = 1024 * 1024 * 600;

//3. FileUpload 객체 (MultipartRequest)를 생성. => 생성 하자마자 업로드 된다.
MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8",
		new DefaultFileRenamePolicy());

String uploader = mr.getParameter("uploader");
String[] ageArr = mr.getParameterValues("age");

String attrNum = mr.getParameter("attrNum");
String attrName = mr.getParameter("attrName"); 
String attrStartDate = mr.getParameter("attrStartDate");
String attrEndDate = mr.getParameter("attrEndDate");


String type = mr.getParameter("type"); 
String attrExplain = mr.getParameter("attrExplain"); 
String minHeight = mr.getParameter("minHeight");

String maxHeight = mr.getParameter("maxHeight"); 

String thumbImg = mr.getParameter("thumbImg"); 
String prevImg = mr.getParameter("prevImg"); 
String prevImg2 = mr.getParameter("prevImg2"); 

String img1Name = mr.getFilesystemName("img1");
String img2Name = mr.getFilesystemName("img2");
String img3Name = mr.getFilesystemName("img3");

//파일명은 parameter로 받을 수 없다.
//				String fileName = mr.getParameter("upfile");

//업르도된 파일의 크기를 얻어서, 업로드 가능 크기와 비교한다.
//파일이 크다면 사용자에게 "에러메시지를 보여준다." 파일을 삭제한다.
File compareFile1 = new File(saveDir.getAbsolutePath() + "/" + img1Name);
File compareFile2 = new File(saveDir.getAbsolutePath() + "/" + img2Name);
File compareFile3 = new File(saveDir.getAbsolutePath() + "/" + img3Name);

boolean img1Flag = false;
if (compareFile1.length() > maxSize) {
	compareFile1.delete();
	img1Flag = true;
}
boolean img2Flag = false;
if (compareFile2.length() > maxSize) {
	compareFile2.delete();
	img2Flag = true;
}
boolean img3Flag = false;
if (compareFile3.length() > maxSize) {
	compareFile3.delete();
	img3Flag = true;
}
boolean flag = img1Flag && img2Flag && img3Flag;


AdminAttractionDTO aDTO = new AdminAttractionDTO();

int num = 0;
if(attrNum!=null && !attrNum.trim().isEmpty()){
	try{
	num = Integer.parseInt(attrNum);
	}catch(NumberFormatException nfe){
		num = 1;
	}
}
aDTO.setAttrNum(num);
aDTO.setAttrName(attrName);
aDTO.setAttrExplain(attrExplain);

String state="N";
if(type.equals("attr2")){
	state="Y";	
}


aDTO.setAttrState(state);


String attrHeight = minHeight.substring(3)+"cm~"+maxHeight.substring(3)+"cm";
aDTO.setAttrHeight(attrHeight);


aDTO.setAttrStrDate(attrStartDate);
aDTO.setAttrEndDate(attrEndDate);

aDTO.setAttrMain(img1Name==null? thumbImg:img1Name);
aDTO.setAttrPrev(img2Name==null? prevImg:img2Name);
aDTO.setAttrPrev2(img3Name==null? prevImg2:img3Name);

AdminAttractionService aService = AdminAttractionService.getInstance();

boolean updateFlag = aService.modifyOperate(aDTO);

pageContext.setAttribute("flag", flag);
pageContext.setAttribute("updateFlag", updateFlag);


String date = mr.getParameter("date");
String keyword = mr.getParameter("keyword");
pageContext.setAttribute("date", date);
pageContext.setAttribute("keyword", keyword);

/* if(!saveDir.exists()){ 
	saveDir.mkdirs();
}

 */
%>
<script type="text/javascript">
<c:choose>
	<c:when test="${flag}">
	alert(파일 용량을 초과했습니다.);
	history.back();
	</c:when>
	
	<c:when test="${updateFlag}">
	
	var date = "${date}";
	var keyword = "${keyword}";

	alert("놀이기구 일정을 변경하였습니다.");
	location.href="attrac_schedule.jsp?date=" + date + "&keyword=" + keyword;
	</c:when>
	
	<c:otherwise>
	</c:otherwise>
</c:choose>
</script>