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

<style type="text/css">
#wrap {
	margin: 0px auto;
	width: auto;
}

#container {
	height: auto;
}

#inner{
	width: 80%;
	margin: 0px auto;
	border-radius: 30px;
}


.contextWrapper{
	margin: 0px auto;
	border-radius: 30px;
}

#title {
	background-color: #00FF00;
	height: 120px;
	font-size: 60px;
	text-align: center;
	padding: 20px;
}

#miniMenu, .miniMenuSub, .contextWrapper {
	/* 자식 div 가로로 배열하기 위함 */
	display: flex;
	font-family: NotoSansKR;
	color: gray;
}

.share-button {
	background-color: #fff;
	color: #ff6b00;
	border: 1px solid #ff6b00;
	border-radius: 5px;
	padding: 10px 25px;
	font-size: 18px;
	cursor: pointer;
	transition: background-color 0.2s, color 0.2s, border-color 0.2s;
}

.share-button:hover {
	background-color: #ff6b00;
	color: #fff;
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

.contextWrapper {
	border: 2px solid #eee;
	margin-bottom: 40px;
}
</style>

<!-- 주의사항 1번부터 시작 -->
<style>
.context {
	max-width: 1200px;
	margin-left: 60px;
	margin-top: 30px;
	margin-bottom: 30px;
	font-family: sans-serif;
	line-height: 1.5;
}

.title {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 10px;
}

.desc {
	color: #555;
	margin-bottom: 30px;
	margin-left: 40px;
	margin-right:40px;
}

.grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 30px;
}

.item {
	display: flex;
	align-items: flex-start;
	gap: 15px;
}

.icon {
	font-size: 32px;
	width: 40px;
}

.text-title {
	font-weight: bold;
	margin-bottom: 3px;
}

.text-desc {
	color: #666;
	font-size: 14px;
}

.numbering {
	/* 배경 설정 */
	background-color: #ff6600; /* 예시 주황색, 이미지에 보이는 색상 */
	color: white; /* 텍스트 색상 */
	/* 동그라미 모양 만들기 */
	display: inline-block; /* 너비/높이/패딩 적용을 위해 필수 */
	width: 30px; /* 원하는 너비 */
	height: 30px; /* 원하는 높이 (너비와 동일하게 설정) */
	border-radius: 50%; /* 동그라미를 만들기 위해 width/height의 절반 또는 50% 지정 */
	/* 숫자 중앙 정렬 */
	text-align: center;
	line-height: 20px; /* height와 동일하게 설정하여 수직 중앙 정렬 (단일 라인일 경우) */
	font-weight: bold;
	padding-top: 3px;
	/* 텍스트와의 간격 조정 (선택 사항) */
	margin-right: 5px;
	margin-bottom: 5px;
	font-weight: normal;
	font-size: 15px;
	font-family: NotoSansKR;
	vertical-align: middle;
}
</style>



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
				<img src="${CommonURL }/images/house.png" />
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
						이용안내</button>
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
				이용안내</div>



			<!-- 파크 이용 안내 타이틀 아래 이미지와 텍스트 -->
			<div style="height: 500px">
				<div id="parkSubTitleWrapper" style="position: relative">
					<div
						style="display: flex; align-items: center; justify-content: center">
						<img src="http://192.168.10.72/jsp_prj/common/images/poppy.png"
							style="width: 200px"> <img
							src="http://192.168.10.72/jsp_prj/common/images/bibi.png"
							style="width: 170px;">
					</div>
					<div
						style="width: 100%; height: 250px; background-color: #F8F8F8; position: absolute; top: 150px; border-radius: 50px">

						<div
							style="text-align: center; font-family: NotoSansKR; font-size: 20px; font-weight: bold; color: #807979; margin-top: 70px">
							손님 여러분의 안전하고 즐거운 추억을 위하여</div>
						<div
							style="text-align: center; font-family: NotoSansKR; font-size: 40px; font-weight: bold; margin-top: 15px">
							이것만은 꼭 지켜주시기 바랍니다.</div>
					</div>
				</div>
			</div>



			<div class="contextWrapper">
				<div class="context">
					<div class="title">
						<span class="numbering">1</span> 다음의 내용들은 가지고 입장하실 수 없어요.
					</div>
					<div class="desc">안전하고 쾌적한 파크 환경을 위해 다음의 내용들은 입장 시에 제한하고 있으니
						양해 부탁드립니다. 이 외에도 다른 손님에게 방해가 되거나 위험하다고 판단되는 물품은 파크 내에서 제재할 수 있습니다.</div>
					<div class="grid">

						<div class="item">
							<div class="icon">🐶</div>
							<div>
								<div class="text-title">반려동물</div>
								<div class="text-desc">(안내견 및 도우미견 제외)</div>
							</div>
						</div>

						<div class="item">
							<div class="icon">🛴</div>
							<div>
								<div class="text-title">자전거, 인라인, 스쿠터 등</div>
								<div class="text-desc">※ 3단계 킥보드 보관이 불가합니다</div>
							</div>
						</div>

						<div class="item">
							<div class="icon">🍺</div>
							<div>
								<div class="text-title">주류 및 불법약품</div>
							</div>
						</div>

						<div class="item">
							<div class="icon">🔥</div>
							<div>
								<div class="text-title">버너</div>
							</div>
						</div>

						<div class="item">
							<div class="icon">📷</div>
							<div>
								<div class="text-title">전문 촬영장비</div>
								<div class="text-desc">(대형 삼각대 및 사다리 등)</div>
							</div>
						</div>

						<div class="item">
							<div class="icon">🕹️</div>
							<div>
								<div class="text-title">드론·리모컨 조종 장난감</div>
							</div>
						</div>

						<div class="item">
							<div class="icon">😡</div>
							<div>
								<div class="text-title">불안감 조성 행위 금지</div>
								<div class="text-desc">(협오스러운 분장, 가면 착용, 흉기 휴대 등)</div>
							</div>
						</div>

						<div class="item">
							<div class="icon">🔊</div>
							<div>
								<div class="text-title">확성기·스피커 등 소음 유발 기기</div>
							</div>
						</div>

						<div class="item">
							<div class="icon">🪣</div>
							<div>
								<div class="text-title">페인트, 몰카, 스프레이, 물감</div>
								<div class="text-desc">롯데월드 시설에 해가 되는 물품</div>
							</div>
						</div>

						<div class="item">
							<div class="icon">🪑</div>
							<div>
								<div class="text-title">돗자리</div>
								<div class="text-desc">(단, 1인용 방석 및 접이식 의자 가능)</div>
							</div>
						</div>

					</div>
				</div>





			</div>
			<div class="contextWrapper">
				<div class="context">
					<div class="title">
						<span class="numbering">2</span> 흡연은 어디서든 가능해요.
					</div>
					<div class="desc">
						비바파크 내 모든 구역은 금연입니다.<br> 스낵바 뒤쪽에 마련되어있는 흡연실에서만 흡연하실 수 있으며,
						미성년자의 흡연은 금지되어 있습니다.
					</div>
				</div>
			</div>

			<div class="contextWrapper">
				<div class="context" style="width: 92%">
					<div class="title">
						<span class="numbering">3</span> 다음의 행위들은 파크에서 금지되어 있습니다.
					</div>
					<div class="desc">
						롯데월드 어드벤처는 다수의 손님이 함께 즐기는 공간입니다.<br> 다른 손님에게 불쾌감이나 불편함을 줄 수
						있는 다음의 행위들은 파크 내에서 하실 수 없습니다.<br> 이 외에도 다른 손님에게 방해가 되거나 위험하다고
						판단되는 행위는 파크 내에서 제재할 수 있습니다.<br> <br>
						<div
							style="background-color: #F8F8F8; padding-top: 20px; padding-bottom: 20px; font-size: 13px;">
							<ul
								style="list-style-position: inside !important; padding-left: 8px">
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">손님들의
									쾌적한 이용과 안전을 위해, 다른 손님에게 불편(혐오감)을 줄 수 있는 분장, 얼굴 식별이 불가능한 악세사리,
									얼굴을 2/3이상 가리는 마스크(의료용 마스크 제외) 등 착용
									<ul style="padding-left: 10px">
										<li
											style="list-style-type: square !important; list-style-position: inside !important;">파크
											내에서 발견 시 보안직원 제지를 받거나, 파크 이용이 제한될 수 있습니다.</li>
									</ul>
								</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">어드벤처
									연기자, CAST와 똑같은 코스튬을 입고 연기자, CAST 행세를 하는 행위</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">분장하고
									있는 롯데월드 어드벤처 연기자, CAST 들을 위해, 방해하거나 불필요한 접촉을 권유하는 행위
									<ul style="padding-left: 10px">
										<li
											style="list-style-type: square !important; list-style-position: inside !important;">특히
											성희롱이나, 성추행 관련 문제는 경찰과 연계하여 엄격히 대처합니다.</li>
									</ul>
								</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">땅바닥에
									끌리거나, 과한 장식 등 다른 손님에게 피해를 주는 복장</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">화장실에서
									다른 의상으로 환복하는 행위로 다른 손님들에게 피해를 주는 경우
									<ul style="padding-left: 10px">
										<li
											style="list-style-type: square !important; list-style-position: inside !important;">어트랙션
											플라이벤처 지하 1층 코믹스에서 환복가능</li>
									</ul>
								</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">퍼레이드나
									공연 전 미리 돗자리를 펴, 깔판을 사용하여 자리를 선점하여 다른 손님들에게 피해를 주는 행위</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">다른
									손님들의 공연 관람에 방해가 되는 사진, 동영상 등 촬영 행위</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">전단지
									배포, 설문조사, 손님 인터뷰 등 다른 손님들의 파크 이용에 불편을 끼치는 행위</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">집회
									및 연설, 허가되지 않은 이벤트 개최</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">물품의
									진열 및 판매 등 영리 목적의 활동을 하는 행위</li>
							</ul>
						</div>
					</div>
				</div>

			</div>







			<div class="contextWrapper" style="width: 100%">
				<div class="context" style="width: 92%">
					<div class="title">
						<span class="numbering">4</span> 어트랙션 이용시에 지켜주세요.
					</div>
					<div class="desc">
						손님 여러분들의 안전을 위해 다음 내용들은 유의해 주시기 바랍니다. <br>
						<div
							style="background-color: #F8F8F8; margin-top: 20px; padding-top: 20px; padding-bottom: 20px; font-size: 13px;">
							<ul style="padding-left: 8px">
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">음식물은
									다 드신 후에 이용해 주시기 바랍니다.</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">탑승
									중에는 카메라, 셀카봉, 핸드폰 사용을 삼가 주세요.</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">어트랙션별
									탑승 기준을 준수해 주시기 바랍니다.</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">손님
									여러분의 안전을 위한 센서로 인해 어트랙션이 급작스럽게 멈출 수 있습니다.</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">어트랙션
									탑승 도중 멈추더라도 당황하지 마시고 직원 안내를 기다려 주세요.</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">현장
									및 기상상황에 따라 예고 없이 어트랙션 운행이 중단될 수 있습니다.</li>
								<li
									style="list-style-type: circle !important; list-style-position: inside !important;">음주
									후 어트랙션 탑승은 불가합니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>








			<div class="contextWrapper">
				<div class="context">
					<div class="title">
						<span class="numbering">5</span> 우리 캐스터들을 존중해 주세요.
					</div>
					<div class="desc">
						명찰을 달고 있는 캐스트를 만난다면 무엇이든 물어보세요.<br> 최대한 친절하게 안내해 드릴 수 있도록
						하겠습니다.<br> 손님의 즐거운 시간을 위해 최선을 다하고 있는 캐스트를 존중해 주세요.<br>
						실수하고 부족하더라도 반말이나 욕설은 삼가주세요.<br> 혹시 불편 및 건의사항이 있으시다면 아래 게시판을
						통해 의견을 남겨주세요. <br>
					</div>
				</div>
			</div>








			<div class="contextWrapper">
				<div class="context">
					<div class="title">
						<span class="numbering">6</span> 재입장에 관하여
					</div>
					<div class="desc">
						재입장하시는 분도 처음 입장 시와 동일하게 보안 검사장에게 보안 검사를 받아야 합니다.<br> 사전에 양해
						바랍니다. 연간 패스 이외의 입장권으로는 재입장할 수 없습니다. <br> ※ 주차장을 이용하시는 분은 사전에
						문의해 주십시오.<br>

					</div>
				</div>
			</div>



			<div style="text-align: center; margin-bottom: 70px;" >
				<a href="#"><input type="button" value="위로 가기"
					class="share-button"></a>
			</div>







		</div>





	<!-- container 끝 -->

	<div id="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</div>
	</div>
</body>
</html>
