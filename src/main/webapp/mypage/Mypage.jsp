<%@page import="kr.co.viva.mypage.MypageDTO"%>
<%@page import="kr.co.viva.mypage.MypageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ include file="../include/siteproperty.jsp" %>
<%@ include file="../include/LoginChk.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>
<link rel = "shortcut icon" href="${CommonURL}/img/farvicon.png">
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
<style type="text/css">
/* 전체 컨테이너 설정: 세 개의 열을 가로로 정렬 */
.my-page-container {
    display: flex;
    justify-content: space-around; /* 또는 space-between, center 등 */
    width: 100%;
    max-width: 800px; /* 전체 너비 제한 */
    margin: 50px auto; /* 중앙 배치 및 상하 여백 */
}

/* 각 섹션 (열) 설정 */
.section-column {
    display: flex;
    flex-direction: column; /* 섹션 내의 요소(제목과 버튼)를 세로로 정렬 */
    align-items: center; /* 섹션 내의 내용을 가로 중앙에 정렬 */
    text-align: center;
    padding: 0 10px;
}

/* 섹션 제목 스타일 */
.section-column h3 {
    font-size: 1.1em;
    font-weight: bold;
    color: #333;
    margin-bottom: 25px; /* 버튼과의 간격 */
}

/* 버튼 스타일 */
.btn-item {
    /* 버튼 기본 스타일 */
    width: 120px;
    padding: 10px 0;
    margin-bottom: 10px; /* 버튼 간의 세로 간격 */
    
    /* 텍스트 스타일 */
    font-size: 0.9em;
    color: #555;
    
    /* 테두리 및 배경 */
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.2s;
}

/* 마우스 오버 시 효과 (선택 사항) */
.btn-item:hover {
    background-color: #eee;
}
</style>
</head>
<body>
	<div class="wrap">
		<!-- 헤더 -->
		<div id="closetop" class="close"></div>
		<div id="header">
			<jsp:include page="../include/header.jsp"></jsp:include>
		</div>
		<!-- 햄버거 메뉴-->
		<jsp:include page="../include/hamberger.jsp"></jsp:include>

		<!-- 메인 공간(비어있는 흰 배경 영역) -->
		<div class="container">
		<div style="margin:0px auto; width:1000px; display: flex; justify-content: center; margin-top: 30px;" >
		<h2 style="align-content: center; margin-top:150px;">마이페이지</h2>
		</div>
		<div style="margin:0px auto; width:1000px; display: flex; justify-content: center; margin-top: 30px;"><img src="${CommonURL}/images/hr.png"/>
		</div>
		<div style="margin:0px auto; width:1000px; display: flex; justify-content: center; margin-top: 30px;">
		<img src="../images/mypage_profile.png"/>
		</div>
		<%
		MypageService ms = MypageService.getInstance();
		MypageDTO mDTO = new MypageDTO();
		String id = String.valueOf( session.getAttribute("UserId"));
		mDTO = ms.searchMemberName(id);
		session.setAttribute("num", mDTO.getNum());
		
		pageContext.setAttribute("mDTO", mDTO);
		%>
		<div style="margin:0px auto; width:1000px; display: flex; justify-content: center; margin-top: 30px;">
		<span style="font-size: 25px; font-weight: bold;">${mDTO.name } 님</span>
		</div>
		<div class="my-page-container">
    <div class="section-column">
        <h3>나의 예매</h3>
        <button class="btn-item" onclick="location.href='${CommonURL}/ticket/MyticketCheck.jsp'">나의 티켓</button>
        <button class="btn-item" onclick="location.href='${CommonURL}/mypage/payhistory.jsp'">티켓 내역</button>
    </div>

    <div class="section-column">
        <h3>나의 활동</h3>
        <button class="btn-item" onclick="location.href='${CommonURL}/inquiry/InquiryHistory.jsp'">문의 내역</button>
        <button class="btn-item" onclick="location.href='${CommonURL}/mypage/ReserveHistory.jsp'">공연 내역</button>
    </div>

    <div class="section-column">
        <h3>내 정보</h3>
        <button class="btn-item" onclick="location.href='${CommonURL}/mypage/MypagePassCheck.jsp'">내 정보 변경</button>
        <button class="btn-item" onclick="location.href='${CommonURL}/mypage/MypageWithdrawCheck.jsp'">회원 탈퇴</button>
    </div>
</div>
		</div>
		<!-- container 끝 -->

		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
