<%@page import="kr.co.viva.perform.PerformReserveDTO"%>
<%@page import="kr.co.viva.perform.PerformDTO"%>
<%@page import="kr.co.viva.perform.UserPerformService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/LoginChk.jsp" %>
<%@ include file="../include/siteproperty.jsp" %>
<%-- <%
if(session.getAttribute("Userid") == null){
    String returnUrl = request.getRequestURI();
    if(request.getQueryString() != null){
        returnUrl += "?" + request.getQueryString();
    }
    response.sendRedirect(request.getContextPath()
        + "/login/loginFrm.jsp?returnUrl="
        + java.net.URLEncoder.encode(returnUrl, "UTF-8"));
    return;
}
%> --%>
<%
request.setCharacterEncoding("UTF-8");

Object userNumObj = session.getAttribute("UserNum");
if(userNumObj == null){
    response.sendRedirect(request.getContextPath() + "/login/loginPg_Include.jsp");
    return;
}
int memberNum = Integer.parseInt(String.valueOf(userNumObj));


int perfNum = Integer.parseInt(request.getParameter("perfNum"));
UserPerformService service = new UserPerformService();
PerformDTO p = service.getPerformDetail(perfNum);
request.setAttribute("p", p);

String action = request.getParameter("action");
if("reserve".equals(action)) {
	
	
    PerformReserveDTO prDTO = new PerformReserveDTO();
    prDTO.setMember_num(memberNum);
    prDTO.setPerfNum(Integer.parseInt(request.getParameter("perfNum")));

    prDTO.setpResName(request.getParameter("pResName"));
	String perfDateStr = request.getParameter("perfDate"); 
	java.sql.Date perfDate = java.sql.Date.valueOf(perfDateStr);

	prDTO.setPerfDate(perfDate);
    prDTO.setpResPerson(Integer.parseInt(request.getParameter("pResPerson")));

    prDTO.setPayMethod("신용카드"); 
    
    prDTO.setPayPrice(Integer.parseInt(request.getParameter("payPrice")));
    prDTO.setPayAgency(request.getParameter("payAgency"));
    prDTO.setInstallment(Integer.parseInt(request.getParameter("installment")));
    prDTO.setCvc(request.getParameter("cvc"));
    prDTO.setExpiration(request.getParameter("expiration"));
    prDTO.setCardPass(Integer.parseInt(request.getParameter("cardPass")));
    prDTO.setCardNum1(request.getParameter("cardNum1"));
    prDTO.setCardNum2(request.getParameter("cardNum2"));
    prDTO.setCardNum3(request.getParameter("cardNum3"));
    prDTO.setCardNum4(request.getParameter("cardNum4"));

    boolean ok = service.reservePerform(prDTO);
    request.setAttribute("reserveOk", ok);
    request.setAttribute("reserve", prDTO);

    if(ok){
    	request.setAttribute("reserve", prDTO);
    	request.setAttribute("now", new java.util.Date());
        RequestDispatcher rd = request.getRequestDispatcher("paySuccess.jsp");
        rd.forward(request, response);
        return;
    }

}
%>

<!DOCTYPE html>
<html>
<head>
<link rel ="shortcut icon" href="http://192.168.10.71/html_prj/common/images/favicon.ico"/>
<meta charset="UTF-8">
<title>V!VA PARK</title>
<!-- 내가만든 css -->
<!-- <link rel="stylesheet" type="text/css" href="http://192.168.10.72/html_prj/common/css/main_v251031.css"/>
 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://www.gjw.co.kr/inc/gjw_2024/js/14jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.js?ver=1763706557">
<link rel="stylesheet"
	href="https://www.gjw.co.kr/css/gjw_2024/reset.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/css/gjw_2024/sub.css?ver=1763706557">
	<jsp:include page="../include/vivatemplet_css2.jsp"/>
<style type="text/css">
*{
  margin:0;
  padding:0;
  box-sizing:border-box;
}
body{
  font-family:"Noto Sans KR",sans-serif;
  background:#fff;
  color:#222;
}
a{
  text-decoration:none;
  color:inherit;
}
#inner {
	width: 70%;
	margin: 0px auto
}

#title {
	background-color: #00FF00;
	height: 120px;
	font-size: 60px;
	text-align: center;
	padding: 20px;
}

#miniMenu, .miniMenuSub {
	display: flex;
}
#miniMenu, .miniMenuSub, .nav-link-mini {
	font-family: 'NotoSansKR', sans-serif !important;
	text-decoration: none !important;
	color: gray;
}

.container {
	height: auto;
	margin-top: 100px;
}

.nav-link:hover {
	color: gray;
}

.nav-item.dropdown {
	margin-left: 10px;
}

#miniHome {
	height: 30px;
}

.nav-item {
	list-style: none;
}

.event-main{
  max-width:1600px;
  margin:0 auto 60px;
  padding:0 20px 40px;
}

.event-banner{
  z-index:-1;
  margin-top:100px;
  position:relative;
  width:1910px;
  height:360px;
  left:50%;
  transform: translateX(-50%);
  overflow:hidden;
  background-position:center;
  background-size:cover;
  background-repeat:no-repeat;
  filter:brightness(0.9);
}

.event-banner-title{
  position:absolute;
  left:50%;
  bottom:200px;
  transform:translateX(-50%);
  font-size:40px;
  font-weight:800;
  color:#fff;
}

.event-content{
  position:relative;
  margin-top:-150px;
  background:#fff;
  border-radius:24px;
  padding-top:24px;

  display:flex;
  flex-direction:column;
  align-items:center;
}

.event-tab-row{
width:100%; 
  display:flex;
  justify-content:center;
  padding:0 24px;
  margin-top:30px;
  border-bottom:2px solid #eee;
  
}

.event-tabs{
  display:flex;
  gap:20px;
}

.event-tab{
  position:relative;
  padding:10px 4px 14px;
  font-size:28px;
  color:#000000;
  font-weight:600;
  background:none;
  border:none;
  bottom:30px;
}

/* 예약 버튼은 그대로 아래 가운데 */
.reserve-submit{
  padding:12px 80px;
  font-size:16px;
  background-color:#fff;
  color:#ff6b3d;
  border-radius:6px;
  border:1px solid #ff6b3d;
  font-weight:600;
  cursor:pointer;
}

.reserve-submit:hover{
  opacity:0.9;
}

/* ===== 결제 레이아웃 ===== */
.pay-wrap{
  max-width:900px;
  width:100%;
  margin:60px auto 80px;
}

/* 제목 */
.pay-title{
  font-size:22px;
  font-weight:700;
  margin-bottom:16px;
}

/* 상단 요약 테이블 */
.pay-summary{
  width:100%;
  border-collapse:collapse;
  border:1px solid #e5e5e5;
  font-size:14px;
  margin-bottom:32px;
}

.pay-summary th,
.pay-summary td{
  padding:10px 14px;
  border:1px solid #e5e5e5;
}
.pay-summary th { width:120px; }
.pay-summary td { width:300px; }


.pay-summary th{
  width:140px;
  background:#f8f8f8;
  font-weight:600;
  text-align:left;
}

.pay-summary td{
  background:#fff;
}

/* 폼 전체 */
.pay-form{
  display:flex;
  flex-direction:column;
  gap:10px;
}

/* 셀렉트/인풋 공통 */
.pay-input,
.pay-select{
  width:100%;
  padding:12px 14px;
  border:1px solid #ddd;
  border-radius:4px;
  font-size:14px;
  outline:none;
}

.pay-input:focus,
.pay-select:focus{
  border-color:#ff6b3d;
}

/* 라벨 */
.pay-label{
  font-size:13px;
  margin-top:8px;
  margin-bottom:4px;
}

/* 카드번호 4칸 */
.pay-card-number-row{
  display:grid;
  grid-template-columns:repeat(4,1fr);
  gap:10px;
}

/* 하단 두 칸 (유효기간 / CVC) */
.pay-flex-row{
  display:grid;
  grid-template-columns:1fr 1fr;
  gap:10px;
}

/* 버튼 영역 */
.pay-btn-row{
  display:flex;
  justify-content:center;
  gap:12px;
  margin-top:28px;
}

/* 버튼 공통 */
.pay-btn{
  min-width:160px;
  padding:12px 28px;
  font-size:15px;
  border-radius:4px;
  border:1px solid #ff6b3d;
  cursor:pointer;
  font-weight:600;
}

/* 결제하기 (주황) */
.pay-btn-primary{
  background:#ff6b3d;
  color:#fff;
}
.pay-btn-cancel{
  border: 1px solid #ff6b3d;
  background:#fff;
  color:#ff6b3d;
}

/* 확인 (화이트 아웃라인) */
.pay-btn-secondary{
  background:#fff;
  color:#ff6b3d;
}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script> 
<script type="text/javascript">
$(function(){
	  $("#btn").click(function(){

	    const required = [
	      {name:"pResName",        label:"예약자명"},
	      {name:"payAgency",      label:"카드사"},
	      {name:"cardNum1",   label:"카드번호 첫째칸", len:4},
	      {name:"cardNum2",   label:"카드번호 둘째칸", len:4},
	      {name:"cardNum3",   label:"카드번호 셋째칸", len:4},
	      {name:"cardNum4",   label:"카드번호 넷째칸", len:4},
	      {name:"expiration",         label:"유효기간", len:4},
	      {name:"cvc",         label:"CVC", len:3},
	      {name:"cardPass",   label:"카드 비밀번호", len:2}
	    ];

	    for(let i=0; i<required.length; i++){
	      let r = required[i];
	      let $input = $("[name='"+r.name+"']");
	      let v = $.trim($input.val());

	      if(v === ""){
	        alert(r.label + "을(를) 입력해주세요.");
	        $input.focus();
	        return;
	      }
	      
	      if(r.len && v.length !== r.len){
	          alert(r.label + "은(는) " + r.len + "자리로 입력해주세요.");
	          $input.focus();
	          return;
	        }

	      if(r.name === "expiration"){
	    	  let mm = parseInt(v.substring(0,2), 10);
	    	  let yy = parseInt(v.substring(2,4), 10);

	    	  if(mm < 1 || mm > 12){
	    	    alert("유효기간의 월은 01~12 사이여야 합니다.");
	    	    $input.focus();
	    	    return;
	    	  }

	    	  let now = new Date();
	    	  let curYear = now.getFullYear() % 100;
	    	  let curMonth = now.getMonth() + 1;    

	    	  if(yy < curYear || (yy === curYear && mm < curMonth)){
	    	    alert("카드의 유효기간이 지났습니다.");
	    	    $input.focus();
	    	    return;
	    	  }
	    	}

	    }
	    $("#pay-form").submit();
	  });
	 
});

//총 결제 금액 계산
$(function(){
	  const pricePerPerson = ${p.perfPrice};
	  const people = parseInt("${param.pResPerson}", 10) || 1;
	  const total = pricePerPerson * people;

	  $("#payPriceHidden").val(total);
	  $("#totalPriceText").text(total.toLocaleString() + "원");
	});

	

</script>
<c:set var="minimenu_title" value="즐길거리" scope="session"/>
	<c:set var="minimenu_sub" value="공연" scope="session"/> 
	<c:set var="folder_name" value="attraction" scope="session"/>
	
  
</head>
<body>
<!-- 헤더 -->
	<div class="close" style="width:100%; position:fixed;top:0;left:0; height : 10px;"></div>
	<div id="header" >
	<jsp:include page="../include/header.jsp"/>
	<jsp:include page="../include/hamberger.jsp"/>
			</div>
			<!-- 햄버거 메뉴 끝 -->
<div class="container">
			<!-- 미니 메뉴바 시작 -->
			<jsp:include page="../include/miniMenu2.jsp"/>
			<!-- 미니 메뉴바 끝 -->

<!-- 예매화면 -->
<div class="event-main">
  <div class="event-banner" style="background-image:url('../images/eventimg/event.png');">
    <div class="event-banner-title">공연</div>
  </div>

    <div class="event-content">

    <!-- 탭 -->
    <div class="event-tab-row">
      <div class="event-tabs">
        <div class="event-tab">결제하기
        </div>
      </div>
    </div>

    <!-- 결제 내용 -->
    <div class="pay-wrap">
      <!-- 상단 행사 정보 테이블 -->
	<div class= "pay-title">예약정보</div>
      <table class="pay-summary">
        <tr>
          <th>행사명</th>
          <td>${p.perfTitle}</td>
          <th>인원 수</th>
          <td>${param.pResPerson} 명</td>
        </tr>
        <tr>
          <th>선택날짜</th>
          <td>${param.perfDate}</td>
          <th>장소</th>
          <td>
			<c:choose>
			  <c:when test="${p.perfLoc == 1}">대형메인홀</c:when>
			  <c:when test="${p.perfLoc == 2}">소극장</c:when>
			  <c:when test="${p.perfLoc == 3}">콘서트홀</c:when>
			  <c:otherwise>위치정보 없음</c:otherwise>
			</c:choose>
			</td>
        </tr>
        <tr>
          <th>시간 및 소요 시간</th>
          <td>${ p.perfTime } / ${ p.perfShowTime }분</td>
          <th>총 금액</th>
          <td id="totalPriceText"></td>
        </tr>
      </table>

      <!-- 결제 폼 -->
      <form id="pay-form" class="pay-form" method="post" action="payment.jsp?action=reserve">
      <input type="hidden" name="perfNum" value="${param.perfNum}">
<input type="hidden" name="perfDate" value="${param.perfDate}">
<input type="hidden" name="pResPerson" value="${param.pResPerson}">
<input type="hidden" name="payPrice" id="payPriceHidden" value="">
      
      
        <!-- 이름 -->
        <label class="pay-label" for="buyerName">예약자명</label>
<input type="text" id="buyerName" class="pay-input" placeholder="이름 입력" name="pResName" maxlength="5">


        <!-- 카드사 -->
        <label class="pay-label" for="cardCompany">카드사</label>
        <select id="cardCompany" class="pay-select" name="payAgency">
          <option value="" selected hidden >카드사 선택</option>
          <option>신한</option>
          <option>국민</option>
          <option>우리</option>
          <option>카카오</option>
          <option>농협</option>
          <option>하나</option>
          <option>삼성</option>
          <option>롯데</option>
          <option>현대</option>
        </select>

        <!-- 카드 번호 -->
        <label class="pay-label">카드 번호</label>
        <div class="pay-card-number-row">
          <input type="text" class="pay-input" placeholder="0000" maxlength='4' name="cardNum1" oninput="this.value = this.value.replace(/[^0-9]/g,'');">
          <input type="text" class="pay-input" placeholder="0000" maxlength='4' name="cardNum2" oninput="this.value = this.value.replace(/[^0-9]/g,'');">
          <input type="text" class="pay-input" placeholder="0000" maxlength='4' name="cardNum3" oninput="this.value = this.value.replace(/[^0-9]/g,'');">
          <input type="text" class="pay-input" placeholder="0000" maxlength='4' name="cardNum4" oninput="this.value = this.value.replace(/[^0-9]/g,'');">
        </div>

        <!-- 유효기간 / CVC -->
        <div class="pay-flex-row">
          <div>
            <label class="pay-label" for="expiry">유효 기간</label>
            <input type="text" id="expiry" class="pay-input" placeholder="MMYY" maxlength='4' name="expiration" oninput="this.value = this.value.replace(/[^0-9]/g,'');">
          </div>
          <div>
            <label class="pay-label" for="cvc">CVC</label>
            <input type="text" id="cvc" class="pay-input" placeholder="카드 뒷면 3자리 숫자" maxlength='3' name="cvc" oninput="this.value = this.value.replace(/[^0-9]/g,'');">
          </div>
        </div>

        <!-- 비밀번호 -->
        <label class="pay-label" for="cardPw">카드 비밀번호</label>
        <input type="password" id="cardPw" class="pay-input" placeholder="카드 비밀번호 2자리" maxlength='2' name="cardPass" oninput="this.value = this.value.replace(/[^0-9]/g,'');">

        <!-- 할부 -->
        <label class="pay-label" for="installment">일시불</label>
        <select id="installment" class="pay-select" name="installment">
          <option value="0">일시불</option>
          <option value="3">3개월</option>
          <option value="6">6개월</option>
          <option value="12">12개월</option>
        </select>

        <!-- 버튼 -->
        <div class="pay-btn-row">
          <input type="button" value="결제하기" class="pay-btn pay-btn-primary" id="btn"/>
          <input type="button" value="취소" class="pay-btn pay-btn-cancel"/>
        </div>
      </form>
    </div>

  </div>

</div>
		</div>
	<!-- 푸터 -->
	<div id="footer"  >
		<jsp:include page="../include/footer.jsp"/>
	</div>

</body>
</html>

