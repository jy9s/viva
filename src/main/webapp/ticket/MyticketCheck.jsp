<%@page import="ticket.MyTicketDTO"%>
<%@page import="java.util.List"%>
<%@page import="ticket.MyTicketService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


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

<jsp:include page="/include/vivatemplet_css.jsp"></jsp:include>
<!-- 상세보기 모달 기능 css-->
<style>
/* 변수 설정 */
:root {
	--primary-color: #E91E63; /* 핑크색 (예매번호 아이콘 색상) */
	--background-color: #FFF;
	--header-bg-color: #FFe771; /* 연한 노란색 헤더 배경 */
	--header-bg-color2: #FFFdf5; /* 연한 노란색 헤더 배경 */
	--text-color: #333;
	--border-color: #ddd;
	--padding-base: 16px;
}
.ticketChDiv{
visibility: hidden;
}
.ticketChDiv.open{
visibility: visible;
}
/* 기본 스타일 및 모달 컨테이너 */
.modal-container {
	width: 100%;
	max-width: 350px; /* 모달의 최대 너비 설정 */
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	overflow: hidden;
	margin: 0px auto;
}

/* 모달 헤더 */
.modal-header2 {
	background: linear-gradient(to right, var(--header-bg-color), var(--header-bg-color2));
	padding: var(--padding-base);
	font-weight: bold;
	font-size: 1.1em;
	color: var(--text-color);
	display: flex;
	justify-content: space-between;
	align-items: center;
	z-index: 999;
}

.close-button {
	background: none;
	border: none;
	font-size: 1.5em;
	cursor: pointer;
	color: var(--text-color);
	padding: 0;
	line-height: 1;
}

/* 모달 내용 */
.modal-content {
	padding: var(--padding-base);
	color: var(--text-color);
}

.detail-item {
	display: flex;
	align-items: center;
	margin-bottom: 12px;
	font-size: 0.95em;
}

.detail-item:last-of-type {
	margin-bottom: 0;
}

.icon {
	font-size: 1.2em;
	margin-right: 10px;
	width: 20px; /* 아이콘 너비 통일 */
	text-align: center;
}

.icon.ticket {
	color: #E91E63;
} /* 핑크색 */
.icon.ticket-name {
	color: #FF9800;
} /* 주황색 */
.icon.date {
	color: #607D8B;
} /* 청회색 */
.icon.people {
	color: #9C27B0;
} /* 보라색 */
.icon.payment {
	color: #795548;
} /* 갈색 */
.icon.time {
	color: #00BCD4;
} /* 하늘색 */
.detail-text {
	flex-grow: 1;
}

/* QR 코드 섹션 */
.qr-section {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px 0;
	text-align: center;
}

.qr-code {
	width: 150px;
	height: 150px;
	background-color: #000; /* 이미지 대신 배경색으로 대체 */
	/* 실제 이미지 대신 패턴 모양을 위한 임시 스타일 */
	background-image: repeating-linear-gradient(45deg, #000, #000 10px, #fff 10px, #fff 20px);
	margin-bottom: 10px;
	position: relative;
	overflow: hidden;
	border: 1px solid #ccc; /* 팻말 이미지 주변 경계 */
}

.qr-code::after {
	content: 'A1234567'; /* QR 코드 아래의 예매번호 텍스트 */
	position: absolute;
	bottom: 5px;
	left: 50%;
	transform: translateX(-50%);
	color: #fff;
	font-size: 10px;
	font-family: monospace;
}

.qr-instruction {
	font-size: 0.8em;
	color: #666;
	margin-top: 10px;
}

/* 버튼 섹션 */
.button-group {
	display: flex;
	justify-content: flex-end; /* 오른쪽 정렬 */
	padding: var(--padding-base);
	padding-top: 0; /* QR 코드와 버튼 사이 간격 줄임 */
	border-top: 1px solid var(--border-color);
}

.button {
	padding: 10px 15px;
	border: 1px solid;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
	margin-left: 8px;
	transition: background-color 0.2s;
}

.cancel-button {
	background-color: var(--background-color);
	color: var(--primary-color);
	border-color: var(--primary-color);
}

.cancel-button:hover {
	background-color: #F8BBD0; /* 연한 핑크 */
}

.close-action-button {
	background-color: var(--background-color);
	color: var(--text-color);
	border-color: var(--border-color);
}

.close-action-button:hover {
	background-color: #eee;
}
</style>

<style type="text/css">
.ticket-container {
	max-width: 900px;
	width: 100%;
	text-align: center;
}

/* 제목 스타일 */
.main-title {
	color: #ff6992; /* 핑크색 강조 */
	font-size: 2.2rem;
	font-weight: 700;
	margin-bottom: 5px;
}

.subtitle {
	color: #666;
	font-size: 1rem;
	margin-bottom: 30px;
}

/* 티켓 리스트 컨테이너 */
 .ticket-list {
   display: flex;
   justify-content: center;
   gap: 30px;
   flex-wrap: wrap;

   max-height: 700px;        /* 원하는 고정 높이 */
   overflow-y: auto;         /* 세로 스크롤 생성 */
   overflow-x: hidden;       /* 가로 스크롤 방지 */  
   -webkit-overflow-scrolling: touch;
}

/* 티켓 카드 스타일 */
.ticket-card {
	background-color: white;
	width: 380px; /* 카드 고정 너비 */
	border-radius: 15px; /* 둥근 모서리 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
	overflow: hidden; /* 이미지 플레이스홀더를 위해 */
	padding: 20px;
}


.icon-text {
	color: #888;
	font-size: 1rem;
}

/* 상세 정보 목록 */
.ticket-details {
	text-align: left;
}

.ticket-name {
	font-size: 1.25rem;
	font-weight: 600;
	margin-bottom: 15px;
	color: #333;
}

.info-list {
	list-style: none;
	padding: 0;
	margin-bottom: 20px;
}

.info-list li {
	display: flex;
	align-items: center;
	margin-bottom: 8px;
	font-size: 1rem;
	color: #555;
}

.info-list li .icon {
	margin-right: 10px;
	font-size: 1.1rem;
	/* 아이콘 색상은 이모지에 의해 결정되므로 별도 지정하지 않음 */
}

.info-list li span {
	font-weight: 500;
	color: #333;
}

/* 상세보기 버튼 */
.detail-button {
	width: 100%;
	padding: 12px;
	background-color: #ffdd44; /* 노란색 배경 */
	border: none;
	border-radius: 10px;
	font-size: 1.1rem;
	font-weight: 700;
	color: #333;
	cursor: pointer;
	transition: background-color 0.2s;
}

.detail-button:hover {
	background-color: #fccc00; /* 호버 시 색상 진하게 */
}

/* 작은 화면 대응 (선택 사항) */
@media ( max-width : 850px) {
	.ticket-list {
		flex-direction: column;
		align-items: center;
	}
	.ticket-card {
		width: 100%;
		max-width: 380px;
	}
}
</style>
<script type="text/javascript">


</script>

<%
if(session.getAttribute("UserNum") == null){
    response.sendRedirect(request.getContextPath()+"/login/loginFrm.jsp");
    return;
}

//http://localhost/user_prj2/login/loginFrm.jsp

%> 


<script>
$(function() {
    const contextPath = '<%= request.getContextPath() %>';

    // 티켓 목록 불러오기
$.ajax({
    url: contextPath + "/ticket/MyTicketChkProcess.jsp",
    type: "GET",
    dataType: "JSON",
    success: function(list) {
        let html = "";
        $.each(list, function(i, t){
            html += "<div class='ticket-card'>";
            html += "<div class='ticket-details'>";

            // 🎠 티켓명 (공용)
            let ticketName = t.adultTicket || t.teenTicket || t.childTicket || "이름 없음";
            html += "<h2 class='ticket-name'>" + ticketName + "</h2>";

            html += "<ul class='info-list'>";

            // 🗓️ 이용일
            html += "<li>🗓️ 이용일: " + t.useDate + "</li>";

            // 👥 인원 (0인 항목 제외)
            let personText = [];
            if(t.adultCount > 0) personText.push("성인: " + t.adultCount);
            if(t.teenCount > 0) personText.push("청소년: " + t.teenCount);
            if(t.childCount > 0) personText.push("어린이: " + t.childCount);
            if(personText.length > 0){
                html += "<li>👥 " + personText.join(", ") + "</li>";
            }

            // 💳 결제수단
            html += "<li>💳 결제수단: " + t.payMethod + "</li>";

            html += "</ul>";
            html += "<button class='detail-button' data-resnum='" + t.ticketNum + "'>상세보기</button>";
            html += "</div></div>";
        });
        $("#ticketListArea").html(html);
    },
    error: function(xhr){
        alert("티켓 목록 불러오기 실패: " + xhr.status);
    }
});

    // 상세보기
    $(document).on("click", ".detail-button", function(){
        const ticketNum = $(this).data("resnum");
        $.ajax({
            url: contextPath + "/ticket/MyTicketChkDetailProcess.jsp",
            type: "GET",
            data: { ticketNum: ticketNum },
            dataType: "JSON",
            success: function(t){
                // 🎟️ 예매번호
                $("#resNum").text(t.ticketNum);

                // 🎠 티켓명
                $("#ticketName").text(t.adultTicket); // 여기 티켓 이름은 공용

                // 🗓️ 이용일
                $("#useDate").text(t.useDate);

             // 👥 인원
                let personText = [];
                if(t.adultCount > 0) personText.push("성인: " + t.adultCount);
                if(t.teenCount > 0) personText.push("청소년: " + t.teenCount);
                if(t.childCount > 0) personText.push("어린이: " + t.childCount);

                $("#personCnt").text(personText.join(", ")); // 0인 항목은 출력 안 함

                // 💳 결제수단
                $("#payMethod").text(t.payMethod);

                // ⏰ 예매일시
                $("#resDate").text(t.tResDate);

                // 상세보기 div 열기
                $(".ticketChDiv").addClass("open");

                // 환불 버튼
                $(".cancel-button").attr("onclick", "refundTicket(" + t.ticketNum + ")");
            },
            error: function(xhr){
                alert("상세정보 불러오기 실패: " + xhr.status);
            }
        });
    });
});

// 모달 닫기
function closeDiv(){
    $(".ticketChDiv").removeClass("open");
}

// 환불
function refundTicket(ticketNum){
if(!confirm("정말 환불하시겠습니까?")) {
        return;
    }

    const contextPath = '<%= request.getContextPath() %>';
    $.ajax({
        url: contextPath+ "/ticket/MyTicketRefundProcess.jsp",
        type: "GET",
        data: { ticketNum: ticketNum },
        dataType: "JSON",
        success: function(res){
            if(res.flag){
                alert("환불 완료!");
                // 환불된 티켓 카드 삭제
                $(".detail-button[data-resnum='" + ticketNum + "']").closest(".ticket-card").remove();
            } else {
                alert("환불 실패!");
            }
        },
        error: function(xhr){
            alert("환불 실패: " + xhr.status);
        }
    });
}
</script>

</head>
<body>
	<div class="wrap">
		<!-- 헤더 -->
		<div id="closetop" class="close"></div>
		<div id="header">
			<jsp:include page="/include/header.jsp"></jsp:include>
		</div>
		<!-- 햄버거 메뉴-->
		<jsp:include page="/include/hamberger.jsp"></jsp:include>

		<!-- 메인 공간(비어있는 흰 배경 영역) -->
		<div class="container" style="height: 900px; position: relative;">
			<jsp:include page="/include/page_navi.jsp"></jsp:include>

			<div
				style="max-width: 1000px; margin: 80px auto; background-color: #fff8e7; padding-top: 50px; padding-bottom: 80px; border-radius: 20px;">
				
				
				<div class="ticket-container"
					style="max-width: 1000px; margin: 0px auto;">
					<h1 class="main-title">내 티켓 확인하기</h1>
					<p class="subtitle">예매한 티켓의 상세 정보를 확인하고 입장하세요</p>


					<div class="ticket-list" id="ticketListArea">
					

					</div>
				</div>
			</div>
			<!-- 상세 보기 모달 기능 -->
			<div class= "ticketChDiv"
				style="width: 100%; height: 900px; position: absolute; top: 0px; left: 0px;">
				<div
					style="width: 100%; height: 900px; background-color: #000; z-index: 1; padding-bottom: 100px; opacity: 0.3; position: absolute; top: 0px; left: 0px;"></div>

				<div class="modal-container "
					style="position: relative; z-index: 3; margin-top: 100px;">
					<div class="modal-header2">
						<span>예매 상세</span>
						<button class="close-button" onclick="closeDiv()">&times;</button>
					</div>

					<div class="modal-content" style="z-index: 2;">
						    <div class="detail-item">
			        <span class="icon ticket">🎟️</span>
			        <div class="detail-text">
			            예매번호: <span id="resNum"></span>
			        </div>
			    </div>
			
			    <div class="detail-item">
			        <span class="icon ticket-name">🎠</span>
			        <div class="detail-text">
			            티켓명: <span id="ticketName"></span>
			        </div>
			    </div>
			
			    <div class="detail-item">
			        <span class="icon date">🗓️</span>
			        <div class="detail-text">
			            이용일: <span id="useDate"></span>
			        </div>
			    </div>
			
			    <div class="detail-item">
			        <span class="icon people">👥</span>
			        <div class="detail-text">
			            인원: <span id="personCnt"></span>
			        </div>
			    </div>
			
			    <div class="detail-item">
			        <span class="icon payment">💳</span>
			        <div class="detail-text">
			            결제수단: <span id="payMethod"></span>
			        </div>
			    </div>
			
			    <div class="detail-item">
			        <span class="icon time">⏰</span>
			        <div class="detail-text">
			            예매일시: <span id="resDate"></span>
			        </div>
			    </div>

						<div class="qr-section">
							<div class="qr-code"></div>
							<div class="qr-instruction">QR 코드를 입장 시 제시하세요.</div>
						</div>
					</div>

					<div class="button-group" style="padding: 10px;">
						<button class="button cancel-button" onclick="refundTicket()">
							티켓 취소하기</button>
						<button class="button close-action-button"
							onclick="closeDiv()">닫기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- container 끝 -->

		<div id="footer">
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
