<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/siteproperty.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>
<!-- bootstrap cdn -->
<slink
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
<!-- 제목 inputbox -->
<style>
.input-container {
	/* 부모 컨테이너 역할 */
	width: 100%;
	max-width: 1200px; /* 입력 필드의 최대 너비 설정 */
	margin: 30px auto; /* 중앙 정렬 */
}

.input-container input {
	/* 실제 입력 필드 스타일 */
	width: 100%;
	height: 50px; /* 높이 고정 (padding에 따라 조절 가능) */
	padding: 10px 25px; /* 내부 여백 */
	font-size: 1.1em; /* 폰트 크기 */
	/* 모양 구현 */
	border: 1px solid #ddd; /* 옅은 테두리 */
	border-radius: 5px; /* 둥근 모서리 */
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05); /* 은은한 그림자 (선택 사항) */
	background-color: #fff;
	/* 포커스 시 테두리 스타일 변경 */
	transition: border-color 0.3s; /* 부드러운 전환 효과 */
	outline: none; /* 기본 포커스 테두리 제거 */
}

.input-container input:focus {
	border-color: #6a95ff; /* 포커스 시 파란색 테두리 */
}

/* 이미지에 보이는 "제목" 텍스트 스타일 */
.input-container input::placeholder {
	color: #888;
	font-size: 0.9em;
}
</style>

<!-- summernote 가져오기 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
<script>
	$(document).ready(
			function() {
				$('#summernote')
						.summernote(
								{
									placeholder : 'write here...',
									tabsize : 2,
									height : 500,
									toolbar : [
											[
													'font',
													[ 'bold', 'underline',
															'clear' ] ],
											[ 'insert', [ 'picture' ] ] ]

								});
			});
</script>
<style>
/* ... (이전 CSS 코드는 유지) ... */

/* 상세 내용 컨테이너 (기본적으로 숨김) */
.agreement-detail {
	/* 기본적으로 숨기기 */
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.3s ease-out; /* 부드러운 애니메이션 효과 */
}

/* 상세 내용이 보일 때 */
.agreement-detail.is-open {
	/* 실제 내용 높이에 맞춰 적절히 크게 설정 */
	max-height: 300px;
	transition: max-height 0.3s ease-in;
}

/* 상세 내용 박스 스타일 */
.detail-box {
	background-color: #f7f7f7;
	border: 1px solid #eee;
	padding: 15px;
	margin: 10px 0;
	border-radius: 5px;
}

.detail-box h4 {
	margin-top: 0;
	font-size: 1em;
	color: #333;
	border-bottom: 1px solid #ddd;
	padding-bottom: 5px;
	margin-bottom: 10px;
}

.detail-box p {
	margin: 3px 0;
	font-size: 0.95em;
	color: #555;
}

/* 화살표 아이콘 스타일 */
.detail-arrow {
	font-size: 1.2em;
	color: #aaa;
	margin-left: 10px;
	cursor: pointer;
	/* 화살표 회전을 위한 전환 효과 */
	transition: transform 0.3s;
}

/* 화살표가 아래로 돌아가도록 설정 (내용이 열렸을 때) */
.detail-arrow.rotated {
	transform: rotate(90deg);
}

/* 항목 전체를 클릭했을 때 커서 변경 */
.agreement-item {
	cursor: pointer;
}
</style>


<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>

<script>
	$(document).ready(function() {
		$("#submitBtn").click(function(e) {
			if ($("#title").val()=="") {
				alert("제목을 입력해주세요.");
				return
			}
			if ($("#msg").val()=="") {
				alert("문의 내용을 입력해주세요.");
				return
			}
			if (!$('#check').is(':checked')) {
				alert("문의하시려면 약관에 동의해주세요.");
				return
			}
			$("#frm").submit();
		});
		
		
		// 1. 항목 전체를 클릭하면 상세 내용 토글
		$("#agreementItem1").click(function(e) {
			// 체크박스 클릭 이벤트는 제외하고 상세 내용 토글
			if (!$(e.target).is('input[type="checkbox"]')) {
				// 상세 내용 div와 화살표를 선택
				var $detail = $("#detailContent1");
				var $arrow = $(this).find('.detail-arrow');

				// 내용 토글
				$detail.toggleClass('is-open');
				// 화살표 회전 토글
				$arrow.toggleClass('rotated');
			}
		});

		// 2. 화살표 버튼만 클릭해도 상세 내용 토글 (선택 사항)
		$(".toggle-btn").click(function(e) {
			e.stopPropagation(); // 중복 이벤트 방지
			var $item = $(this).closest('.agreement-item');
			var itemId = $item.attr('id');

			var $detail = $("#" + itemId.replace("Item", "Content"));
			var $arrow = $(this);

			// 내용 토글
			$detail.toggleClass('is-open');
			// 화살표 회전 토글
			$arrow.toggleClass('rotated');
		});
	});
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
				<img src="${CommonURL}/images/house.png" />
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-offset="20, 0"
						style="background-color: #fff; color: #333; border: none; padding: 0px; margin-left: 10px; font-size: 13px;">
						소통 서비스</button>
					<jsp:include page="../include/page_navi.jsp"></jsp:include>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-offset="15, 0"
						style="background-color: #fff; color: #333; border: none; padding: 0px; margin-left: 10px; font-size: 13px;">
						문의</button>
					<ul class="dropdown-menu dropdown-menu-end"
						style="width: 55px !important; min-width: 55px !important;">
						<li><a href="${CommonURL}/notice/Notice.jsp"
							style="margin: 5px 10px; width:auto; heigh:auto; padding: 0px;">공지</a></li>
						<li><a href="${CommonURL}/FAQ/FAQ.jsp"
							style="margin: 5px 10px; width:auto; heigh:auto; padding: 0px;">FAQ</a></li>
						<li><a href="${CommonURL}/inquiry/Inquiry.jsp"
							style="margin: 5px 10px; width:auto; heigh:auto; padding: 0px;">문의</a></li>
					</ul>
				</div>
			</div>
			<div id="inquiryNotice" style="margin:0px auto; min-width : 900px; display : flex; justify-content: center; ">
				<img src="${CommonURL }/images/inquiry.png" style="width:900px;" >
			</div>
			<form method="POST" action="inquiryProcess.jsp" id="frm">
			<div style="max-width: 1000px; margin: 0px auto;">
				<div style="display: flex;">
					<h4 style="margin-left: 40px; margin-top: 40px; margin-bottom: 0px">
						<strong>문의 접수하기</strong>
					</h4>
				</div>
				<div style="max-width: 1000px; margin: 0px auto;">
					<div class="input-container">                
						<input type="text" name="title" id="title" placeholder="제목">
					</div>
				</div>
				<div style="min-height: 500px; max-width: 1000px; margin: 0px auto;">
					<textarea id="summernote" name="msg" id="msg"></textarea>
				</div>
			</div>
			<div class="agreement-section"
				style="max-width: 1000px; margin: 0px auto;">
				<h4 class="section-title">약관 동의</h4>


				<div class="agreement-item" id="agreementItem1"
					style="border-top: 1px solid #333; border-bottom: 1px solid #333; padding: 10px;">
					<label class="agreement-label" style>
					 <input	type="checkbox" name="privacy_agree" required id="check"> <span
						class="agreement-text" style="font-size: 20px;" > <span
							class="required-tag">[필수]</span> 개인 정보 수집 및 이용 동의
					</span>
					</label> <span class="detail-arrow toggle-btn">&gt;</span>
				</div>

				<div class="agreement-detail" id="detailContent1">
					<div class="detail-box">
						<h4>개인정보 수집 및 이용 동의 상세 내용</h4>
						<p>1. 수집 목적: 서비스 이용자 식별 및 회원 관리</p>
						<p>2. 수집 항목: 이름, 연락처, 이메일 주소</p>
						<p>3. 보유 및 이용 기간: 회원 탈퇴 시 또는 법정 보존 기한까지</p>
						<p style="margin-top: 10px; font-size: 0.9em; color: #888;">
							**[주의]** 위 사항에 동의하지 않을 경우, 서비스 이용이 제한될 수 있습니다.</p>
					</div>
				</div>

			</div>

			<div style="max-width: 1000px; margin: 20px auto;">
				<button type="button" id="submitBtn">
					<img src="${CommonURL }/images/inquirySubmitBtn.png" />
				</button>
			</div>
			</form>

		</div>
		<!-- container 끝 -->

		
		


				<div id="footer">
					<jsp:include page="../include/footer.jsp"></jsp:include>
				</div>
			</div>
</body>
</html>
