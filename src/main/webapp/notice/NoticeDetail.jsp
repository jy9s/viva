<%@page import="kr.co.viva.notice.NoticeDTO"%>
<%@page import="kr.co.viva.notice.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/siteproperty.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>
<!-- bootstrap cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
<!-- 2024 경주월드 -->
<script src="https://www.gjw.co.kr/inc/gjw_2024/js/14jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.js?ver=1763706557">
<link rel="stylesheet"
	href="https://www.gjw.co.kr/css/gjw_2024/reset.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/css/gjw_2024/sub.css?ver=1763706557">
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>
</head>
<body>
	<div class="wrap">
		<!-- 헤더 -->
		<div id="closetop"></div>
		<div id="header">
			<jsp:include page="../include/header.jsp"></jsp:include>
		</div>
		<!-- 햄버거 메뉴-->
		<jsp:include page="../include/hamberger.jsp"></jsp:include>

		<!-- 메인 공간(비어있는 흰 배경 영역) -->
		<div class="container">
		
		<%
		NoticeService ns = NoticeService.getInstance();
		
		try{
		int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		
		Object obj = session.getAttribute("board"+noticeNum);
		 
		if(obj == null){
		boolean flag = ns.modifyCnt(noticeNum);
		}
		
		NoticeDTO nDTO = ns.searchNoticeDetail(noticeNum);


		session.setAttribute("board"+noticeNum, true );
		
		pageContext.setAttribute("nDTO", nDTO);
		}catch(NumberFormatException nfe){
		}
		
		%>
		<jsp:include page="../include/page_navi.jsp"></jsp:include>
		<div>
			<h1 style="text-align: center; margin: 50px;">공지사항</h1>
		</div>
		<div style="max-width:1000px; margin: 0px auto;">
		<strong>${nDTO.title }</strong><br>
		<span style="font-size: 10px; color:#A0A0A0;">${nDTO.category} &nbsp; |&nbsp; ${nDTO.inputDate }</span>
		<img src="${CommonURL }/images/hr.png"/>		
		</div>
		<div style="max-width:1000px; margin: 0px auto; display:flex; justify-content: center;">
		${nDTO.msg}
		</div>
		
		</div>
		<!-- container 끝 -->

		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
