<%@page import="kr.co.viva.perform.PerformDTO"%>
<%@page import="kr.co.viva.perform.UserPerformService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
UserPerformService service = new UserPerformService();

String filter = request.getParameter("filter"); 
if(filter == null || filter.trim().isEmpty()) filter = "all";

int pageScale = 6; 
int currentPage = 1;

String tempPage = request.getParameter("currentPage");
if(tempPage != null){
  try{ currentPage = Integer.parseInt(tempPage); 
  } catch(Exception e){
	  
  }
}

int totalCount = service.totalCount(filter);
int totalPage = (int)Math.ceil((double)totalCount / pageScale);

if(totalPage == 0) totalPage = 1;
if(currentPage < 1) currentPage = 1;
if(currentPage > totalPage) currentPage = totalPage;

int startNum = (currentPage-1)*pageScale + 1;
int endNum = startNum + pageScale - 1;

// list (필터+페이징 반영)
List<PerformDTO> list = service.getPerformListPaging(filter, startNum, endNum);

pageContext.setAttribute("list", list);
pageContext.setAttribute("filter", filter);
pageContext.setAttribute("totalPage", totalPage);
pageContext.setAttribute("currentPage", currentPage);
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
}

.event-tab-row{
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


.event-filters{
  display:flex;
  gap:10px;
  padding:16px 24px 24px;
  flex-wrap:wrap;
  padding-left:110px;
  bottom:40px; 
}

.event-chip{
  padding:8px 16px;
  font-size:18px;
  border-radius:999px;
  border:1px solid #e3e3e3;
  background:#fafafa;
  color:#555;
  cursor:pointer;
}

.event-chip:hover{
  background:#fff3ed;
  border-color:#ff6b3d;
}

.event-chip.is-active{
  background:#ff6b3d;
  border-color:#ff6b3d;
  color:#fff;
  font-weight:600;
}

.event-card-wrap{
  max-width: 1200px;  
  margin: 0 auto 28px;
  padding: 0 16px;    
}


.event-card-grid{
  display:grid;
  grid-template-columns:repeat(3,1fr);
  gap:24px;
  padding:0 24px 28px;
}

.event-card{
  background:#fff;
  border-radius:16px;
  overflow:hidden;
  box-shadow:0 10px 25px rgba(0,0,0,0.04);
  display:flex;
  flex-direction:column;
}


.event-card__thumb{
  position:relative;
  width:100%;
  padding-top:66%;
  overflow:hidden;
}

.event-card__thumb img{
  position:absolute;
  inset:0;
  width:100%;
  height:100%;
  object-fit:cover;
  transition:0.25s;
}

.event-card__body{
  flex:1;
  display:flex;
  flex-direction:column;
  padding:14px 16px 12px;
}

.event-card__title{
  font-size:15px;
  font-weight:600;
  margin-bottom:6px;
}

.event-card__desc{
  font-size:13px;
  color:#666;
}

.pagination .page-link {
  color: #ff6b3d;
  background-color: #fff;
}

.pagination .page-link:hover {
  background-color: #fff3ed;
  color: #ff6b3d;
  border-color: #ff6b3d;
}

.pagination .page-item.active .page-link {
  background-color: #ff6b3d;
  border-color: #ff6b3d;
  color: #fff;
  font-weight: 600;
}

.pagination .page-item.disabled .page-link {
  color: #ccc;
  border-color: #ddd;
  background-color: #f8f8f8;
}


</style>


<script type="text/javascript">
$(function () {

  // 칩 클릭 시 DB필터 페이지로 이동
  $(".event-chip").on("click", function () {
    const filter = String($(this).data("filter")); // "all" / "1" / "2"
    window.location.href = "perform.jsp?currentPage=1&filter=" + filter;
  });

  // 현재 filter 값에 맞게 active 표시
  const params = new URLSearchParams(window.location.search);
  const currentFilter = params.get("filter") || "all";

  $(".event-chip").removeClass("is-active");
  $(".event-chip").each(function () {
    if (String($(this).data("filter")) === String(currentFilter)) {
      $(this).addClass("is-active");
    }
  });

  // 카드 클릭 시 상세로 이동
  $(".event-card").css("cursor", "pointer").on("click", function () {
    const href = $(this).data("href");
    if (href) window.location.href = href;
  });

});
</script>
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


		<!-- 코딩영역 contatiner 시작 !!!!! -->

<form id="pay-form" class="pay-form" method="get" action="paySuccess.jsp">
<div class="event-main">
<input type="hidden" name="r_title" id="r_title_hidden">
<input type="hidden" name="r_desc" id="r_desc_hidden">

  <div class="event-banner" style="background-image:url('../images/eventimg/event.png');">
    <div class="event-banner-title">행사</div>
  </div>

  <div class="event-content">

    <div class="event-tab-row">
      <div class="event-tabs">
        <div class="event-tab">전체행사</div>
      </div>
    </div>

    <div class="event-filters">
      <div class="event-chip is-active" data-filter="all">전체</div>
      <div class="event-chip" data-filter="2">공연</div>
      <div class="event-chip" data-filter="1">퍼레이드</div>
    </div>
	<div class="event-card-wrap">
    <div class="event-card-grid">
	<c:forEach var="p" items="${list}">
  <div class="event-card"
     data-type="${p.perfType}"
     data-href="<c:choose>
                  <c:when test='${p.perfType == 2}'>
                    detailPerf.jsp?perfNum=${p.perfNum}
                  </c:when>
                  <c:otherwise>
                    detailParade.jsp?perfNum=${p.perfNum}
                  </c:otherwise>
                </c:choose>">


    <div class="event-card__thumb">
      <img class="event-card__img"
           src="../upload/${p.perfImg}">
    </div>

    <div class="event-card__body">
      <div class="event-card__title">
        ${p.perfTitle}
      </div>
      <div class="event-card__desc">
        ${p.perfSubTitle}
      </div>
    </div>

  </div>
</c:forEach>

</div>
<nav aria-label="Page navigation" style="display:flex; justify-content:center; margin:20px 0;">
  <ul class="pagination">

    <li class="page-item ${currentPage==1 ? 'disabled' : ''}">
      <a class="page-link" href="perform.jsp?currentPage=${currentPage-1}&filter=${filter}">이전</a>
    </li>

    <c:forEach var="pno" begin="1" end="${totalPage}">
      <li class="page-item ${pno==currentPage ? 'active' : ''}">
        <a class="page-link" href="perform.jsp?currentPage=${pno}&filter=${filter}">${pno}</a>
      </li>
    </c:forEach>

    <li class="page-item ${currentPage==totalPage ? 'disabled' : ''}">
      <a class="page-link" href="perform.jsp?currentPage=${currentPage+1}&filter=${filter}">다음</a>
    </li>

  </ul>
</nav>


    </div>
  </div>

</div>
	</form>
		</div>
<!-- 푸터 -->
	<div id="footer">
	<jsp:include page="../include/footer.jsp"/>
	</div>

</body>
</html>
