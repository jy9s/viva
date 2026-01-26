<%@page import="kr.co.viva.pay.PromotionDTO"%>
<%@page import="kr.co.viva.pay.PromotionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>

<%
    /* ================= 카드 고정 처리 ================= */
    String promPayAgency = request.getParameter("promPayAgency");
    String fixedCardCompany = "";

    if("비씨카드".equals(promPayAgency)){
        fixedCardCompany = "비씨카드";
    }else if("삼성카드".equals(promPayAgency)){
        fixedCardCompany = "삼성카드";
    }else{
        fixedCardCompany = "일반";
    }

    pageContext.setAttribute("fixedCardCompany", fixedCardCompany);
    /* ================================================== */

    // 예약 정보 파라미터
    String ticketType = request.getParameter("ticketType");
    int qtyAdult  = Integer.parseInt(request.getParameter("qtyAdult"));
    int qtyTeen   = Integer.parseInt(request.getParameter("qtyTeen"));
    int qtyKids   = Integer.parseInt(request.getParameter("qtyKids"));
    int originTotalPrice = Integer.parseInt(request.getParameter("originTotalPrice"));  // 정가
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));  // 이미 할인된 금액
    String totalDesc = request.getParameter("totalDesc");

    String visitDate  = request.getParameter("visitDate");
    String payDate    = request.getParameter("payDate");
    String expireDate = request.getParameter("expireDate");

    String ticketName = "1일 이용권";
    if("annual".equals(ticketType)){
        ticketName = "연간 이용권";
    }

    PromotionDAO pDao = PromotionDAO.getInstance();
    List<PromotionDTO> promList = pDao.selectAllPromotion();
    pageContext.setAttribute("promList", promList);

    request.setAttribute("originTotalPrice", originTotalPrice);
    request.setAttribute("totalPrice", totalPrice);  
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VIVA PARK - 결제하기</title>
<script src="https://www.gjw.co.kr/inc/gjw_2024/js/14jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css?ver=1763706557">
<link rel="stylesheet" href="https://www.gjw.co.kr/css/gjw_2024/reset.css?ver=1763706557">
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/css/gjw_2024/sub.css?ver=1763706557">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
.pay-title{font-size:24px;font-weight:700;margin-bottom:25px;text-align:center;}
.table-summary{width:100%;border-collapse:collapse;margin-bottom:30px;}
.table-summary th, .table-summary td{border:1px solid #eee;padding:12px 16px;font-size:14px;}
.table-summary th{background:#fafafa;width:20%;}

.card-pay-box{
    max-width:520px;
    margin:20px auto 0;
    border:1px solid #d7d5ff;
    border-radius:8px;
    padding:25px 30px;
    background:#fff;
    box-sizing:border-box;
}
.card-field{margin-bottom:14px;}
.card-label{display:block;font-size:13px;color:#555;margin-bottom:6px;}
.card-input{
    width:100%;
    height:46px;
    border:1px solid #e4e4e4;
    border-radius:4px;
    padding:0 12px;
    font-size:14px;
    background-color:#fafafa;
}
.card-row{display:flex;gap:16px;}
.card-col{flex:1;}
.card-btn-wrap{text-align:center;margin-top:20px;margin-bottom:0;}

.container{padding-bottom:0 !important;}
.pay-box{
    max-width:900px;
    margin:40px auto 0;
    background:#fff;
    border-radius:10px;
    padding:30px 40px;
    box-shadow:0 0 15px rgba(0,0,0,0.15);
}
.card-btn-wrap{margin-bottom:0;}
#footer{margin-top:0 !important;}

.btn-orange{background:#ff7a00;color:#fff;border:none;padding:10px 30px;
            border-radius:4px;font-weight:600;}
</style>

<script>
$(function(){
    // 페이지 로드 완료 후 호출
    updateDiscount();
});

function formatNumber(num){
    return num.toLocaleString('ko-KR');
}

// ★ 수정: JavaScript에서 사용할 수 있도록 hidden 필드에서 가져옴
function updateDiscount(){
    var originTotalPrice = parseInt(document.getElementById('originTotalPrice').value) || 0;
    var totalPrice = parseInt(document.getElementById('totalPrice').value) || 0;
    var fixedCardCompany = document.getElementById('fixedCardCompany').value || '';
    var sel = document.getElementById('cardCompanySelect');
    var discount = 0;

    if(sel && sel.value){
        var d = sel.options[sel.selectedIndex].getAttribute('data-discount');
        if(d){ discount = parseInt(d); }
    }

    // 기본값: 첫 페이지에서 적용된 할인금액
    // 카드 선택 시 정가 기준으로 재계산 (고정 카드사 제외)
    var finalAmount = totalPrice;
    if(discount > 0 && sel.value !== fixedCardCompany){
        finalAmount = Math.floor(originTotalPrice * (100 - discount) / 100);
    }

    document.getElementById('showOriginPrice').innerText     = formatNumber(originTotalPrice) + '원';
    document.getElementById('showDiscountRate').innerText    = discount + '%';
    document.getElementById('showDiscountedPrice').innerText = formatNumber(finalAmount) + '원';
    document.getElementById('finalPayAmount').value = finalAmount;
}

$(function () {
    let invalidField = null;

    /* =========================
       카드번호 자동 포맷
       0000 - 0000 - 0000 - 0000
    ========================== */
    $('input[name="cardNo"]').on('input', function () {
        let val = $(this).val().replace(/[^0-9]/g, '');
        val = val.substring(0, 16);                     
        val = val.replace(/(\d{4})(?=\d)/g, '$1 - ');
        $(this).val(val);
    });

    $('input[name="cardNo"]').on('blur', function () {
        const $card  = $(this);
        const digits = $card.val().replace(/[^0-9]/g, '');

        if ($card.val() !== '' && digits.length !== 16) {
            alert('카드번호는 숫자 16자리여야 합니다.');
            $card.val('');          
            invalidField = $card;   
            $card.focus();
            return false;
        }
    });

    /* =========================
       유효기간 자동 슬래시
       MM/YY
    ========================== */
    $('input[name="exp"]').on('input', function () {
        let val = $(this).val().replace(/[^0-9]/g, '');
        val = val.substring(0, 4);                      

        if (val.length >= 3) {
            val = val.substring(0, 2) + '/' + val.substring(2);
        }
        $(this).val(val);
    });

    $('input[name="exp"]').on('blur', function () {
        const $exp   = $(this);
        const text   = $exp.val();                     
        const digits = text.replace(/[^0-9]/g, '');

        if (text === '') return;

        if (text.length !== 5 || digits.length !== 4 || !/^\d{2}\/\d{2}$/.test(text)) {
            alert('유효기간은 MM/YY 형식으로, 숫자 4자리로 입력하세요.');
            $exp.val('');
            invalidField = $exp;
            $exp.focus();
            return;
        }

        const mm = parseInt(text.substring(0, 2), 10);
        const yy = parseInt(text.substring(3, 5), 10);
        const now       = new Date();
        const currentYY = now.getFullYear() % 100;
        const currentMM = now.getMonth() + 1;

        if (mm < 1 || mm > 12 || yy < currentYY || (yy === currentYY && mm < currentMM)) {
            alert('유효기간을 다시 확인해 주세요.');
            $exp.val('');
            invalidField = $exp;
            $exp.focus();
        }
    });

    /* =========================
       CVC: 숫자만 3자리
    ========================== */
    $('input[name="cvc"]').on('input', function () {
        this.value = this.value.replace(/[^0-9]/g, '').substring(0, 3);
    });

    $('input[name="cvc"]').on('blur', function () {
        const $cvc = $(this);
        const val  = $cvc.val().replace(/[^0-9]/g, '');
        if (val !== '' && val.length !== 3) {
            alert('CVC는 숫자 3자리입니다.');
            $cvc.val('');
            invalidField = $cvc;
            $cvc.focus();
        } 
    });
    
    /* =========================
       포커스 유도 (무한루프 방지)
    ========================== */
    $('input[name="cardNo"], input[name="exp"], input[name="cvc"]').on('focus', function () {
        if (invalidField && this !== invalidField[0]) {
            invalidField.focus();  
        } else {
            invalidField = null;   
        }
    });

    $('#btnPay').on('click', function () {
        const $cardInput = $('input[name="cardNo"]');
        const $expInput  = $('input[name="exp"]');
        const $cvcInput  = $('input[name="cvc"]');
        const $pwdInput  = $('input[name="cardPwd"]');

        // 카드번호 검증
        const cardDigits = $cardInput.val().replace(/[^0-9]/g, '');
        if (cardDigits.length !== 16) {
            alert('카드번호를 확인하세요.');
            $cardInput.focus();
            return false;
        }

        // 유효기간 검증
        const expText   = $expInput.val();
        const expDigits = expText.replace(/[^0-9]/g, '');
        if (expText.length !== 5 || expDigits.length !== 4 || !/^\d{2}\/\d{2}$/.test(expText)) {
            alert('유효기간을 확인하세요.');
            $expInput.focus();
            return false;
        }

        // CVC 검증
        const cvcDigits = $cvcInput.val().replace(/[^0-9]/g, '');
        if (cvcDigits.length !== 3) {
            alert('CVC를 확인하세요.');
            $cvcInput.focus();
            return false;
        }
        
        // 비밀번호 검증
        const cardPass = $pwdInput.val();
        if(cardPass.trim().length != 2){
           alert("카드 비밀번호를 확인해주세요.");
           $pwdInput.focus();
           return false;
        }

        // 카드사 선택 검증
        const cardCompany = $('#cardCompanySelect').val();
        if(!cardCompany){
            alert('카드사를 선택해주세요.');
            $('#cardCompanySelect').focus();
            return false;
        }

        // ★ 여기서 정제해서 hidden에 담기
        $('input[name="cardNoPure"]').val(cardDigits);      
        $('input[name="expPure"]').val(expDigits);          
        $('input[name="cvcPure"]').val(cvcDigits);          
        $('input[name="pwdPure"]').val(cardPass);          

        // 최종 결제 금액 확인
        const finalAmount = parseInt($('#finalPayAmount').val()) || 0;
        if(finalAmount <= 0){
            alert('결제 금액이 올바르지 않습니다.');
            return false;
        }

        // 폼 전송
        $('#payForm')[0].submit();
    });
});
</script>

</head>

<body style="background:#f5f5f5;">

<div class="wrap">
<!-- 헤더 -->
    <div id="closetop"></div>
    <div id="header">
        <jsp:include page="../include/header.jsp"></jsp:include>
        <jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>
    </div>
    <jsp:include page="../include/hamberger.jsp"></jsp:include>

<div class="container">
<div class="pay-box">

<div class="pay-title">결제하기</div>

<table class="table-summary">
<tr>
<th>예정 방문일<br>(유효 기간)</th>
<td>
<%
if("daily".equals(ticketType)){
    out.print(visitDate != null ? visitDate : "");
}else{
    if(payDate != null && expireDate != null){
        out.print(payDate + " ~ " + expireDate);
    }
}
%>
</td>
<th>인원수</th>
<td><%= qtyAdult + qtyTeen + qtyKids %>명</td>
</tr>
<tr>
<th>예매 일시</th>
<td><%= new java.text.SimpleDateFormat("yyyy.MM.dd").format(new java.util.Date()) %></td>
<th>결제 수단</th>
<td>신용카드</td>
</tr>
<tr>
<th>상품 정보</th>
<td colspan="3"><%= ticketName %> / <%= totalDesc %></td>
</tr>
<tr>
<th>총 금액(할인 전)</th>
<td colspan="3">
<span id="showOriginPrice">
<fmt:formatNumber value="${originTotalPrice}" groupingUsed="true"/>원
</span>
</td>
</tr>
<tr>
<th>기본 할인 적용 후 / 추가 할인</th>
<td colspan="3">
<c:set var="prom" value="${null}"/>
<c:forEach var="p" items="${promList}">
<c:if test="${prom == null}">
<c:if test="${p.promPayAgency eq fixedCardCompany}">
<c:set var="prom" value="${p}"/>
</c:if>
</c:if>
</c:forEach>
<strong style="color:#5c26ff; font-size:16px;">
기본 프로모션 적용 후 금액: 
<span id="showDiscountedPrice">
<fmt:formatNumber value="${totalPrice}" groupingUsed="true"/>원
</span>
</strong>
<br><small style="color:#666;">
(카드 선택 시 추가 할인 적용: <span id="showDiscountRate">0</span>%)
</small>
</td>
</tr>
</table>

<form id="payForm" action="payConfirm.jsp" method="post" class="card-pay-box">

<input type="hidden" name="ticketType" value="<%= ticketType %>">
<input type="hidden" name="qtyAdult" value="<%= qtyAdult %>">
<input type="hidden" name="qtyTeen" value="<%= qtyTeen %>">
<input type="hidden" name="qtyKids" value="<%= qtyKids %>">

<input type="hidden" name="totalDesc" value="<%= totalDesc %>">
<input type="hidden" name="visitDate" value="<%= visitDate %>">
<input type="hidden" name="payDate" value="<%= payDate %>">
<input type="hidden" name="expireDate" value="<%= expireDate %>">

<input type="hidden" name="promPayAgency" value="<%= promPayAgency %>">

<!-- ★ 핵심 수정: JavaScript에서 사용할 fixedCardCompany -->
<input type="hidden" id="fixedCardCompany" value="<%= fixedCardCompany %>">

<!-- 첫 페이지에서 넘어온 값들 -->
<input type="hidden" name="originTotalPrice" id="originTotalPrice" value="<%= originTotalPrice %>">
<input type="hidden" name="totalPrice" id="totalPrice" value="<%= totalPrice %>">
<!-- 최종 결제 금액 (JS에서 업데이트) -->
<input type="hidden" name="finalPayAmount" id="finalPayAmount" value="<%= totalPrice %>">

<!-- 카드 pure 값들 -->
<input type="hidden" name="cardNoPure">
<input type="hidden" name="expPure">
<input type="hidden" name="cvcPure">
<input type="hidden" name="pwdPure">

<div class="card-field">
<label class="card-label">카드사 <span style="color:red;">*</span></label>

<c:choose>
<c:when test="${prom!=null}">
<select class="card-input" name="cardCompany" id="cardCompanySelect" required onchange="updateDiscount()">
<option value="${prom.promPayAgency}" data-discount="${prom.discount}">${prom.promPayAgency} (${prom.discount}% 할인)</option>
</select>
</c:when>
<c:otherwise>
<select class="card-input" name="cardCompany" id="cardCompanySelect" required onchange="updateDiscount()">
    <option value="" disabled selected>카드를 선택하세요.</option>
    <option value="신한카드" data-discount="10">신한카드 (10% 할인)</option>
    <option value="비씨카드" data-discount="15">비씨카드 (15% 할인)</option>
    <option value="삼성카드" data-discount="10">삼성카드 (10% 할인)</option>
    <option value="현대카드" data-discount="5">현대카드 (5% 할인)</option>
    <option value="국민카드" data-discount="10">국민카드 (10% 할인)</option>
    <option value="롯데카드" data-discount="5">롯데카드 (5% 할인)</option>
    <option value="하나카드" data-discount="10">하나카드 (10% 할인)</option>
    <option value="농협카드" data-discount="5">농협카드 (5% 할인)</option>
    <option value="우리카드" data-discount="10">우리카드 (10% 할인)</option>
</select>
</c:otherwise>
</c:choose>
</div>

<div class="card-field">
<label class="card-label">카드 번호 <span style="color:red;">*</span></label>
<input type="text" class="card-input" name="cardNo" placeholder="0000 - 0000 - 0000 - 0000" maxlength="26"/>
</div>

<div class="card-field card-row">
<div class="card-col">
<label class="card-label">유효 기간 (MM/YY) <span style="color:red;">*</span></label>
<input type="text" class="card-input" name="exp" placeholder="MM/YY" maxlength="5"/>
</div>
<div class="card-col">
<label class="card-label">CVC <span style="color:red;">*</span></label>
<input type="password" class="card-input" name="cvc" maxlength="3" placeholder="카드 뒷면 3자리 숫자"/>
</div>
</div>

<div class="card-field">
<label class="card-label">카드 비밀번호 <span style="color:red;">*</span></label>
<input type="password" class="card-input" name="cardPwd" maxlength="2" placeholder="비밀번호 앞 2자리"/>
</div>

<div class="card-field">
<label class="card-label">할부</label>
<select class="card-input" name="installment">
<option value="0">일시불</option>
<option value="3">3개월</option>
<option value="6">6개월</option>
<option value="12">12개월</option>
</select>
</div>

<input type="hidden" name="ticketName" value="<%= ticketName %>">
<div class="card-btn-wrap">
<button type="button" class="btn-orange" id="btnPay">결제하기</button>
<button type="button" class="btn-orange btn-lg" onclick="history.back();">취소</button>
</div>

</form>
</div>
</div>
</div>

    <div id="footer">
        <jsp:include page="../include/footer.jsp"></jsp:include>
    </div>

</body>
</html>
