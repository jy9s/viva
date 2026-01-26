<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/siteproperty.jsp" %>
<!-- 메인화면 디자인 시작 -->
<style type="text/css">
/* 사진 슬라이드 */
/* 캐러셀을 컨테이너 밖 레이어로 띄우기 */
#mainCarousel {
    position: relative;
    z-index: 999;
        overflow: hidden;
}


#mainCarousel .carousel-item img {
	width: 100%;
	height: 650px;
	object-fit: cover;
}

.carousel-control-prev, .carousel-control-next {
	z-index: 9999 !important; /* 정보 카드(10)보다 높게 설정 */
}

/* 메인 정보 카드 */

/* 카드 올리기 */
.mainWrap {
	position: relative; /* 카드 위치 기준 */
	padding-bottom: 100px; /* 카드 아래 여백 */
	max-width: 1200px;
	margin-left: auto;
	margin-right: auto;
}

.main-info-card {
	position: relative; /* absolute → relative */
	top: -80px; /* Carousel 아래 살짝 겹치기 */
	margin: 0 auto 50px;
	width: 85%;
	max-width: 1200px;
	background: #fff;
	border-radius: 25px;
	padding: 35px 45px;
	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.08);
	display: flex;
	justify-content: space-between;
	align-items: center;
	z-index: 9999;
}

/* 왼쪽 운영시간 */
.left-info {
	display: flex;
	align-items: center;
	gap: 20px;
}

.left-info h3 {
	font-size: 22px;
	font-weight: 700;
}

.today-title {
	margin: 5px 0 0;
	font-size: 14px;
	color: #777;
}

.today-time {
	font-size: 18px;
	font-weight: 700;
	color: #1a73e8;
}

.info-icon {
	width: 70px;
	border-radius: 50%;
}

/* 오른쪽 메뉴 아이콘 */
.right-menu-icons a {
	text-decoration: none;
	color: inherit;
}

.right-menu-icons {
	display: flex;
	align-items: center;
	gap: 45px;
}

.menu-box {
	text-align: center;
	font-size: 14px;
	font-weight: 500;
}

.menu-box img {
	width: 45px;
	height: 45px;
	display: block;
	margin: 0 auto 8px;
}


.carousel-control-next {
    right: 20px !important;   /* 버튼을 화면 안쪽으로 */
    width: 60px;
    opacity: 1 !important;
    display: flex !important;
    z-index: 99999 !important;
}

.carousel-control-prev {
    left: 20px !important;
    width: 60px;
    opacity: 1 !important;
    display: flex !important;
    z-index: 99999 !important;
}


/* 메인화면 디자인 끝 */
</style>


<!-- 메인 전체 Wrap -->
	<!-- 메인 사진 슬라이드 -->
	<div id="mainCarousel" class="carousel slide" data-bs-ride="carousel" style=" z-index:0;">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#mainCarousel"
				data-bs-slide-to="0" class="active"></button>
			<button type="button" data-bs-target="#mainCarousel"
				data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#mainCarousel"
				data-bs-slide-to="2"></button>
			<button type="button" data-bs-target="#mainCarousel"
				data-bs-slide-to="3"></button>
		</div>
		<div class="carousel-inner" >
			<div class="carousel-item active" >
				<img src="${CommonURL}/images/maincard4.png" class="d-block w-100"
					alt="메인 배너1">
					
			</div>
			<div class="carousel-item">
				<img src="${CommonURL}/images/maincard2.png" class="d-block w-100"
					alt="메인 배너2">
			</div>
			<div class="carousel-item">
				<img src="${CommonURL}/images/maincard3.png" class="d-block w-100"
					alt="메인 배너3">
			</div>
			<div class="carousel-item">
				<img src="${CommonURL}/images/maincard1.png" class="d-block w-100"
					alt="메인 배너4">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#mainCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#mainCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
<div class="mainWrap">

	<!-- 메인 정보 카드 -->
	<div class="main-info-card">
		<div class="left-info">
			<img src="${CommonURL}/images/cutiee.png" class="info-icon">
			<div>
				<h3>비바 파크</h3>
				<p class="today-title">오늘의 운영시간</p>
				<p class="today-time">10:00 ~ 21:00</p>
			</div>
		</div>

		<div class="right-menu-icons">
			<a href="${CommonURL}/pay/ticketPrice.jsp" class="menu-box"> <img
				src="${CommonURL}/images/icon_ticket.png">
				<span>티켓요금</span>
			</a> <a href="${CommonURL}/perf/perform.jsp?filter=all" class="menu-box"> <img
				src="${CommonURL}/images/icon_event.png">
				<span>이달의 행사</span>
			</a> <a href="${CommonURL}/giftShop/viva_Gift_main.jsp" class="menu-box"> <img
				src="${CommonURL}/images/icon_gift.png">
				<span>기념품</span>
			</a> <a href="${CommonURL}/info/user_guide2.jsp" class="menu-box"> <img
				src="${CommonURL}/images/icon_info.png">
				<span>운영/운휴</span>
			</a> <a href="${CommonURL}/mypage/Mypage.jsp" class="menu-box"> <img
				src="${CommonURL}/images/icon_mypage.png">
				<span>마이페이지</span>
			</a>
		</div>
	</div>

</div>
<!-- 메인 끝 -->
<!-- Bootstrap 필수: Carousel 동작하려면 이게 필요 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>