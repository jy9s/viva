<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="kr.co.viva.inquiry.InquiryDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.viva.inquiry.RangeDTO"%>
<%@page import="kr.co.viva.inquiry.InquiryService"%>
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
<style>
/* CSS Reset 및 기본 스타일 */

/* 메인 컨테이너 */
.payment-history-container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 50px 20px;
}

/* 1. 제목 및 설명 */
.title-section {
	text-align: center;
	margin-bottom: 30px;
}

.title-section h1 {
	font-size: 28px;
	font-weight: bold;
	color: #1a1a1a;
	margin-bottom: 5px;
}

.title-section p {
	font-size: 14px;
	color: #777;
}

/* 2. 검색 필터 섹션 */
.search-filter-box {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
	margin-bottom: 40px;
}

.filter-group {
margin : 0px auto;
max-width: 800px;
	display: flex;
	align-items: center;
	gap: 10px;
}

/* 기간 버튼 스타일 */
.period-button {
	padding: 8px 15px;
	border: 1px solid #ddd;
	background-color: #fff;
	color: #333;
	cursor: pointer;
	border-radius: 4px;
	font-size: 14px;
	transition: background-color 0.2s, border-color 0.2s;
}

.period-button:hover {
	background-color: #f0f0f0;
}

.period-button.active {
	border-color: #000;
	background-color: #000;
	color: #fff;
}

/* 날짜 입력 스타일 */
.date-input-group {
	display: flex;
	align-items: center;
	gap: 5px;
}

.date-input-group input[type="date"] {
	padding: 8px 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
	width: 110px; /* 너비 조정 */
}
/* 달력 아이콘 표시를 위한 추가 스타일 (옵션) */
.date-input-group span {
	color: #777;
}

/* 검색/초기화 버튼 */
.action-button {
	padding: 8px 15px;
	border: none;
	cursor: pointer;
	border-radius: 4px;
	font-size: 14px;
	margin-left: 10px;
}

.search-button {
	background-color: #000;
	color: #fff;
}

.reset-button {
	background-color: #f0f0f0;
	color: #333;
	border: 1px solid #ddd;
}

/* 달력 아이콘 모양을 위한 대체 <div> */
.calendar-icon {
	border: 1px solid #ddd;
	padding: 8px;
	border-radius: 4px;
	cursor: pointer;
	background-color: #f8f8f8;
	line-height: 1; /* 아이콘 높이 맞추기 */
}

/* 3. 탭 메뉴 */
.tab-menu {
	display: flex;
	gap: 5px;
	margin-bottom: 20px;
}

.tab-button {
	padding: 10px 20px;
	border: 1px solid #ddd;
	background-color: #fff;
	color: #555;
	cursor: pointer;
	border-radius: 4px;
	font-size: 14px;
	transition: background-color 0.2s;
}

.tab-button.active {
	background-color: #000;
	color: #fff;
	border-color: #000;
}

/* 4. 내용 영역 */
.content-area {
	background-color: #fff;
	padding: 20px 0;
	border-top: 1px solid #ccc; /* 탭 아래 구분선 */
	height: auto;
}

.summary-count {
	font-size: 14px;
	font-weight: bold;
	color: #333;
	padding: 0 0 10px 0;
}

.no-data-message {
	text-align: center;
}

.no-data-message p {
	font-size: 16px;
	color: #777;
	margin-top: 20px;
}
/* 이미지 스타일링 */
.no-data-message img {
	width: 120px; /* 이미지 크기 조정 */
	height: auto;
	display: block;
	margin: 0 auto 15px;
}
</style>
<!-- /* 테이블 css */ -->
<style>

.table-container {
	max-width: 1000px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
	overflow: hidden; /* 테이블 경계선 깔끔하게 처리 */
}

/* 테이블 기본 스타일 */
.payment-table {
	width: 100%;
	border-collapse: collapse; /* 셀 경계선 겹치기 */
	font-size: 14px;
	color: #333;
}

/* 테이블 헤더 (<th>) 스타일 */
.payment-table th {
	padding: 15px 10px;
	background-color: #f5f5f7; /* 헤더 배경색 */
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #eee; /* 세로 경계선 */
	font-weight: bold;
	text-align: center;
	color: #555;
	white-space: nowrap; /* 줄바꿈 방지 */
}
/* 마지막 헤더의 오른쪽 경계선 제거 */
.payment-table th:last-child {
	border-right: none;
}

/* 테이블 바디 셀 (<td>) 스타일 */
.payment-table td {
	padding: 18px 10px;
	border-bottom: 1px solid #eee;
	border-right: 1px solid #eee;
	text-align: center; /* 기본 중앙 정렬 */
}
/* 마지막 셀의 오른쪽 경계선 제거 */
.payment-table td:last-child {
	border-right: none;
}

/* 홀수 행 배경색 (선택 사항: 가독성 향상) */
.payment-table tbody tr:nth-child(odd) {
	background-color: #fff;
}
/* 짝수 행 배경색 (이미지에는 없지만, 가독성을 위해 추가) */
.payment-table tbody tr:nth-child(even) {
	background-color: #fcfcfc;
}

/* 테이블 행 호버 효과 (선택 사항) */
.payment-table tbody tr:hover {
	background-color: #f9f9f9;
}

/* -------------------- 특정 컬럼 스타일 -------------------- */

/* 결제일, 인원, 결제 금액 중앙 정렬 */
.payment-table .col-date, .payment-table .col-people, .payment-table .col-amount
	{
	text-align: center;
}

/* 결제명 뱃지 스타일 */
.product-badge {
	display: inline-block;
	padding: 5px 10px;
	background-color: #fff; /* 흰색 배경 */
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 13px;
	font-weight: normal;
	color: #333;
	white-space: nowrap;
}

/* 예매 상태 뱃지 스타일 */
.status-badge {
	display: inline-block;
	padding: 3px 8px;
	border-radius: 12px;
	font-size: 13px;
	font-weight: bold;
}

/* 예매 완료 상태 스타일 */
.status-badge.Y {
	background-color: #e5f1ff; /* 매우 연한 파란색 배경 */
	color: #2a6ce4; /* 파란색 텍스트 */
}

/* 취소 완료 상태 스타일 */
.status-badge.N {
	background-color: #f5f5f7; /* 연한 회색 배경 */
	color: #777; /* 회색 텍스트 */
}
</style>
<!-- 모달 css -->
<style>
.payHistoryDiv {
	visibility: hidden;
}

.payHistoryDiv.open {
	visibility: visible;
	}
	/* 상세 정보 컨테이너 (모달 내용 영역을 가정) */ 
	. detail-container { 
	max-width : 500px;
	margin: 20px auto;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	border: 1px solid #eee;
	
}

/* 1. 헤더 스타일 */
.detail-header {
	background-color: #fcece3; /* 연한 주황색 계열 (이미지 유사 색상) */
	padding: 15px 20px;
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

/* 2. 상세 항목 리스트 */
.detail-list {
	list-style: none;
	padding: 0;
	margin: 0;
}

.detail-item {
	display: flex;
	align-items: center;
	padding: 15px 20px;
	border-bottom: 1px solid #eee;
	background-color: #fff;
}

/* 마지막 항목의 하단 경계선 제거 */
.detail-list .detail-item:last-of-type {
	border-bottom: none;
}

/* 항목 아이콘 */
.item-icon {
	font-size: 18px;
	color: #666;
	margin-right: 15px;
	width: 20px; /* 아이콘 영역 너비 고정 */
	text-align: center;
}

/* 항목 제목 (라벨) */
.item-label {
	flex-shrink: 0; /* 공간이 부족해도 줄어들지 않음 */
	width: 100px;
	font-size: 14px;
	color: #555;
	font-weight: bold;
}

/* 항목 내용 (값) */
.item-value {
	flex-grow: 1; /* 남은 공간을 모두 차지 */
	text-align: right;
	font-size: 15px;
	color: #222;
	font-weight: 500;
}

/* 3. 푸터 및 버튼 */
.detail-footer {
	padding: 15px;
	background-color: #fff;
	border-top: 1px solid #eee;
	text-align: right;
}

.close-button {
	padding: 10px 20px;
	background-color: #ccc;
	color: #333;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.2s;
}

.close-button:hover {
	background-color: #bbb;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".payment-table tbody tr ").click(function() {
			var inquiryNum = $(this).find("td .num").val();
			location.href="${CommonURL}/inquiry/InquiryAnswer.jsp?inquiryNum="+inquiryNum;
		});

		
	})

	function closeDiv() {
		$(".payHistoryDiv").removeClass("open");
	}
	function clickbutton() {
			$(".tab-button").addClass("active");
		
	}
</script>
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


<%
		InquiryService is = InquiryService.getInstance();
		RangeDTO rDTO = new RangeDTO();
		
		int pageScale = is.pageScale();
		String tempPage = request.getParameter("currentPage");
		int currentPage = 1;
		if (tempPage != null) {
			currentPage = Integer.parseInt(tempPage);
			rDTO.setCurrentPage(currentPage);

		}

		int startNum = is.startNum(currentPage, pageScale);
		int endNum = is.endNum(startNum, pageScale);
		rDTO.setStartNum(startNum);
		rDTO.setEndNum(endNum);
		rDTO.setUrl("InquiryHistory.jsp");
		int num =Integer.parseInt(String.valueOf(session.getAttribute("num"))) ;
					
		int inquiryTotalCnt = is.searchInquiryTotalCnt(num);
		
		int totalPage = is.totalPage(inquiryTotalCnt, pageScale);
		rDTO.setTotalPage(totalPage);
		List<InquiryDTO> inquiryList = is.searchInquiry(rDTO,num);
		List<String> returnStateList = new ArrayList<String>();
		String returnState = "";
		for(int i=0; i<inquiryList.size();i++){
		returnState = "N";
		if(inquiryList.get(i).getInquiryReturn()!=null){
			returnState="Y";
		}//end if
		returnStateList.add(returnState);
		}//end for
		
		String pagination = is.pagination(rDTO);
		
		pageContext.setAttribute("inquiryList", inquiryList);
		pageContext.setAttribute("pagination", pagination);
		pageContext.setAttribute("returnStateList", returnStateList);
		pageContext.setAttribute("inquiryTotalCnt", inquiryTotalCnt);
		
		
		%>

		<!-- 메인 공간(비어있는 흰 배경 영역) -->
		<div class="container" style="height: auto; position: relative;">
			<jsp:include page="../include/page_navi.jsp"></jsp:include>
			<div class="payment-history-container">

				<div class="title-section">
					<h1>문의 내역</h1>
				</div>

	

				<div class="tab-menu">
					<button class="tab-button active" onclick="location.href='${CommonURL}/inquiry/Inquiry.jsp'">문의하기</button>
				</div>

				<div class="content-area">
					<div class="summary-count">총 **${inquiryTotalCnt }**건</div>
					<div class="table-container">
						<table class="payment-table">
							<thead>
								<tr>
									<th style="width: 5%;">문의번호</th>
									<th style="width: 30%;">제목</th>
									<th style="width: 15%;">답변 여부</th>
									<th style="width: 20%;">작성일</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="iDTO" items="${inquiryList }" varStatus="i">
							
								<tr>
									<td class="col-no">${iDTO.inquiryNum} 
									<input type="hidden" value="${iDTO.inquiryNum}" class="num"/>
									</td>
									<td class="col-product"><span class="product-badge">${iDTO.title}</span>
									</td>
									<td class="col-status"><span
										class="status-badge ${returnStateList.get(i.index)}">${returnStateList.get(i.index)} </span></td>
									<td class="col-amount ">${iDTO.inputDate}</td>
								</tr>
							
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="BoardListPager">
								<div>
										<div class="pagination" style="margin : 0px auto; width:300px;" >
												<div class="page-item" style="display:flex; justify-content: center;width:300px;">
													${pagination}
												</div>
										</div>
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
