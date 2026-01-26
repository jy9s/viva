<%@page import="kr.co.viva.perform.PerformDTO"%>
<%@page import="kr.co.viva.perform.UserPerformService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
UserPerformService service = new UserPerformService();
List<PerformDTO> list = null;
int perfNum = Integer.parseInt(request.getParameter("perfNum"));
PerformDTO p = service.getPerformDetail(perfNum);  
request.setAttribute("p", p);
%>
<%
request.setCharacterEncoding("UTF-8");
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

/* 공연 정보 카드 전체 */
.reserve-card{
  margin-top:50px;
  max-width:1000px; 
  width:100%;
  display:flex;
  gap:32px;
  padding:24px 24px 20px;
  border:1px solid #eee;
  border-radius:16px;
  background:#fafafa;
  align-items:center;
}

/* 포스터 이미지 */
.reserve-card-img img{
  width:260px;
  height:auto;
  display:block;
  border-radius:12px;
  object-fit:cover;
}

/* 오른쪽 텍스트 영역 */
.reserve-card-body{
  flex:1;
  display:flex;
  flex-direction:column;
  gap:16px;
}

/* 상단 타이틀 영역 */
.reserve-header{
  display:flex;
  align-items:center;
  gap:10px;
  margin-bottom:4px;
}

.reserve-tag{
  display:inline-block;
  padding:4px 10px;
  font-size:12px;
  border-radius:999px;
  background:#ffe3d5;
  color:#ff6b3d;
  font-weight:700;
}

.reserve-title{
  font-size:26px;
  font-weight:800;
  margin:0;
}

.reserve-desc{
  font-size:12px;
  margin-top:14px;
  color:#ff6b3d
}

/* 정보 라인들 */
.reserve-info{
  display:flex;
  flex-direction:column;
  gap:6px;
}

.reserve-row{
  display:flex;
  align-items:flex-start;
  gap:12px;
  font-size:14px;
}

.reserve-label{
  font-weight:600;
  color:#666;
  width:70px;
  flex-shrink:0;
}

.reserve-card-place,
.reserve-card-time,
.reserve-card-period,
.reserve-card-price{
  color:#333;
  font-size:14px;
}

/* 가격 강조하고 싶으면 */
.reserve-card-price{
  font-weight:700;
  color:#222;
}



/* 날짜 및 인원수 */

/* 전체: 위에 입력 박스, 아래 버튼 (세로) */
.reserve-bottom-wrap{
  display:flex;
  flex-direction:column;
  align-items:center;
  margin-top:40px;
  gap:24px;
}

/* 날짜 + 인원 박스: 가로 한 줄 + 카드 스타일 */
.reserve-input-row{
  display:flex;
  align-items:flex-end;
  justify-content:center;
  gap:24px;
  padding:20px 24px;
  border:1px solid #eee;
  border-radius:16px;
  background:#fff;
  box-shadow:0 4px 12px rgba(0,0,0,0.04);
  width:1000px;
}

/* 각 필드(라벨 + 인풋) */
.reserve-field{
  display:flex;
  flex-direction:column;
  font-size:14px;
}

.reserve-field label{
  margin-bottom:6px;
  font-weight:600;
}

/* date input */
#datepicker{
  width:240px;
  padding:8px 10px;
  border:1px solid #ddd;
  border-radius:6px;
  font-size:14px;
}

/* 인원 select */
.reserve-select{
  width:200px;
  padding:8px 10px;
  border:1px solid #ff6b3d;
  border-radius:6px;
  font-size:14px;
  color:#333;
}

/* 예약 버튼은 그대로 아래 가운데 */
.reserve-submit{
  padding:12px 60px;
  font-size:16px;
  background-color:#ff6b3d;
  color:#fff;
  border-radius:6px;
  border:none;
  font-weight:600;
  cursor:pointer;
  margin-top:30px;
}

.reserve-submit:hover{
  opacity:0.9;
}

/* 선택 결과 표시 박스 */
.reserve-result{
  width:100%;
  max-width:650px;
  padding:16px 24px;
  border:1px solid #eee;
  border-radius:12px;
  background:#fff;
  box-shadow:0 4px 12px rgba(0,0,0,0.04);

  display:flex;
  flex-direction:column;
  gap:10px;
  font-size:16px;
  font-weight:600;
}

.result-row{
  display:flex;
  justify-content:space-between;
}

/* 숫자 강조 */
#total-price{
  color:#ff6b3d;
  font-weight:700;
}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script type="text/javascript">
  $( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat: "yy-mm-dd DD",
    	altField: "#perfDateHidden", 
    	 altFormat: "yy-mm-dd",  
    	dayNamesMin: ["일" ,"월", "화", "수", "목", "금", "토"],
    	dayNamesShort: ["일" ,"월", "화", "수", "목", "금", "토"],
    	dayNames: ["일요일","월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
    	monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
    	numberOfMonths: 1,
    	showButtonPanel: true,
		  minDate: new Date("${p.perfStartDate}"),
		  maxDate: new Date("${p.perfEndDate}")
    });
  } );

  </script>
  <script>
  
  $(function(){
		$("#btn").click(function(){
			chkNull();
		});//click
		$("#datepicker").keydown(function(evt){
			//엔터가 눌러졌을때 만 null 유효성 검증
			if(evt.which == 13){
				chkNull();
			}//end if
		});//keydown
	});//ready

	function chkNull(){
	  const userNum = "<%= session.getAttribute("UserNum")==null ? "" : session.getAttribute("UserNum") %>";

	  if(userNum === ""){
	    alert("로그인이 필요합니다.");

	    location.href = "<%= request.getContextPath() %>/login/loginPg_Include.jsp";
	    return;
	  }
	

		  
			var datepicker=$("#datepicker").val();
			if(datepicker.replace(/ /g,"")==""){
				alert("날짜를 선택해주세요.");
				$("#datepicker").focus();
				return;
			}//end if
			$("#frm").submit();
		}
	
  
  $(function() {
    // 기본 가격 (한 티켓 가격)
    const pricePerPerson = ${p.perfPrice};

    // 총 금액 계산 함수
    function updateTotalPrice(){
      let people = parseInt($("#people").val(), 10);
      let total = people * pricePerPerson;
      $("#total-price").text(total.toLocaleString() + "원");
    }

    // 날짜 선택 시 업데이트
    $("#datepicker").on("change", function(){
      let date = $(this).val();
      $("#selected-date").text(date === "" ? "-" : date);
      updateTotalPrice();
    });

    // 인원 변경 시 업데이트
    $("#people").on("change", function(){
      updateTotalPrice();
    });

    // 페이지 처음 로드될 때 한 번 계산
    updateTotalPrice();
  });
</script>
<c:set var="minimenu_title" value="즐길거리" scope="session"/>
	<c:set var="minimenu_sub" value="공연" scope="session"/> 
	<c:set var="folder_name" value="attraction" scope="session"/>
	
  
</head>
<body>
<form name="frm" id="frm" action="payment.jsp" method="post">
<input type="hidden" name="perfDate" id="perfDateHidden">
<input type="hidden" name="perfNum" value="${p.perfNum}">
<input type="hidden" name="pResDate" value="${param.pResDate}">
<input type="hidden" name="memberNum" value="${ sessionScope.UserNum }">
<input type="hidden" name="userId" value="${ sessionScope.UserId }">
<input type="hidden" name="userName" value="${ sessionScope.UserName }">

<%-- <input type="hidden" name="memberNum" value="<%= session.getAttribute("memberNum") %>"> --%>


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
    <div class="event-banner-title">
    공연</div>
  </div>

  <div class="event-content">

    <!-- 탭 -->
    <div class="event-tab-row">
      <div class="event-tabs">
        <div class="event-tab">
        예약하기</div>
      </div>
    </div>

<div class="reserve-card">
  <div class="reserve-card-img">
    <img src="../upload/${p.perfPreview}" alt="뮤지컬 보더라인 포스터">
  </div>

  <div class="reserve-card-body">
    <div class="reserve-header">
      <span class="reserve-tag" >공연</span>
      <h3 class="reserve-title">${p.perfTitle}</h3><br>
      <h5 class="reserve-desc">${p.perfSubTitle}</h5>
    </div>

    <div class="reserve-info">
      <div class="reserve-row">
        <span class="reserve-label">장소</span>
        <span class="reserve-card-place">
        <c:choose>
 	<c:when test="${p.perfLoc == 1}">
    대형메인홀
  	</c:when>
  	<c:when test="${p.perfLoc == 2}">
    소극장
  	</c:when>
  	<c:when test="${p.perfLoc == 3}">
    콘서트홀
  	</c:when>
  	<c:otherwise>
    위치정보 없음
  	</c:otherwise>
  	</c:choose>
  	</span>
  	</div>
	

      <div class="reserve-row">
        <span class="reserve-label">관람일시</span>
        <span class="reserve-card-time"> ${p.perfStartDate} ~ ${p.perfEndDate}<br>${p.perfTime}</span>
      </div>

      <div class="reserve-row">
        <span class="reserve-label">소요시간</span>
        <span class="reserve-card-period">
        ${p.perfShowTime}분
        </span>
      </div>

      <div class="reserve-row">
        <span class="reserve-label">가격</span>
        <span class="reserve-card-price">${p.perfPrice}원</span>
      </div>
    </div>
  </div>
</div>


		<div class="reserve-bottom-wrap">
		
		  <div class="reserve-input-row">
		    <div class="reserve-field">
		      <label for="datepicker">Date</label>
		      <input type="text" name="perfDateView" id="datepicker" readonly>
		    </div>
		
		    <div class="reserve-field">
		      <label for="people">인원수</label>
		      <select id="people" name="pResPerson" class="reserve-select">
		        <option value="1">1명</option>
		        <option value="2">2명</option>
		        <option value="3">3명</option>
		        <option value="4">4명</option>
		        <option value="5">5명</option>
		        <option value="6">6명</option>
		        <option value="7">7명</option>
		        <option value="8">8명</option>
		        <option value="9">9명</option>
		        <option value="10">10명</option>
		      </select>
		    </div>
		<div class="reserve-result">
  <div class="result-row">
    <span>선택한 날짜 :</span>
    <span id="selected-date">-</span>
  </div>
  <div class="result-row">
    <span>총 금액 :</span>
    <span id="total-price">0원</span>
  </div>
</div>
		  </div>
		
		  <button type="button" class="reserve-submit" id="btn">예약하기</button>
		</div>



  </div>
</div>
		</div>
	<!-- 푸터 -->
	<div id="footer"  >
		<jsp:include page="../include/footer.jsp"/>
	</div>
</form>
</body>
</html>
