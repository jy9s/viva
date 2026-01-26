<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/siteproperty.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>

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
#wrap {
	margin: 0px auto;
	width: 100%;
	height: 1000px;
}

#container {
	margin-bottom: 20px;
}

#inner, inner2 {
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
	/* 자식 div 가로로 배열하기 위함 */
	display: flex;
	font-family: NotoSansKR;
	color: gray;
}

.nav-item.dropdown {
	margin-left: 10px;
}

#miniHome {
	height: 30px;
}

li {
	list-style: none;
}

.nav-link {
	cursor: pointer;
}

.bus-num, .sub-num {
	display: flex;
}

.bus-type-div, .sub-type-div {
	margin: 0px; auto;
	width: 100px;
	height: 40px;
	text-align: center;
}

.bus-type, .sub-type {
	display: inline-block;
	padding: 1px 8px; /* 위/아래 3px, 좌/우 8px 여백 추가 */
	border-radius: 4px;
	text-align: center;
	color: white;
}

.sub-type {
	border-radius: 50px;
}

<
style> /* 전체 섹션 스타일 */ .shuttle-info-section {
	max-width: 800px; /* 적절한 너비 설정 */
	margin: 20px auto;
	font-family: Arial, sans-serif;
	line-height: 1.5;
}

/* 제목 스타일 */
.shuttle-info-section h2 {
	font-size: 1.5em;
	font-weight: bold;
	margin-bottom: 5px;
}

.shuttle-info-section p {
	color: #666;
	margin-bottom: 20px;
}

<
style> /* -------------------- 셔틀버스 테이블 스타일 -------------------- */
	.custom-table {
	border-top: 2px solid #000;
	width: 100%;

	/* 1. 테이블 전체에 오른쪽 테두리 추가 */
}

/* 테이블 헤더 및 행 스타일 */
.table-header, .table-row {
	display: flex;
	border-bottom: 1px solid #ddd;
	border-top: 1px solid #ddd;
	align-items: center;
}

.table-header {
	font-weight: bold;
	background-color: #f7f7f7;
	/* 헤더의 경우, 상단 검은색 테두리 아래에만 회색 선이 오도록 설정 가능 */
	/* border-top: 1px solid #ddd; */
}

/* 테이블 셀 스타일 */
.table-cell {
	flex: 1 1 0;
	padding: 14px 10px;
	text-align: center;
	/* 2. 모든 셀에 오른쪽 구분선 유지 */
	border-right: 1px solid #ddd;
	border-left: 1px solid #ddd;
}

/* -------------------- 주의사항 박스 디자인 복구 -------------------- */
.notes-box {
	margin-top: 20px;
	background-color: #f7f7f7;
	/* 이미지에 맞게 내부 패딩을 약간 늘리고 미세 조정 */
	padding: 18px 25px;
}

.notes-box ul {
	list-style-type: none;
	padding-left: 0;
	margin: 0;
	/* 텍스트 크기를 약간 줄여 (0.95em) 가독성 확보 */
	font-size: 0.95em;
	/* 글씨색을 조금 더 진한 회색 (#333)으로 지정 */
	color: #333;
	/* 각 항목 간 간격(줄 높이)을 늘려 시각적 여백 확보 */
	line-height: 1.6;
}

.notes-box li::before {
	content: "•"; /* * 대신 • (점) 기호 사용 */
	font-weight: normal;
	color: #333;
	display: inline-block;
	width: 0.8em; /* 기호와 텍스트 사이의 간격 조정 */
	margin-left: -0.8em;
	vertical-align: top; /* 기호의 수직 정렬을 위로 맞춰 텍스트와 균형 */
}
</style>

<style>
/* ------------------------------------------------ */
/* 1. 주차 안내 제목 및 굵은 구분선 스타일 */
/* ------------------------------------------------ */
/* h1 태그 자체의 마진과 여백을 조정할 수 있도록 클래스 지정 */
.parking-title-section {
	padding-top: 0;
	padding-bottom: 0;
	margin-bottom: 0; /* 제목 아래 기본 여백 제거 */
}

/* 굵은 검은색 구분선 */
.title-separator {
	border: none;
	border-bottom: 3px solid #000; /* 굵은 검은색 선 */
	margin-top: 20px; /* 제목과의 간격 */
	margin-bottom: 30px; /* 테이블과의 간격 */
	width: 100%;
}

/* ------------------------------------------------ */
/* 2. 롯데월드 주차 할인 테이블 (<table> 기반) 스타일 */
/* ------------------------------------------------ */

/* 테이블 전체를 감싸는 래퍼: 둥근 모서리, 그림자, 중앙 정렬 */
.table-container-wrapper {
	width: 100%;
	max-width: 600px; /* 이미지와 유사한 너비 */
	margin: 0 auto; /* 테이블을 중앙에 배치 */
	border-radius: 8px; /* 둥근 모서리 */
	overflow: hidden; /* 자식 요소가 모서리 밖으로 넘어가지 않도록 */
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 미세한 그림자 */
	border: 1px solid #e0e0e0; /* 전체 테이블의 얇은 회색 테두리 */
}

/* 실제 테이블 요소 */
.lotteworld-parking-table {
	width: 100%;
	border-collapse: collapse;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	color: #333;
}

/* 최상단 캡션/제목 셀 스타일 */
.lotteworld-parking-table .table-title {
	background-color: #f7f7f7;
	font-weight: bold;
	text-align: center;
	padding: 14px 10px;
	border-bottom: 1px solid #e0e0e0;
	color: #333;
}

/* 헤더 행의 셀 스타일 */
.lotteworld-parking-table th {
	background-color: #f7f7f7;
	padding: 14px 10px;
	border-bottom: 1px solid #e0e0e0;
	font-weight: bold;
	text-align: center;
	color: #333;
}

/* 첫 번째 헤더 셀 (주차시간)의 오른쪽 테두리 */
.lotteworld-parking-table th.col-parking-time {
	border-right: 1px solid #e0e0e0;
}

/* 데이터 행의 셀 스타일 */
.lotteworld-parking-table td {
	padding: 20px 10px; /* 상하 여백 20px로 칸 높이 확보 (이미지 일치) */
	text-align: center;
	border-bottom: 1px solid #e0e0e0;
	color: #555;
}

/* 데이터 셀의 오른쪽 테두리 */
.lotteworld-parking-table td:first-child {
	border-right: 1px solid #e0e0e0;
}

/* 마지막 데이터 행의 하단 테두리 제거 (이미지 일치) */
.lotteworld-parking-table tbody tr:last-child td {
	border-bottom: none;
}

/* ------------------------------------------------ */
/* 3. 공유하기 버튼 스타일 */
/* ------------------------------------------------ */
.share-button-wrapper {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 30px; /* 하단 여백 추가 */
}

.share-button {
	background-color: #fff;
	color: #ff6b00;
	border: 1px solid #ff6b00;
	border-radius: 5px;
	padding: 10px 25px;
	font-size: 1em;
	cursor: pointer;
	transition: background-color 0.2s, color 0.2s, border-color 0.2s;
}

.share-button:hover {
	background-color: #ff6b00;
	color: #fff;
}
</style>


<style>
#miniMenu, .miniMenuSub, .nav-link-mini {
	font-family: 'NotoSansKR', sans-serif !important;
	text-decoration: none !important;
	color: gray;
}

.nav-link:hover {
	color: gray;
}

body {
	font-family: NotoSansKR;
}

/* 메인 컨텐츠 여백 */
.container {
	height: auto;
	margin-top: 100px;
}
</style>

<script>
	$(document).ready(
			function() {
				$(document).on(
						"click",
						"ul.tabs li > a",
						function() {

							var tab_id = $(this).attr("data-tab");

							$("ul.tabs li > a").removeClass("active").parent()
									.addClass('text-bg-light');
							$(".tab-content").removeClass("current");
							$(this).addClass("active").parent().removeClass(
									'text-bg-light');
							$("#" + tab_id).addClass("current");
						})
			})
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

		<!-- 메인 공간(비어있는 흰 배경 영역) -->
		<div class="container">
			<div class="page_navi"
				style="margin-bottom: 20px; margin-left: 100px; margin-top: 40px;">
				<a href="${CommonURL }/main/mainPg_Include.jsp"><img src="${CommonURL }/images/house.png" /></a>
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-offset="20, 0"
						style="background-color: #fff; color: #333; border: none; padding: 0px; margin-left: 10px; font-size: 13px;">
						이용정보</button>
					<jsp:include page="../include/page_navi.jsp"></jsp:include>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-offset="15, 0"
						style="background-color: #fff; color: #333; border: none; padding: 0px; margin-left: 10px; font-size: 13px;">
						오시는길</button>
					<ul class="dropdown-menu dropdown-menu-end"
						style="width: 100px !important; min-width: 60px !important;">
						<li><a href="${CommonURL }/info/user_guide2.jsp"
							style="margin: 5px 10px">오시는길</a></li>
						<li><a href="${CommonURL }/info/user_guide1.jsp"
							style="margin: 5px 10px">운영/운휴</a></li>
						<li><a href="${CommonURL }/info/user_guide3.jsp"
							style="margin: 5px 10px">이용안내</a></li>
					</ul>
				</div>
			</div>



			<div
				style="font-size: 50px; font-family: NotoSansKR; font-weight: bold; text-align: center; padding: 5px; height: 150px;">
				오시는길</div>

		





		<section class="gogle_marp">
			<div id="mapWrap" style="width: 80%; margin: 0px auto">
				<div id="map" style="width: 100%; height: 500px;">

					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.134121204791!2d127.05059697629447!3d37.50475472766779!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca1c32408f9b7%3A0x4e3761a4f356d1eb!2z7IyN7Jqp6rWQ7Jyh7IS87YSw!5e0!3m2!1sko!2skr!4v1764141440021!5m2!1sko!2skr"
						width="600" height="450" style="border: 0; width: 100%"
						allowfullscreen="" loading="lazy"
						referrerpolicy="no-referrer-when-downgrade"></iframe>

				</div>
				<div class="box box02">
					<div class="flex">
						<div class="icon01">
							<p>
								<i class="map"></i>
							</p>
						</div>
						<dl class="980_line">
							<dt>(우)06193 서울특별시 강남구 테헤란로 412 비바파크</dt>
							<dd>
								<a
									href="https://map.kakao.com/link/map/대치동890,37.504858565068,127.05326470511"
									target="_blank"><button type="button"
										class="btn btn-outline-secondary">
										<img
											src="${CommonURL }/images/icon_kakaomap.png">
										Kakao Map
									</button></a> <a href="https://map.naver.com/v5/search/서울특별시 강남구 테헤란로 412"
									target="_blank">
									<button type="button" class="btn btn-outline-secondary">
										<img
											src="${CommonURL }/images/icon_navermap.png"
											style="width: 40px"> Naver Map
									</button>
								</a>
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</section>


		<main class="sub0304">
			<ul class="nav nav-tabs tabs d-flex">
				<li class="nav-item flex-fill"><a class="nav-link active"
					aria-current="page" data-tab="tab-1">버스</a></li>
				<li class="nav-item flex-fill text-bg-light"><a
					class="nav-link" aria-current="page" data-tab="tab-2">지하철</a></li>
				<li class="nav-item flex-fill text-bg-light"><a
					class="nav-link" aria-current="page" data-tab="tab-3">자가용</a></li>
			</ul>
		</main>


		<!-- 버스 메뉴 -->

		<div id="tab-1" class="tab-content current">
			<main class="sub0304">
				<section>
					<div class="box box01">
						<h1 style="font-weight: bold">버스 이용 시</h1>
					</div>


					<div style="display: flex; margin-top: 80px; margin-bottom: 80px">
						<div
							style="width: 120px; height: 120px; display: flex; align-content: center; justify-content: center; background-color: lightgray; border-radius: 50%; align-items: center">
							<svg width="80" height="80" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="6" y="1" width="36" height="40" rx="6" fill="var(--iconColor, #005E3C)"></rect><path d="M11 41H17V45C17 46.1046 16.1046 47 15 47H13C11.8954 47 11 46.1046 11 45V41Z" fill="var(--iconColor, #005E3C)"></path><path d="M31 41H37V45C37 46.1046 36.1046 47 35 47H33C31.8954 47 31 46.1046 31 45V41Z" fill="var(--iconColor, #005E3C)"></path><rect x="6" y="10.5" width="36" height="17" fill="#F6F6F6"></rect><path d="M2 9.5C2 8.39543 2.89543 7.5 4 7.5H6V20.5H4C2.89543 20.5 2 19.6046 2 18.5V9.5Z" fill="var(--iconColor, #005E3C)"></path><path d="M46 18.5C46 19.6046 45.1046 20.5 44 20.5L42 20.5L42 7.5L44 7.5C45.1046 7.5 46 8.39543 46 9.5L46 18.5Z" fill="var(--iconColor, #005E3C)"></path><circle cx="13.5" cy="34" r="3.5" fill="#F6F6F6"></circle><circle cx="34.5" cy="34" r="3.5" fill="#F6F6F6"></circle><rect x="6" y="10" width="3" height="18" fill="var(--iconColor, var(--iconColor, #005E3C))"></rect><rect x="39" y="10" width="3" height="18" fill="var(--iconColor, var(--iconColor, #005E3C))"></rect></svg>
						</div>
						<div>
							<ul>
								<li class="bus-num">
									<div class="bus-type-div">
										<span class="bus-type" style="background-color: #62AF1E">지선</span>
									</div>
									<div>
										<span>3217번, 3313번, 3314번, 3315번, 3317번, 3411번, 3414번,
											4319번</span>
									</div>
								</li>
								<li class="bus-num">
									<div class="bus-type-div">
										<span class="bus-type" style="background-color: #D63A3C">광역</span>
									</div>
									<div>
										<span>1007-1번, 1100번, 1700번, 2000번, 6900번, 7007번, 8001번</span>
									</div>
								</li>
								<li class="bus-num">
									<div class="bus-type-div">
										<span class="bus-type" style="background-color: #3369BC">간선</span>
									</div>
									<div>
										<span>301번, 341번, 360번, 362번</span>
									</div>
								</li>
								<li class="bus-num">
									<div class="bus-type-div">
										<span class="bus-type" style="background-color: #9E7940">공항</span>
									</div>
									<div>
										<span>6000번, 6006번, 6705번, 6706A번</span>
									</div>
								</li>
							</ul>
						</div>

					</div>
					<!--//box box02 -->


				</section>
				<div class="shuttle-info-section">
					<h2>지방 정기 셔틀버스 이용 시</h2>
					<p>지방에서 비바파크를 편하게 오고 싶으신가요? 셔틀버스를 이용해보세요!</p>

					<div class="custom-table">
						<div class="table-header">
							<div class="table-cell">소재지</div>
							<div class="table-cell">여행사명</div>
							<div class="table-cell">연락처</div>
						</div>

						<div class="table-row">
							<div class="table-cell">광양, 순천</div>
							<div class="table-cell">해피투어</div>
							<div class="table-cell">061-761-4146</div>
						</div>

						<div class="table-row">
							<div class="table-cell">광주</div>
							<div class="table-cell">아시아 여행사</div>
							<div class="table-cell">062-225-3456</div>
						</div>

						<div class="table-row">
							<div class="table-cell">대전</div>
							<div class="table-cell">미르 여행사</div>
							<div class="table-cell">042-471-0970</div>
						</div>
					</div>

					<div class="notes-box" style="margin-bottom:100px;">
						<ul>
							<li>해당되는 지역 확인 후, 여행사 번호로 문의 바랍니다.</li>
							<li>상기 리스트는 비바파크 공식 지정 파트너사임을 확인합니다.</li>
							<li>소재지 가나다순으로 정렬하였습니다.</li>
						</ul>
					</div>
				</div>
			</main>
		</div>


		<!-- 지하철 메뉴 -->

		<div id="tab-2" class="tab-content">
			<main class="sub0304">
				<section>
					<div class="box box01">
						<h1 style="font-weight: bold">지하철 이용 시</h1>
					</div>


					<div style="display: flex; margin-top: 80px; margin-bottom: 80px">
						<div
							style="width: 120px; height: 120px; display: flex; align-content: center; justify-content: center; background-color: lightgray; border-radius: 50%; align-items: center">
							<img src="${CommonURL }/images/subway.png"
								style="width: 80px; height: 80px">
						</div>
						<div>
							<ul>
								<li class="sub-num">
									<div class="sub-type-div">
										<span class="sub-type" style="background-color: #62AF1E">2</span>
									</div>
									<div>
										<span>선릉역 1번 출구</span>
									</div>
								</li>
								<li class="sub-num">
									<div class="sub-type-div">
										<span class="sub-type" style="background-color: #FABE00">분</span>
									</div>
									<div>
										<span>선릉역 9번 출구</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<!--//box box02 -->
				</section>
			</main>
		</div>

		<!--  자가 이용시 -->

		<div id="tab-3" class="tab-content">
			<main class="sub0304">
				<section>
					<div class="box box01">
						<h1 style="font-weight: bold">주차 안내</h1>
					</div>



					<div class="shuttle-info-section" style="margin-top: 60px;">
						<div class="custom-table">
							<div class="table-header">
								<div class="table-cell">비바파크 이용권 인증 시</div>
							</div>
							<div class="table-header">
								<div class="table-cell">주차시간</div>
								<div class="table-cell">할인적용</div>
							</div>

							<div class="table-row">
								<div class="table-cell">~3시간 이하(~3시간)</div>
								<div class="table-cell">무료</div>
							</div>

							<div class="table-row">
								<div class="table-cell">3시간 초과 (3시간~)</div>
								<div class="table-cell">최대 3천원 (시간관계 無)</div>
							</div>
							<div style="height: 100px;"> </div>

						</div>





					</div>

					<!-- <div class="share-button-wrapper">
						<button class="share-button">공유하기</button>
					</div> -->

					<!--//box box02 -->
				</section>
			</main>
		</div>



</div>



		<!-- container 끝 -->







		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
