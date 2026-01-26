<%@page import="kr.co.viva.notice.RangeDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.viva.notice.NoticeDTO"%>
<%@page import="kr.co.viva.notice.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/siteproperty.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>
<link rel = "shortcut icon" href="${CommonURL}/img/farvicon.png"> 
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

<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>
<!-- 검색 드롭다운 메뉴 CSS -->
<style>
@media screen and ( max-width : 1200px) {
	.page_navi {
		display: none;
	}
	#carouselExampleCaptions{
	display: none;
	}
}

.custom-dropdown-container {
	position: relative; /* 메뉴를 버튼 아래에 정확히 배치하기 위함 */
	display: inline-block;
	font-family: Arial, sans-serif;
}

/* 1. 토글 버튼 스타일 (전체 ▼) */
.search-dropdown-toggle {
	padding: 8px 15px;
	border: 1px solid #ccc;
	border-radius: 8px; /* 둥근 모서리 */
	background-color: #f8f8f8;
	cursor: pointer;
	font-size: 16px;
	font-weight: bold;
	width: 100px;
	text-align: center;
	white-space: nowrap; /* 내용이 줄바꿈되지 않도록 */
}

/* 화살표 아이콘 */
.arrow-icon {
	font-size: 10px;
	margin-left: 5px;
	transition: transform 0.3s;
}

/* 2. 드롭다운 메뉴 스타일 (기본적으로 숨김) */
.dropdown-menu {
	list-style: none;
	padding: 10px 0;
	margin: 0;
	position: absolute;
	top: 100%; /* 버튼 바로 아래 배치 */
	right: 0; /* 버튼 오른쪽 끝에 맞춤 */
	min-width: 150px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	z-index: 1000;
	/* 기본적으로 숨기기 */
	display: none;
}

/* 메뉴가 열렸을 때 */
.dropdown-menu.show {
	display: block;
}

/* 3. 메뉴 항목 스타일 */
.menu-item {
	padding: 8px 20px;
	cursor: pointer;
	font-size: 16px;
	color: #333;
	white-space: nowrap;
}

.menu-item:hover {
	background-color: #f0f0f0; /* 호버 시 배경색 변경 */
}

/* 현재 활성화된 항목 스타일 (선택적) */
.menu-item.active {
	font-weight: bold;
	color: #000;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var $toggle = $('#search-dropdownToggle');
		var $menu = $('#dropdownMenu');
		var $items = $('.menu-item');

		// 1. 토글 버튼 클릭 시 메뉴 보이기/숨기기
		$toggle.on('click', function(e) {
			// 메뉴의 show 클래스를 토글 (있으면 제거, 없으면 추가)
			$menu.toggleClass('show');
			// 화살표 방향 변경 (선택적)
			$toggle.find('.arrow-icon').toggleClass('rotated');
			e.stopPropagation(); // 이벤트 버블링 방지
		});

		// 2. 메뉴 항목 클릭 시 처리
		$items.on('click', function() {
			var selectedText = $(this).text();
			var selectedValue = $(this).data('value');

			// 1) 버튼 텍스트 변경
			$toggle.html(selectedText);

			$("#category").val(selectedText);
			// 2) active 클래스 업데이트 (선택된 항목 표시)
			$items.removeClass('active');
			$(this).addClass('active');

			// 3) 메뉴 닫기
			$menu.removeClass('show');

			// *******************************************
			// TODO: 서버로 데이터 전송 또는 다른 로직 추가 (예: AJAX 호출)
			console.log("선택된 값:", selectedValue);
			// *******************************************
		});

		// 3. 메뉴 외부 클릭 시 메뉴 닫기
		$(document).on('click', function(e) {
			if (!$toggle.is(e.target) && $menu.hasClass('show')) {
				$menu.removeClass('show');
			}
		});
	});

	function noticeDetail() {
		$("#noticeFrm").submit();
	}
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

		<%
		NoticeService ns = NoticeService.getInstance();
		RangeDTO rDTO = new RangeDTO();
		
		String tempPage ="";
		int pageScale = ns.pageScale();
		int currentPage = 1;
		try{
			
		tempPage = request.getParameter("currentPage");
		if (tempPage != null) {
			currentPage = Integer.parseInt(tempPage);
			rDTO.setCurrentPage(currentPage);
			}
		}catch(NumberFormatException nfe){
			
		}

		int startNum = ns.startNum(currentPage, pageScale);
		int endNum = ns.endNum(startNum, pageScale);
		rDTO.setStartNum(startNum);
		rDTO.setEndNum(endNum);
		if(request.getParameter("category")!=null){
		rDTO.setCategory(request.getParameter("category"));
		}
		if(request.getParameter("keyword")!=null){
		rDTO.setKeyword(request.getParameter("keyword"));
		}
		
		rDTO.setUrl("Notice.jsp");

		
		int NoticeTotalCnt = ns.searchNoticeTotalCnt(rDTO);
		int totalPage = ns.totalPage(NoticeTotalCnt, pageScale);
		rDTO.setTotalPage(totalPage);
		List<NoticeDTO> noticeList = ns.searchNotice(rDTO);
		String pagination = ns.pagination(rDTO);
		
		pageContext.setAttribute("noticeList", noticeList);
		pageContext.setAttribute("pagination", pagination);
		
		
		%>
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
						소통 서비스</button>
					<jsp:include page="../include/page_navi.jsp"></jsp:include>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-offset="15, 0"
						style="background-color: #fff; color: #333; border: none; padding: 0px; margin-left: 10px; font-size: 13px;">
						공지</button>
					<ul class="dropdown-menu dropdown-menu-end"
						style="width: 55px !important; min-width: 55px !important;">
						<li><a href="${CommonURL}/notice/Notice.jsp"
							style="margin: 5px 10px">공지</a></li>
						<li><a href="${CommonURL}/FAQ/FAQ.jsp"
							style="margin: 5px 10px">FAQ</a></li>
						<li><a href="${CommonURL}/inquiry/Inquiry.jsp"
							style="margin: 5px 10px">문의</a></li>
					</ul>
				</div>
			</div>
			<div class="WrapWidth" style="z-index: 0; height: 100%">
				<div class="subWrap" style="z-index: 0">
					<div id="subCon" style="z-index: 0;">
						<div>

							<h1 style="text-align: center; margin-bottom: 30px;">공지사항</h1>
						</div>
						<!-- carousel -->
						<div id="carouselExampleCaptions" class="carousel slide"
							style="max-width: 1400px; margin: 0px auto;">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#carouselExampleCaptions"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#carouselExampleCaptions"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#carouselExampleCaptions"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner"
								style="border-radius: 20px; margin: 100px; width: auto;">
								<div class="carousel-item active">
									<img style="width: 1000px; height: 400px;" src="../images/noticeCarusal1.png" class="d-block w-100" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<h5>First slide label</h5>
										<p>Some representative placeholder content for the first
											slide.</p>
									</div>
								</div>
								<div class="carousel-item">
									<img style="width: 1000px; height: 400px;" src="../images/noticeCarusal2.png" class="d-block w-100" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<h5>Second slide label</h5>
										<p>Some representative placeholder content for the second
											slide.</p>
									</div>
								</div>
								<div class="carousel-item">
									<img style="width: 1000px; height: 400px;" src="../images/noticeCarusal3.png" class="d-block w-100" alt="...">
									<div class="carousel-caption d-none d-md-block">
										<h5>Third slide label</h5>
										<p>Some representative placeholder content for the third
											slide.</p>
									</div>
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleCaptions" data-bs-slide="prev" >
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- carousel -->
						<main class="conm0303">
							<div class="cont_box">
								<form action="${CommonURL}/notice/Notice.jsp?noticeNum=${nList.num}">
									<div class="searchbox"
										style="display: flex; align-items: center; justify-content: center; margin:0px auto; flex-wrap: nowrap;">
										<div class="custom-dropdown-container">
											<c:if test="${empty param.category}">
												<button type="button" class="search-dropdown-toggle"
													id="search-dropdownToggle" name="button" value="">
													전체<span class="arrow-icon"></span>
												</button>
											</c:if>
											<c:if test="${not empty param.category }">
												<button type="button" class="search-dropdown-toggle"
													id="search-dropdownToggle" name="button" value="">
													${param.category}
												</button>
											</c:if>
											<ul class="dropdown-menu" id="dropdownMenu">
												<li value="all" class="menu-item active">전체</li>
												<li value="1" class="menu-item ">업데이트</li>
												<li value="2" class="menu-item">공지</li>
												<li value="3" class="menu-item">이벤트</li>
											</ul>
											<input type="text" name="category" value="${param.category }" id="category"
												style="display: none;" />
											<input type="hidden" name="currentPage" value="1" id="category" />								
											</div>

										<div class="form">
											<input type="text" placeholder="검색하기" class="formtxt"
												name="keyword" id="keyword" style="margin-left: 40px;">
											<button type="submit"></button>
										</div>

									</div>
								</form >
								<div style="max-width: 1300px; margin: 0px auto;">


									<ul class="list" style="z-index: 0;">
										<c:choose>
										<c:when test="${empty noticeList}">
										<li style="cursor: pointer">
												<div  style="margin:50px auto; width:700px;">
													<img src="${CommonURL}/images/nodata.png" style="width:700px; margin:0px auto;"/>
												</div>
										</c:when>
										<c:otherwise>
										<c:forEach var="nList" items="${noticeList}">
											<li onclick="noticeDetail()" style="cursor: pointer"><span
												class="sort ">${nList.category}</span>
												<div>
													<span class="title"><a
														href='${CommonURL }/notice/NoticeDetail.jsp?noticeNum=${nList.num}'>${nList.title }</a></span>
													<span class="date">${nList.inputDate }</span> <input
														type="text" style="display: none" name="${nList.num}"
														value="${nList.num}" />
												</div></li>
										</c:forEach>
										</c:otherwise>
										</c:choose>
									</ul>
								</div>
								<br />
								<!-- pagenation -->
								<div id="BoardListPager">
								<div>
										<div class="pagination" style="margin : 0px auto; width:300px;" >
												<div class="page-item" style="display:flex; justify-content: center;width:300px;">
													${pagination}
												</div>
										</div>
									</div>
								</div>
							</div>
						</main>
					</div>
				</div>
			</div>


		</div>
		<!-- container 끝 -->

		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
