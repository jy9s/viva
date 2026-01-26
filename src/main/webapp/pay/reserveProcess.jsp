<%@page import="kr.co.viva.pay.PromotionDTO"%>
<%@page import="kr.co.viva.pay.PromotionDAO"%>
<%@page import="kr.co.viva.pay.TicketPriceDTO"%>
<%@page import="kr.co.viva.pay.TicketPriceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");

    String promPayAgency=request.getParameter("promPayAgency");
    String cardCompany = request.getParameter("cardCompany");

    if ("비씨카드".equals(promPayAgency)) {
        promPayAgency = "비씨카드";
    } else if ("삼성카드".equals(promPayAgency)) {
        promPayAgency = "삼성카드";
    } else {
        promPayAgency = "일반카드";
    }


	
    // 1. ticketType 매핑 (1/2 -> daily/annual)
    String ticketType = request.getParameter("ticketType"); // "daily", "annual", "1", "2" 중 하나
    if(ticketType == null || ticketType.trim().length() == 0){
        ticketType = "daily";
    }else if("1".equals(ticketType)){
        ticketType = "daily";
    }else if("2".equals(ticketType)){
        ticketType = "annual";
    }

    // 날짜 파라미터 (reserv.jsp에서 넘어온 값)
    String visitDate  = request.getParameter("visitDate");   // 1일권 방문 예정일
    String payDate    = request.getParameter("payDate");     // 연간권 결제일
    String expireDate = request.getParameter("expireDate");  // 연간권 만료일

    // 2. DB에서 가격 조회 (정가)
    TicketPriceDAO tDao = TicketPriceDAO.getInstance();
    List<TicketPriceDTO> priceList = tDao.selectAllTicketPrice();

    int dailyAdultPrice = 0, dailyTeenAgerPrice = 0, dailyKidsPrice = 0;
    int annualAdultPrice = 0, annualTeenAgerPrice = 0, annualKidsPrice = 0;

    if(priceList != null){
        for(TicketPriceDTO dto : priceList){
            // ticketType 컬럼이 "1"=1일권, "2"=연간권이라고 가정
            if("1".equals(dto.getTicketType())){          // 1일권
                dailyAdultPrice    = dto.getAdultPrice();
                dailyTeenAgerPrice = dto.getTeenAgerPrice();
                dailyKidsPrice     = dto.getKidsPrice();
            }else if("2".equals(dto.getTicketType())){    // 연간권
                annualAdultPrice    = dto.getAdultPrice();
                annualTeenAgerPrice = dto.getTeenAgerPrice();
                annualKidsPrice     = dto.getKidsPrice();
            }
        }
    }

    // 3. 프로모션 할인율 조회 (예: 비씨카드 기준 할인율 사용)
    
    
    
    PromotionDAO pDao = PromotionDAO.getInstance();
    List<PromotionDTO> promList = pDao.selectAllPromotion();
    int promoDiscount = 0; // percent

    if(promList != null){
        for(PromotionDTO p : promList){
            // 원하는 기준 카드사 지정 (예: "비씨")
	        // System.out.println(promPayAgency);
            if(promPayAgency.equals(p.getPromPayAgency())){
                promoDiscount = p.getDiscount(); // 예: 15, 20 등
                break;
            }
        }
    }

    // 4. 할인 가격 계산 (정수 내림)
    int dailyAdultSale    = dailyAdultPrice    * (100 - promoDiscount) / 100;
    int dailyTeenAgerSale = dailyTeenAgerPrice * (100 - promoDiscount) / 100;
    int dailyKidsSale     = dailyKidsPrice     * (100 - promoDiscount) / 100;

    int annualAdultSale    = annualAdultPrice    * (100 - promoDiscount) / 100;
    int annualTeenAgerSale = annualTeenAgerPrice * (100 - promoDiscount) / 100;
    int annualKidsSale     = annualKidsPrice     * (100 - promoDiscount) / 100;

    // EL에서 사용하도록 저장
    pageContext.setAttribute("ticketType", ticketType);
    pageContext.setAttribute("visitDate", visitDate);
    pageContext.setAttribute("payDate", payDate);
    pageContext.setAttribute("expireDate", expireDate);

    // 정가
    pageContext.setAttribute("dailyAdultPrice",     dailyAdultPrice);
    pageContext.setAttribute("dailyTeenAgerPrice",  dailyTeenAgerPrice);
    pageContext.setAttribute("dailyKidsPrice",      dailyKidsPrice);
    pageContext.setAttribute("annualAdultPrice",    annualAdultPrice);
    pageContext.setAttribute("annualTeenAgerPrice", annualTeenAgerPrice);
    pageContext.setAttribute("annualKidsPrice",     annualKidsPrice);

    // 할인가
    pageContext.setAttribute("dailyAdultSale",     dailyAdultSale);
    pageContext.setAttribute("dailyTeenAgerSale",  dailyTeenAgerSale);
    pageContext.setAttribute("dailyKidsSale",      dailyKidsSale);
    pageContext.setAttribute("annualAdultSale",    annualAdultSale);
    pageContext.setAttribute("annualTeenAgerSale", annualTeenAgerSale);
    pageContext.setAttribute("annualKidsSale",     annualKidsSale);
    pageContext.setAttribute("promoDiscount",      promoDiscount);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VIVA PARK - 예매</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
      href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    body {
        margin: 0;
        font-family: sans-serif;
        background-color: #f5f5f5;
    }
    .overlay-area {
        background-color: #2a2a2a;
        color: #000;
        min-height: 400px;
        padding-top: 40px;
        padding-bottom: 70px;
    }
    .reserve-box {
        max-width: 900px;
        margin: 40px auto 60px auto;
        background-color: #fff;
        border-radius: 10px;
        padding: 30px 40px 40px 40px;
        box-shadow: 0 0 15px rgba(0,0,0,0.2);
    }
    .ticket-title {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 25px;
    }
    .person-row {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 15px 0;
        border-bottom: 1px solid #eee;
    }
    .person-label {
        width: 100px;
        font-size: 16px;
        font-weight: 600;
    }
    .qty-control {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .qty-btn {
        width: 32px;
        height: 32px;
        border-radius: 16px;
        border: 1px solid #ddd;
        background-color: #fff;
        cursor: pointer;
        font-size: 18px;
        line-height: 30px;
        text-align: center;
    }
    .qty-input {
        width: 50px;
        text-align: center;
        border: none;
        background-color: #f7f7f7;
        padding: 6px 0;
        border-radius: 6px;
    }
    .price-col {
        text-align: right;
        width: 220px;
        font-size: 15px;
    }
    .price-col del {
        color: #aaa;
        margin-right: 10px;
    }
    .price-col strong {
        font-weight: 700;
    }
    .summary-area {
        padding: 20px 0 0 0;
    }
    .summary-label {
        font-size: 18px;
        font-weight: 700;
    }
    .summary-price {
        font-size: 22px;
        font-weight: 800;
        color: #5c26ff;
        text-align: right;
    }
    .pay-button-wrap {
        margin-top: 15px;
        text-align: right;
    }
    .pay-button {
        padding: 12px 30px;
        border-radius: 8px;
        border: none;
        background-color: #5c26ff;
        color: #fff;
        font-size: 16px;
        font-weight: 700;
        cursor: pointer;
    }
    #footer {
        margin-top:120px;
        background-color: #fff;
        padding: 30px 0;
        border-top: 1px solid #ddd;
    }
</style>

<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>

<script>
    // 정가: DB에서 넘겨받은 값을 EL로 주입
    var basePrices = {
        daily:  {
            adult: ${dailyAdultPrice},
            teen:  ${dailyTeenAgerPrice},
            kids:  ${dailyKidsPrice}
        },
        annual: {
            adult: ${annualAdultPrice},
            teen:  ${annualTeenAgerPrice},
            kids:  ${annualKidsPrice}
        }
    };

    // 할인 가격: 프로모션 할인율 반영
    var salePrices = {
        daily:  {
            adult: ${dailyAdultSale},
            teen:  ${dailyTeenAgerSale},
            kids:  ${dailyKidsSale}
        },
        annual: {
            adult: ${annualAdultSale},
            teen:  ${annualTeenAgerSale},
            kids:  ${annualKidsSale}
        }
    };

    function formatNumber(num) {
        return num.toLocaleString('ko-KR');
    }

    function recalcTotal() {
        var type = document.getElementById("ticketType").value;

        var qtyAdult = parseInt(document.getElementById("qtyAdult").value) || 0;
        var qtyTeen  = parseInt(document.getElementById("qtyTeen").value)  || 0;
        var qtyKids  = parseInt(document.getElementById("qtyKids").value)  || 0;

        // 1) 정가 기준 합계 계산
        var originAdult = basePrices[type].adult * qtyAdult;
        var originTeen  = basePrices[type].teen  * qtyTeen;
        var originKids  = basePrices[type].kids  * qtyKids;
        var originTotal = originAdult + originTeen + originKids;

        // 2) 할인가 기준 합계 (현재 프로모션 적용된 금액)
        var priceAdult = salePrices[type].adult * qtyAdult;
        var priceTeen  = salePrices[type].teen  * qtyTeen;
        var priceKids  = salePrices[type].kids  * qtyKids;
        var total = priceAdult + priceTeen + priceKids;

        // 화면 업데이트
        document.getElementById("sumAdult").innerText = formatNumber(priceAdult) + "원";
        document.getElementById("sumTeen").innerText  = formatNumber(priceTeen)  + "원";
        document.getElementById("sumKids").innerText  = formatNumber(priceKids)  + "원";
        document.getElementById("totalPrice").innerText = formatNumber(total) + "원";

        var desc = [];
        if(qtyAdult > 0) desc.push("어른 "   + qtyAdult + "매");
        if(qtyTeen  > 0) desc.push("청소년 " + qtyTeen  + "매");
        if(qtyKids  > 0) desc.push("어린이 " + qtyKids  + "매");
        var descText = desc.join(" · ");
        document.getElementById("totalDesc").innerText = descText;

        // hidden 필드 설정 ★ 핵심 수정
        document.getElementById("sendTicketType").value = type;
        document.getElementById("sendQtyAdult").value   = qtyAdult;
        document.getElementById("sendQtyTeen").value    = qtyTeen;
        document.getElementById("sendQtyKids").value    = qtyKids;
        document.getElementById("sendTotalPrice").value = total;           // 할인 후 금액
        document.getElementById("sendOriginPrice").value = originTotal;   // 정가 합계
        document.getElementById("sendTotalDesc").value  = descText;
    }

    
    function validateAndSubmit() {
        var qtyAdult = parseInt(document.getElementById("qtyAdult").value) || 0;
        var qtyTeen  = parseInt(document.getElementById("qtyTeen").value)  || 0;
        var qtyKids  = parseInt(document.getElementById("qtyKids").value)  || 0;

        var total = qtyAdult + qtyTeen + qtyKids;

        if (total === 0) {
            alert(" 티켓 수량을 확인하세요 ");
            return false;   // 폼 전송 막기
        }

        // 수량이 1장 이상이면 정상 전송
        document.getElementById("payForm").submit();
    } // validateAndSubmit

    function changeQty(id, delta){
        var input  = document.getElementById(id);
        var current = parseInt(input.value) || 0;

        var qtyAdult = parseInt(document.getElementById("qtyAdult").value) || 0;
        var qtyTeen  = parseInt(document.getElementById("qtyTeen").value)  || 0;
        var qtyKids  = parseInt(document.getElementById("qtyKids").value)  || 0;

        var totalNow = qtyAdult + qtyTeen + qtyKids;

        if(delta > 0){
            if(totalNow >= 10){
                return;
            }
            current += 1;
        }else if(delta < 0){
            current -= 1;
            if(current < 0) current = 0;
        }

        input.value = current;
        recalcTotal();
    }

    $(function(){
        recalcTotal();
    });
</script>
</head>
<body>

<div class="wrap">
<form action="payInfoGet.jsp" method="post" id="payForm">

<div class="overlay-area">
    <div class="reserve-box">
        <!-- 티켓 종류 + 날짜 표시 -->
        <div class="ticket-title">
            <c:choose>
                <c:when test="${ticketType eq 'daily'}">
                    1일 이용권
                    <c:if test="${not empty visitDate}">
                        (<span>${visitDate}</span> 방문)
                    </c:if>
                </c:when>
                <c:otherwise>
                    연간 이용권
                    <c:if test="${not empty payDate and not empty expireDate}">
                        (<span>${payDate}</span> ~ <span>${expireDate}</span>)
                    </c:if>
                </c:otherwise>
            </c:choose>
            <span style="font-size:13px;color:#800020;"> (기본 프로모션 할인율: <c:out value="${promoDiscount}"/>%)</span>
        </div>

        <input type="hidden" id="ticketType" value="${ticketType}" />

        <!-- 어른 -->
        <div class="person-row">
            <div class="person-label">어른</div>
            <div class="qty-control">
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyAdult', -1)">－</button>
                <input type="text" id="qtyAdult" class="qty-input" value="0" readonly>
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyAdult', 1)">＋</button>
            </div>
            <div class="price-col">
                <c:choose>
                    <c:when test="${ticketType eq 'daily'}">
                        <del><c:out value="${dailyAdultPrice}" />원</del>
                        <strong id="sumAdult"><c:out value="${dailyAdultSale}" />원</strong>
                    </c:when>
                    <c:otherwise>
                        <del><c:out value="${annualAdultPrice}" />원</del>
                        <strong id="sumAdult"><c:out value="${annualAdultSale}" />원</strong>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- 청소년 -->
        <div class="person-row">
            <div class="person-label">청소년</div>
            <div class="qty-control">
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyTeen', -1)">－</button>
                <input type="text" id="qtyTeen" class="qty-input" value="0" readonly>
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyTeen', 1)">＋</button>
            </div>
            <div class="price-col">
                <c:choose>
                    <c:when test="${ticketType eq 'daily'}">
                        <del><c:out value="${dailyTeenAgerPrice}" />원</del>
                        <strong id="sumTeen"><c:out value="${dailyTeenAgerSale}" />원</strong>
                    </c:when>
                    <c:otherwise>
                        <del><c:out value="${annualTeenAgerPrice}" />원</del>
                        <strong id="sumTeen"><c:out value="${annualTeenAgerSale}" />원</strong>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- 어린이 -->
        <div class="person-row">
            <div class="person-label">어린이</div>
            <div class="qty-control">
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyKids', -1)">－</button>
                <input type="text" id="qtyKids" class="qty-input" value="0" readonly>
                <button type="button" class="qty-btn"
                        onclick="changeQty('qtyKids', 1)">＋</button>
            </div>
            <div class="price-col">
                <c:choose>
                    <c:when test="${ticketType eq 'daily'}">
                        <del><c:out value="${dailyKidsPrice}" />원</del>
                        <strong id="sumKids"><c:out value="${dailyKidsSale}" />원</strong>
                    </c:when>
                    <c:otherwise>
                        <del><c:out value="${annualKidsPrice}" />원</del>
                        <strong id="sumKids"><c:out value="${annualKidsSale}" />원</strong>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- 합계 -->
        <div class="summary-area d-flex justify-content-between align-items-center">
            <div class="summary-label">
                총 결제금액 ( 모두 합하여 10매까지 구매 가능 )
                <div id="totalDesc"
                     style="font-size:13px; color:#777; margin-top:5px;">
                    어른 1매 · 청소년 1매 · 어린이 1매
                </div>
            </div>
            <div class="summary-price" id="totalPrice">
                <!-- JS에서 재계산 -->
            </div>
        </div>

        <div class="pay-button-wrap">
			<button type="button" class="pay-button" onclick="validateAndSubmit()">결제하기</button>		
        </div>
    </div>
</div>

<!-- payInfoGet.jsp 로 넘길 숨김 필드들 -->
<input type="hidden" name="ticketType"      id="sendTicketType"  value="${ticketType}">
<input type="hidden" name="qtyAdult"        id="sendQtyAdult"    value="0">
<input type="hidden" name="qtyTeen"         id="sendQtyTeen"     value="0">
<input type="hidden" name="qtyKids"         id="sendQtyKids"     value="0">
<input type="hidden" name="originTotalPrice" id="sendOriginPrice" value="0">  <!-- 정가 -->
<input type="hidden" name="totalPrice"      id="sendTotalPrice"  value="0">   <!-- 할인 후 -->
<input type="hidden" name="totalDesc"       id="sendTotalDesc"   value="">
<input type="hidden" name="promPayAgency"   value="<%= promPayAgency %>">
<input type="hidden" name="visitDate"       value="${visitDate}">
<input type="hidden" name="payDate"         value="${payDate}">
<input type="hidden" name="expireDate"      value="${expireDate}">
<input type="hidden" name="promoDiscount" value="${promoDiscount}">


</form>
</div>

<div id="footer">
    <jsp:include page="../include/footer.jsp"></jsp:include>
</div>

</body>
</html>
