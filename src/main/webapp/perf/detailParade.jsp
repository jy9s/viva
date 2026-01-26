<%@page import="kr.co.viva.perform.PerformDTO"%>
<%@page import="kr.co.viva.perform.UserPerformService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/siteproperty.jsp" %>


<%
UserPerformService service = new UserPerformService();
List<PerformDTO> list = null;
int perfNum = Integer.parseInt(request.getParameter("perfNum"));
PerformDTO p = service.getPerformDetail(perfNum);  
request.setAttribute("p", p);
%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Astro v5.13.2">
<title>V!VA PARK</title>
<script src="http://192.168.10.71/jsp_prj/common/js/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">
<link rel ="shortcut icon" href="http://192.168.10.71/html_prj/common/images/favicon.ico"/><meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.71/jsp_prj/common/css/carousel.css" rel="stylesheet">
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
<style>

main{
margin-top: 90px;
}

#inner {
	width: 70%;
	margin: 0px auto;
	
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
	margin-top: 150px;
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

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: #0000001a;
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em #0000001a, inset 0 .125em .5em #00000026
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh
}

.bi {
	vertical-align: -.125em;
	fill: currentColor
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8
}

.bd-mode-toggle {
	z-index: 1500
}

.bd-mode-toggle .bi {
	width: 1em;
	height: 1em
}

.bd-mode-toggle .dropdown-menu .active .bi {
	display: block !important
}


.carousel-item {
   height: 400px;
}

.carousel-item img {
    width: 100%;
    height: 100%;
    object-fit: cover; 
    display: block;
    border-radius: 20px;
	position : relative;
    z-index : -1;
}

#myCarousel {
    width: 1200px;
    margin: 0 auto;
    border-radius: 20px;
    overflow: hidden;
}


.section-title {
    font-size: 32px;
    font-weight: 700;
    margin-top: 40px;
    text-align: center;
}

.section-sub {
    text-align: center;
    color: #666;
    margin-bottom: 30px;
}

.badge-custom {
    background: #e9d7ff;
    color: #7e57c2;
    font-size: 14px;
    padding: 6px 14px;
    border-radius: 20px;
}

.info-box {
    display: flex;
    justify-content: center;
    gap: 100px;
    margin-top: 40px;
}

.info-item {
    text-align: center;
}

.info-item i {
    font-size: 30px;
    margin-bottom: 10px;
    color: #7e57c2;
}

.location-title {
    font-size: 20px;
    font-weight: 600;
    margin-top: 80px;
    margin-bottom: 10px;
}

.location-point {
    color: #7e57c2;
    font-weight: 600;
    margin-bottom: 20px;
}
.img-fluid{
	margin-top:120px;
	width:400px;
	height:400px;
}
</style>

<script type="text/javascript">

</script>
<c:set var="minimenu_title" value="즐길거리" scope="session"/>
	<c:set var="minimenu_sub" value="퍼레이드" scope="session"/> 
	<c:set var="folder_name" value="parade" scope="session"/>
	
  
</head>
<body>
<div class="close" style="width:100%; position:fixed;top:0;left:0; height : 10px;"></div>
	<div id="header" >
	<jsp:include page="../include/header.jsp"/>
	<jsp:include page="../include/hamberger.jsp"/>
	</div>
			<!-- 햄버거 메뉴 끝 -->
<!-- 메인 공간(비어있는 흰 배경 영역) -->
		<div class="container">
			
			<jsp:include page="../include/miniMenu2.jsp"/>
			<!-- 미니 메뉴바 끝 -->



<main>

    <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">


        <div class="carousel-inner">

            <!-- Slide 1 -->
            <div class="carousel-item active">
                <img src="../upload/${p.perfPreview}" alt="slide1">
                <div class="container">
                    <div class="carousel-caption text-start">
                        <h1>${p.perfTitle}</h1>
                        <p class="opacity-75">${p.perfSubTitle}</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    <!-- 배너 밑 콘텐츠 시작 -->
	<div class="container mt-5">

    <!-- 카테고리 뱃지 -->
    <div class="text-center">
        <span class="badge-custom">퍼레이드</span>
    </div>

    <!-- 제목 -->
    <div class="section-title">${p.perfTitle}</div>

    <!-- 설명 -->
    <div class="section-sub">
        ${p.perfSubTitle}
    </div>

    <!-- 코스 버튼 -->
    <div class="text-center mb-4">
        <button class="btn btn-light border rounded-pill px-4 py-2">퍼레이드 코스
        </button>
    </div>

    <!-- 아이콘 3개 정보 -->
    <div class="info-box">

        <!-- 공연기간 -->
        <div class="info-item">
            <i class="bi bi-calendar3"></i>
            <div><b>공연기간</b></div>
            <div>${ p.perfStartDate }<br>~ ${ p.perfEndDate}</div>
        </div>

        <!-- 공연시간 -->
        <div class="info-item">
            <i class="bi bi-alarm"></i>
            <div><b>공연시간</b></div>
            <div>${ p.perfTime }</div>
        </div>

        <!-- 소요시간 -->
        <div class="info-item">
            <i class="bi bi-hourglass-split"></i>
            <div><b>소요시간</b></div>
            <div>${ p.perfShowTime } 분</div>
        </div>

    </div>

    <!-- 위치 안내 -->
    <div class="location-title">위치 안내</div>
    <div class="location-point">
	<c:choose>
 	<c:when test="${p.perfLoc == 1}">
    🔵대형메인홀
  	</c:when>
  	<c:when test="${p.perfLoc == 2}">
    🔴소극장
  	</c:when>
  	<c:when test="${p.perfLoc == 3}">
    🟢콘서트홀
  	</c:when>
  	<c:otherwise>
    위치정보 없음
  	</c:otherwise>
</c:choose>
</div>


    <div class="text-center">
        <img src="../images/vivamap.png"
             class="img-fluid" style="max-width:800px;">
    </div>

</div>
    

</main>
		</div>
<div id="footer"  >
		<jsp:include page="../include/footer.jsp"/>
	</div>

</body>
</html>
