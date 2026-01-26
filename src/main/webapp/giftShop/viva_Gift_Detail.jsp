<%@page import="kr.co.viva.giftShop.GiftShopDTO"%>
<%@page import="kr.co.viva.giftShop.GiftShopService"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/siteproperty.jsp" %>
	<%
		
		String giftCode = request.getParameter("giftCode");
	 
	
	if(giftCode==null){
	%>		
			
		<c:redirect url="${CommonURL}/giftShop/viva_Gift_main.jsp"/>
				
	<%		
		return ;
	}//end if 
		
		
		try{
			
			int TempCode =Integer.parseInt(giftCode);
			GiftShopService gss = GiftShopService.getInstance();
			GiftShopDTO gsDTO = gss.searchGiftShopDetail(TempCode);
			
			if(gsDTO==null){
	%>
			<c:redirect url="${CommonURL}/fragments/detail-empty.jsp"/>		
				
	<%		
			return;
			}//end if 
			
			pageContext.setAttribute("giftDetail", gsDTO);
				
		}catch(NumberFormatException ne){
	%>
			<c:redirect url="${CommonURL}/fragments/detail-empty.jsp"/>		
	<%		
			return;
		}//end catch
				
				
			
		
		
	%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>

<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<!-- bootstrap CDN 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
	
<link rel = "shortcut icon" href="${CommonURL}/img/farvicon.png">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->

<link rel="stylesheet" type="text/css"
	href="gift_detail.css" />

<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>
<jsp:include page="../include/location_map_js.jsp"></jsp:include>


<jsp:include page="../include/gitfShop_override.jsp"></jsp:include>




<c:set var="bottom_Path" value="giftShop/viva_Gift_main.jsp"  scope="session"/>
<c:set var="folder_name" value="giftShop" scope="session"/>
<jsp:include page="../include/bottomBtn_css_js.jsp"/>
<jsp:include page="../include/scrollBtn_css_js.jsp"/>


<script type="text/javascript">
$(function(){

	
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
	<div id="content" class="container">
	
	
				
				
			<c:set var="minimenu_title" value="즐길거리" scope="session"/>
			<c:set var="minimenu_sub" value="기프트샵" scope="session"/> <!-- 추후 include나 core의 import? 같은걸로 할 예정 지금은 구지.. -->
			<c:set var="map_fileName" value="${giftDetail.giftLocImg }" scope="session"/>
			
			
			<!-- 미니 메뉴바 시작  -->
				<jsp:include page="../include/miniMenu.jsp"></jsp:include>
			<!-- 미니 메뉴바 시작 끝 -->
			
			
		<main class="content">
			<div class="content__cont content__cont--noMargin">
				<div class="page__visualSlide">
					<div class="inner2">
						<div class="_visualSlide_ntppe_143">


								<div class="_visualSlide__imgBox_ntppe_179 _pcImage_ntppe_197" >

									<img
										src="${CommonURL}/images/giftShop/${giftDetail.giftBg}"
										alt="">
								</div>
							</div>
					</div>
				</div>
				<div class="page__intro">
					<div class="inner2">
						<div class="_introHead_ntppe_214">
							<span class="_introHead__title_ntppe_264"><span>${f:trim(giftDetail.giftName)}</span></span>
							<p class="_introHead__desc_ntppe_291">
								<span>${f:trim(giftDetail.giftExplain) }
								</span>
							</p>
							<div class="_locationPin_ntppe_112 _introHead__badge_ntppe_312 viva_bg_color" >
								<div class="_locationPin__box_ntppe_122">
									<i class="icon _locationPin__icon_ntppe_125"
										style="--iconColor: var(--color-purple-500-primary);"><svg
											width="20" height="20" viewBox="0 0 20 20" fill="none"
											xmlns="http://www.w3.org/2000/svg">
											<rect width="20" height="20" fill="none"></rect>
											<g id="Icon">
											<rect width="1920" height="2293"
												transform="translate(-412 -506)" fill="none"></rect>
											<g id="20">
											<rect width="1528" height="215"
												transform="translate(-70 -30)" fill="icon_spot"></rect>
											<g id="20/spot">
											<path id="Vector" fill-rule="evenodd" clip-rule="evenodd"
												d="M5.05002 4.05011C6.36284 2.73729 8.14341 1.99976 10 1.99976C11.8566 1.99976 13.6372 2.73729 14.95 4.05011C16.2628 5.36293 17.0004 7.1435 17.0004 9.00011C17.0004 10.8567 16.2628 12.6373 14.95 13.9501L10.7071 18.193C10.3166 18.5835 9.68343 18.5835 9.29291 18.193L5.05002 13.9501C4.39993 13.3001 3.88425 12.5284 3.53242 11.6791C3.1806 10.8297 2.99951 9.91943 2.99951 9.00011C2.99951 8.0808 3.1806 7.17049 3.53242 6.32116C3.88425 5.47184 4.39993 4.70013 5.05002 4.05011ZM10 11.0001C10.5304 11.0001 11.0392 10.7894 11.4142 10.4143C11.7893 10.0393 12 9.53055 12 9.00011C12 8.46968 11.7893 7.96097 11.4142 7.5859C11.0392 7.21083 10.5304 7.00011 10 7.00011C9.46958 7.00011 8.96088 7.21083 8.5858 7.5859C8.21073 7.96097 8.00002 8.46968 8.00002 9.00011C8.00002 9.53055 8.21073 10.0393 8.5858 10.4143C8.96088 10.7894 9.46958 11.0001 10 11.0001Z"
												fill="#FF5A4A"></path></g></g></g></svg></i><span
										class="_locationPin__text_ntppe_132 viva_text_color" ><span>${f:trim(giftDetail.giftLoc) }</span></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="_page__useInfoBox_ntppe_69">
					<div class="inner2">
						<div class="contentBox _page__contentBox_ntppe_94">
							<div class="_infoBox_ntppe_436">
								<div class="_infoBox__content_ntppe_441 _full_ntppe_459">
									<ul class="_infoMenu_ntppe_487 _infoMenu--row_ntppe_539">
										<li class="_infoMenu__item_ntppe_497"><span
											class="_infoMenu__title_ntppe_501">영업 시간</span><span
											class="_infoMenu__text_ntppe_524"><span>${f:trim(giftDetail.giftTime) }</span></span></li>
										<li class="_infoMenu__item_ntppe_497"><span
											class="_infoMenu__title_ntppe_501">주요 상품</span><span
											class="_infoMenu__text_ntppe_524"><span>${f:trim(giftDetail.giftGoods) }</span></span></li>
										<li class="_infoMenu__item_ntppe_497"><span
											class="_infoMenu__title_ntppe_501">전화번호</span><span
											class="_infoMenu__text_ntppe_524"><span>${f:trim(giftDetail.gitfTel) }</span></span></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="_page__mapGuide_ntppe_77">
					<div class="inner2">
						<div class="section">
							<div class="section__head">
								<div class="section__title-box">
									<span class="section__title">위치 안내</span>
								</div>
							</div>
							<div class="section__body">
								<div class="location">
									<div class="_location__badge_ntppe_772">
										<i class="icon _location__badge-icon_ntppe_779"><svg
												width="20" height="20" viewBox="0 0 20 20" fill="none"
												xmlns="http://www.w3.org/2000/svg">
												<rect width="20" height="20" fill="none"></rect>
												<g id="Icon">
												<rect width="1920" height="2293"
													transform="translate(-412 -506)" fill="none"></rect>
												<g id="20">
												<rect width="1528" height="215"
													transform="translate(-70 -30)" fill="icon_spot"></rect>
												<g id="20/spot">
												<path id="Vector" fill-rule="evenodd" clip-rule="evenodd"
													d="M5.05002 4.05011C6.36284 2.73729 8.14341 1.99976 10 1.99976C11.8566 1.99976 13.6372 2.73729 14.95 4.05011C16.2628 5.36293 17.0004 7.1435 17.0004 9.00011C17.0004 10.8567 16.2628 12.6373 14.95 13.9501L10.7071 18.193C10.3166 18.5835 9.68343 18.5835 9.29291 18.193L5.05002 13.9501C4.39993 13.3001 3.88425 12.5284 3.53242 11.6791C3.1806 10.8297 2.99951 9.91943 2.99951 9.00011C2.99951 8.0808 3.1806 7.17049 3.53242 6.32116C3.88425 5.47184 4.39993 4.70013 5.05002 4.05011ZM10 11.0001C10.5304 11.0001 11.0392 10.7894 11.4142 10.4143C11.7893 10.0393 12 9.53055 12 9.00011C12 8.46968 11.7893 7.96097 11.4142 7.5859C11.0392 7.21083 10.5304 7.00011 10 7.00011C9.46958 7.00011 8.96088 7.21083 8.5858 7.5859C8.21073 7.96097 8.00002 8.46968 8.00002 9.00011C8.00002 9.53055 8.21073 10.0393 8.5858 10.4143C8.96088 10.7894 9.46958 11.0001 10 11.0001Z"
													fill="#FF6124"></path></g></g></g></svg></i><span class="viva_text_color">${f:trim(giftDetail.giftLoc) }</span>
									</div>
									<div class="map-container">
											<div id="mapArea">
 												<img id="mapImage"
													src="${CommonURL}/images/giftShop/${giftDetail.giftLocImg }"
													alt="Viva Park Map">
											</div>

											<div class="controls">
													<button id="zoomIn"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 5.5V18.5" stroke="var(--iconColor, #111111)" stroke-width="1.8" stroke-linecap="round"></path><path d="M18.5 12L5.5 12" stroke="var(--iconColor, #111111)" stroke-width="1.8" stroke-linecap="round"></path></svg></button>
												<button id="zoomOut"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M19 12L5 12" stroke="var(--iconColor, #111111)" stroke-width="1.8" stroke-linecap="round"></path></svg></button>
												<button id="resetZoom"><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><mask id="mask0_7286_15500" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24" style="mask-type: alpha;"><rect width="24" height="24" fill="#D9D9D9"></rect></mask><g mask="url(#mask0_7286_15500)"><path d="M18.9297 8C17.5465 5.60879 14.9611 4 12 4C7.58172 4 4 7.58172 4 12C4 16.4183 7.58172 20 12 20C15.1631 20 17.8975 18.1642 19.1958 15.5" stroke="#111111" stroke-width="2" stroke-linecap="round"></path><path d="M15.0425 8.58731L20.2307 9.41304" stroke="#111111" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M20.231 9.41269L20.219 4.15914" stroke="#111111" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></g></svg></button>
											
											</div>
										</div>
									
									
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</main>
			<jsp:include page="../include/bottomBtn_ui.jsp" />
			<jsp:include page="../include/scrollBtn_ui.jsp" />
		</div>
		<!-- container 끝 -->

		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
