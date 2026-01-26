<%@page import="kr.co.viva.perform.PerformDTO"%>
<%@page import="kr.co.viva.perform.UserPerformService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ include file="../include/LoginChk.jsp" %>
	<%@ include file="../include/siteproperty.jsp" %>
    
    <%
request.setCharacterEncoding("UTF-8");
    UserPerformService service = new UserPerformService();
    List<PerformDTO> list = null;
    int perfNum = Integer.parseInt(request.getParameter("perfNum"));
    PerformDTO p = service.getPerformDetail(perfNum);  
    request.setAttribute("p", p);
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
.pay-msg{
  font-size:30px;
  width:1100px;
  text-align:left;
  font-weight: bold;
  padding: 20px 0 0 100px;
 
}
.pay-msg-desc{
  width:1100px;
  padding: 20px 0 0 100px;
  text-align:left;
}
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
.pay-table{
  width:100%;
  border-collapse:collapse;
  border:1px solid #e5e5e5;
  font-size:14px;
  margin-bottom:32px;
}

.pay-table th,
.pay-table td{
  padding:10px 14px;
  border:1px solid #e5e5e5;
}

.pay-table th{
  width:120px;
  background:#f8f8f8;
  font-weight:600;
  text-align:left;
}

.pay-table td{
  width:300px; 
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

.pay-btn-primary{
  margin-top:30px;
  border:1px solid #ff6b3d; 
  background:#fff;
  color:#ff6b3d;
}

.td{
	width:400px;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<c:set var="minimenu_title" value="즐길거리" scope="session"/>
	<c:set var="minimenu_sub" value="공연" scope="session"/> 
	<c:set var="folder_name" value="attraction" scope="session"/>
	
  
</head>
<body>
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
        <div class="event-tab">결제 완료</div>
      </div>
    </div>

    <!-- 결제 내용 -->
     <div class="pay-msg">결제가 완료 되었습니다</div>
     <div class="pay-msg-desc">예약한 티켓을 확인하세요.<br> 티켓 취소는 마이페이지에서 가능합니다.
     <span style="color:#ff6b3d;">이미 사용한 티켓은 환불 불가</span>합니다.</div>
    <div class="pay-wrap">

      <!-- 상단 행사 정보 테이블 -->
      <div class= "pay-title">결제정보</div>
	<table class="pay-table">
		  <tr>
		    <th>행사명</th>
		    <td>${p.perfTitle}</td>
		    <th>인원 수</th>
		    <td>${reserve.pResPerson} 명</td>
		  </tr>
		  <tr>
		    <th>에약일시</th>
		    <td>${param.perfDate}<br>${p.perfTime}</td>
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
		    <th>결제일시</th>
<td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		    <th>예약번호</th>
		    <td>${reserve.pResNum}</td>
		  </tr>
		  <tr>
		    <th>결제수단</th>
		    <td>${reserve.payAgency} / ${reserve.payMethod}</td>
		    <th>현재상태</th>
		    <td>예약완료</td>
		  </tr>
		  <tr>
		    <th>예약자명</th>
		    <td>${reserve.pResName}</td>
		    <th>총 금액</th>
		    <td>${reserve.payPrice}원</td>
		  </tr>
		</table>


        <!-- 버튼 -->
        <div class="pay-btn-row">
          <button type="button" class="pay-btn pay-btn-primary" onclick="location.href='${CommonURL}/main/mainPg_Include.jsp'">확인</button>
        </div>
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
