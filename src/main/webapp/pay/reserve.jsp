<%@page import="kr.co.viva.pay.PromotionDTO"%>
<%@page import="kr.co.viva.pay.PromotionDAO"%>
<%@page import="kr.co.viva.pay.ResInfoDTO"%>
<%@page import="kr.co.viva.pay.TicketPriceDTO"%>
<%@page import="kr.co.viva.pay.TicketPriceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
request.setCharacterEncoding("UTF-8");

    // -------------------- 탭 파라미터 처리 --------------------
    String tabParam = request.getParameter("tab");
    if(tabParam == null || tabParam.trim().length() == 0){
        tabParam = "daily"; // 기본: 1일 이용권
    }
    pageContext.setAttribute("currentTab", tabParam);

    // 방문 예정일(1일권용) – 필요하면 다른 페이지에서 넘겨올 수 있음
    String rawDateValue = request.getParameter("rawDateValue");
    if(rawDateValue == null) {
        rawDateValue = "";
    }

    // 오늘, 1년 후 (연간권 표시용)
    LocalDate today = LocalDate.now();
    LocalDate oneYearLater = today.plusYears(1);
    request.setAttribute("rawDateValue", rawDateValue);
    request.setAttribute("todayStr", today.toString());
    request.setAttribute("oneYearLaterStr", oneYearLater.toString());

    // -------------------- 티켓 기준가 조회 --------------------
    TicketPriceDAO tDao = TicketPriceDAO.getInstance();
    List<TicketPriceDTO> tList = tDao.selectAllTicketPrice(); // ticket_name, adult_price ...

    int dailyAdult = 0;
    int annualAdult = 0;

    for(TicketPriceDTO t : tList){
        // DB에 ticket_type 1 일반, 2 연간
        if("1".equalsIgnoreCase(t.getTicketType())) {
            dailyAdult = t.getAdultPrice();
        }else if("2".equalsIgnoreCase(t.getTicketType())){
            annualAdult = t.getAdultPrice();
        }
    }

    // -------------------- 프로모션(카드사 할인) 조회 --------------------
    ResInfoDTO resDto = new ResInfoDTO();    
    PromotionDAO pDao = PromotionDAO.getInstance();
    List<PromotionDTO> pList = pDao.selectAllPromotion(); // prom_pay_agency, discount


    Integer bcDiscount = null;      // 비씨
    Integer samsungDiscount = null; // 삼성
    int normalDiscount = 0;         // 일반카드(할인 없음)

    for(PromotionDTO p : pList){
        if("비씨카드".equals(p.getPromPayAgency())){  //01. 비씨카드
            bcDiscount = p.getDiscount();
		    resDto.setProm_num(p.getPromNum());
		    System.out.println(p.getPromNum());
        }else if("삼성카드".equals(p.getPromPayAgency())){ //04. 삼성카드
            samsungDiscount = p.getDiscount();
		    resDto.setProm_num(p.getPromNum());
        }
    }


    
    
    
    // -------------------- 현재 탭 기준 정가 및 할인 가격 계산 --------------------
    int basePrice = "daily".equals(tabParam) ? dailyAdult : annualAdult;

    int bcPrice = (bcDiscount != null) ? basePrice * (100 - bcDiscount) / 100 : basePrice;
    int samsungPrice = (samsungDiscount != null) ? basePrice * (100 - samsungDiscount) / 100 : basePrice;
    int normalPrice = basePrice * (100 - normalDiscount) / 100;


    request.setAttribute("bcPrice", bcPrice);
    request.setAttribute("samsungPrice", samsungPrice);
    request.setAttribute("normalPrice", normalPrice);
    request.setAttribute("basePrice", basePrice);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>

<script src="https://www.gjw.co.kr/inc/gjw_2024/js/14jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css?ver=1763706557">
<link rel="stylesheet" href="https://www.gjw.co.kr/css/gjw_2024/reset.css?ver=1763706557">
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/css/gjw_2024/sub.css?ver=1763706557">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    .reserve-container {
        width: 100%;
        max-width: 800px;
        margin: 0 auto;
        padding: 0px 20px;
        font-family: sans-serif;
        color: #333;
    }
    .info-bar {
        background-color: #f8f8f8;
        padding: 15px;
        border-radius: 10px;
        margin-bottom: 30px;
        display: flex;
        justify-content: space-around;
        align-items: center;
        font-size: 14px;
        color: #555;
    }
    .info-item { display: flex; align-items: center; }
    .info-item .icon { margin-right: 8px; color: #888; }
    .date-selector input[type="date"] {
        border: none;
        background: transparent;
        padding: 0 5px;
        font-size: 14px;
        color: #333;
        cursor: pointer;
        font-weight: bold;
    }
    #displayDay { font-weight: bold; }

    .tab-buttons {
        margin-bottom: 10px;
        display: flex;
        gap: 10px;
    }
    .tab-img {
        cursor: pointer;
        height: 40px;
        width: auto;
        transition: transform 0.1s;
    }
    .tab-img:hover { transform: scale(1.02); }

    .tab-title {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .discount-card {
        border: 1px solid #eee;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        display: flex;
        align-items: center;
        position: relative;
        background-color: #fff;
        transition: border 0.2s, background-color 0.2s;
        cursor: pointer;
    }
    .discount-card.active {
        border: 2px solid #9966ff;
        background-color: #fbf8ff;
    }
    .card-logo {
        flex-shrink: 0;
        width: 80px;
        text-align: center;
        margin-right: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .logo-img {
        max-width: 100%;
        max-height: 50px;
        object-fit: contain;
    }
    .card-content { flex-grow: 1; }
    .card-content h6 {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 5px;
    }
    .card-content p {
        font-size: 14px;
        color: #777;
        line-height: 1.4;
    }
    .badge {
        position: absolute;
        top: 10px;
        right: 130px;
        background-color: #e6e6ff;
        color: #6600cc;
        padding: 3px 8px;
        border-radius: 5px;
        font-size: 12px;
        font-weight: bold;
    }
    .card-actions {
        flex-shrink: 0;
        text-align: right;
        margin-left: 20px;
    }
    .card-actions .price {
        font-size: 20px;
        font-weight: bold;
        color: #ff6b00;
        margin-bottom: 10px;
    }
    .card-actions button {
        border: none;
        padding: 5px 12px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 13px;
        margin-top: 5px;
    }
    .card-actions .detail-btn {
        background-color: #fff;
        border: 1px solid #ccc;
        color: #555;
    }
    .card-actions .reserve-btn {
        background-color: #fff;
        border: 1px solid #9966ff;
        color: #9966ff;
    }

    .subWrap { padding: 0; }
    #inner { width: 70%; margin: 0px auto }
    #title { background-color: #00FF00; height: 120px; font-size: 60px; text-align: center; padding: 20px; }
    #miniMenu, .miniMenuSub { display: flex; }
    #miniMenu, .miniMenuSub, .nav-link-mini {
        font-family: 'NotoSansKR', sans-serif !important;
        text-decoration: none !important;
        color: gray;
    }
    .container { height: 500px; margin-top: 100px; }
    .nav-link:hover { color: gray; }
    .nav-item.dropdown { margin-left: 10px; }
    #miniHome { height: 30px; }
    .nav-item { list-style: none; }
</style>

<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>

<script>
    function changeTab(tabName) {
        location.href = "?tab=" + tabName;
    }

    // 오늘 날짜 yyyy-MM-dd
    function todayStr() {
        const d = new Date();
        const y = d.getFullYear();
        const m = ('0' + (d.getMonth() + 1)).slice(-2);
        const day = ('0' + d.getDate()).slice(-2);
        return y + '-' + m + '-' + day;
    }

    // yyyy-MM-dd 기준 1년 후
    function addOneYear(dateStr) {
        const parts = dateStr.split('-');
        const d = new Date(parseInt(parts[0]), parseInt(parts[1]) - 1, parseInt(parts[2]));
        d.setFullYear(d.getFullYear() + 1);
        const y = d.getFullYear();
        const m = ('0' + (d.getMonth() + 1)).slice(-2);
        const day = ('0' + d.getDate()).slice(-2);
        return y + '-' + m + '-' + day;
    }

    // 예매 버튼 공통 처리
	function submitReserve(tab, cardCode) {
	    const form = document.getElementById('reserveForm');
	
	    // 탭 타입
	    document.getElementById('ticketTypeHidden').value = tab;
	
	    // 카드 코드 전달
	    document.getElementById('promPayAgencyHidden').value = cardCode;
	
	    if (tab === 'daily') {
	        const visit = document.getElementById('visitDateInput').value;
	        if (!visit) {
	            alert('방문 예정일을 선택해 주세요.');
	            return;
	        }
	        document.getElementById('visitDateHidden').value  = visit;
	        document.getElementById('payDateHidden').value    = '';
	        document.getElementById('expireDateHidden').value = '';
	    } else { // 연간권
	        const today = todayStr();
	        const oneYearLater = addOneYear(today);
	        document.getElementById('visitDateHidden').value  = '';
	        document.getElementById('payDateHidden').value    = today;
	        document.getElementById('expireDateHidden').value = oneYearLater;
	    }
	
	    form.submit();
	}


    $(function() {
        $(".discount-card").click(function() {
            $(".discount-card").removeClass("active");
            $(this).addClass("active");
        });
    });
</script>
</head>
<body>
    <div id="closetop"></div>
    <div id="header">
        <jsp:include page="../include/header.jsp"></jsp:include>
    </div>
    <jsp:include page="../include/hamberger.jsp"></jsp:include>

    <div class="container">

        <!-- 예매 정보/날짜 입력 영역 -->
        <div class="reserve-container">
            <jsp:include page="../include/page_navi.jsp"></jsp:include>

            <div class="info-bar">
                <div class="info-item date-selector">
                    <span class="icon">📅</span>
                    <span>방문 예정일</span>
                    <input type="date" id="visitDateInput" value="${rawDateValue}">
                    <span id="displayDay"></span>
                </div>
                <div class="info-item">
                    <span class="icon">⏱️</span>
                    <span>운영 시간: <strong>${operationTime}</strong></span>
                </div>
            </div>
        </div>

        <!-- 예매 선택 영역 -->
        <div class="reserve-container">

            <!-- 예매 form: 날짜/티켓 타입을 reservProcess.jsp로 전달 -->
            <form id="reserveForm" action="reserveProcess.jsp" method="post">
                <input type="hidden" name="ticketType" id="ticketTypeHidden" value="${currentTab}">
                <input type="hidden" name="visitDate"  id="visitDateHidden">
                <input type="hidden" name="payDate"    id="payDateHidden">
                <input type="hidden" name="expireDate" id="expireDateHidden">

                <input type="hidden" name="promPayAgency" id="promPayAgencyHidden">
                
                
                <!-- 탭 버튼 -->
                <div class="tab-buttons">
                    <img 
                        src="${CommonURL}/images/ticket_daily_${currentTab eq 'daily' ? 'on' : 'off'}.png" 
                        alt="1일 이용권" 
                        class="tab-img"
                        onclick="changeTab('daily')">
                    <img 
                        src="${CommonURL }/images/ticket_annual_${currentTab eq 'annual' ? 'on' : 'off'}.png" 
                        alt="연간 이용권" 
                        class="tab-img"
                        onclick="changeTab('annual')">
                </div>

                <!-- 상단 타이틀 + 날짜 -->
                <div class="tab-title">
                    <c:choose>
                        <c:when test="${currentTab eq 'daily'}">
                            1일 이용권
                            <c:if test="${not empty rawDateValue}">
                                (<span>${rawDateValue}</span> 방문)
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            연간 이용권
                            (<span>${todayStr}</span> ~ <span>${oneYearLaterStr}</span>)
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- 비씨카드 -->
                <div class="discount-card ${currentTab eq 'daily' ? 'active' : ''}">
                    <div class="card-logo">
                        <img src="${CommonURL }/images/bc_logo.png" alt="비씨카드" class="logo-img">
                    </div>
                    <div class="card-content">
                        <c:choose>
                            <c:when test="${currentTab eq 'daily'}">
                                <h6>[1Day] 비씨카드</h6>
                                <p>비씨카드 제휴 회원 대상 1일 이용권 할인 프로모션.</p>
                            </c:when>
                            <c:otherwise>
                                <h6>[연간] 비씨카드</h6>
                                <p>연간 이용권 결제 시 비씨카드 고객 대상 특별 할인 프로모션.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <c:choose>
                        <c:when test="${currentTab eq 'daily'}">
                            <span class="badge">1일 이용권 프로모션</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge">연간 회원권 프로모션</span>
                        </c:otherwise>
                    </c:choose>

                    <div class="card-actions">
                        <div class="price">
                            1인 
                            <strong>
                                <fmt:formatNumber value="${bcPrice}" groupingUsed="true"/>원
                            </strong>~
                        </div>
                        <button class="detail-btn" type="button">상세보기</button>
                        <button class="reserve-btn" type="button"
                                onclick="submitReserve('${currentTab}', '비씨카드')">
                            예매하기
                        </button>
                    </div>
                </div>

                <!-- 삼성카드 -->
                <div class="discount-card">
                    <div class="card-logo">
                        <img src="${CommonURL }/images/samsung_logo.png" alt="삼성카드" class="logo-img">
                    </div>
                    <div class="card-content">
                        <c:choose>
                            <c:when test="${currentTab eq 'daily'}">
                                <h6>[1Day] 삼성카드</h6>
                                <p>삼성카드 제휴 회원 대상 1일 이용권 할인 프로모션.</p>
                            </c:when>
                            <c:otherwise>
                                <h6>[연간] 삼성카드</h6>
                                <p>연간 이용권 결제 시 삼성카드 고객 대상 특별 할인 프로모션.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <c:choose>
                        <c:when test="${currentTab eq 'daily'}">
                            <span class="badge">1일 이용권 스페셜</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge">연간 회원권 스페셜</span>
                        </c:otherwise>
                    </c:choose>

                    <div class="card-actions">
                        <div class="price">
                            1인 
                            <strong>
                                <fmt:formatNumber value="${samsungPrice}" groupingUsed="true"/>원
                            </strong>~
                        </div>
                        <button class="detail-btn" type="button">상세보기</button>
                        <button class="reserve-btn" type="button"
                                onclick="submitReserve('${currentTab}', '삼성카드')">
                            예매하기
                        </button>
                    </div>
                </div>

                <!-- 일반 신용카드 -->
                <div class="discount-card">
                    <div class="card-logo">
                        <span>일반 신용 카드</span>
                    </div>
                    <div class="card-content">
                        <c:choose>
                            <c:when test="${currentTab eq 'daily'}">
                                <h6>[1Day] 일반 신용 카드</h6>
                                <p>모든 신용/체크카드로 1일 이용권 정상가 결제가 가능합니다.</p>
                            </c:when>
                            <c:otherwise>
                                <h6>[연간] 일반 신용 카드</h6>
                                <p>모든 신용/체크카드로 연간 이용권 정상가 결제가 가능합니다.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="card-actions">
                        <div class="price">
                            1인 
                            <strong>
                                <fmt:formatNumber value="${normalPrice}" groupingUsed="true"/>원
                            </strong>~
                        </div>
                        
                        <button class="detail-btn" type="button">상세보기</button>
                        <button class="reserve-btn" type="button"
                                onclick="submitReserve('${currentTab}', 'Normal')">
                            예매하기
                        </button>
                    </div>
                </div>

            </form>
        </div>

        <div id="footer">
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </div>
</body>
</html>
