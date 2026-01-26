<%@page import="kr.co.viva.restaurant.RestaurantDTO"%>
<%@page import="kr.co.viva.restaurant.RestaurantService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/siteproperty.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>
<!-- 2024 경주월드 -->


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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="../attraction/attraction_design.css" />
<%-- <jsp:include page="css/attrac_css.jsp"></jsp:include> --%>
 

<jsp:include page="../include/Attraction_override_css.jsp"/><!-- css를 다시 덮는 코드  -->
<jsp:include page="../include/scrollBtn_css_js.jsp"/>

</head>

<script type="text/javascript">
$(function(){
	$(".cardItem").click(function(){
		location.href="${CommonURL}/restaurant/viva_RestaurantDetail.jsp?restaurantCode="+$(this).find(".restCode").val();
		
		
	});//click
	
	
});//ready

	

	
	

</script>


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
			<%
			RestaurantService fs = RestaurantService.getInstance();
						
						List<RestaurantDTO> lfDTO = fs.searchFood();
						
						pageContext.setAttribute("restaurant", lfDTO);
			%>
			<c:set var="minimenu_title" value="즐길거리" scope="request"/>
			<c:set var="minimenu_sub" value="레스토랑" scope="request"/> <!-- 추후 include나 core의 import? 같은걸로 할 예정 지금은 구지.. -->
			<c:set var="folder_name" value="restaurant" scope="request"/>

			
			
			<!-- 미니 메뉴바 시작  -->
				<jsp:include page="../include/miniMenu.jsp"></jsp:include>
			<!-- 미니 메뉴바 시작 끝 -->
			
			
			
			<main class="content content--isBanner ">
				<div class="content__banner">
					<img src="${CommonURL}/images/restaurant/restaurant_pc_background.png" alt="" class="content__banner--pc">
					<img src="${CommonURL}/images/restaurant/restaurant_pc_background.png" alt=""
						class="content__banner--mo" style="margin-top:5px ">
				</div>
				<div class="pageHead pageHead--noChildren pageHead--fixed">
					<div class="pageHead__title-box">
						<span class="pageHead__title">${minimenu_sub}</span>
					</div>
				</div>
				<div class="content__cont" id="content__cont">
					<div class="page-attractionList">
						<div class="page__mainList">
							<div class="roundContent" id="roundContent">
								<div class="inner2">
									<div class="_page__list_quvjj_161" id=_page__list_quvjj_161>
										<div class="_cardList_quvjj_81" id="_cardList_quvjj_81">
										
										<!-- 카드 레이아웃 시작 -->
										
										<c:forEach var="restaurantItem" items="${restaurant }">
											<div class="cardItem _cardItem_quvjj_69" >
											<input type="hidden" value="${restaurantItem.restaurantNum}" class="restCode"/>
												<div class="cardItem__link"  style="cursor: pointer" >
													<div class="cardItem__img">
														<img 
															src="${CommonURL}/images/restaurant/${restaurantItem.restaurantPerv}"
															alt="">
													</div>
													<div class="cardItem__cont">
														<span class="cardItem__title"><span>${restaurantItem.restaurantName }</span></span>
														<div class="cardItem__subText">
															<span class="cardItem__icon"><i class="icon"
																style="--iconColor: var(--text-color-3);"><svg
																		width="20" height="20" viewBox="0 0 20 20" fill="none"
																		xmlns="http://www.w3.org/2000/svg">
																		<circle cx="10" cy="10" r="8"
																			stroke="var(--iconColor,#111111)" stroke-width="1.8"></circle>
																		<rect width="1.9" height="1.9" rx="0.95"
																			transform="matrix(-1 8.74228e-08 8.74228e-08 1 10.9502 5.80005)"
																			fill="var(--iconColor, #111111)"></rect>
																		<rect width="1.9" height="5.5" rx="0.95"
																			transform="matrix(-1 8.74228e-08 8.74228e-08 1 10.9502 8.69995)"
																			fill="var(--iconColor, #111111)"></rect></svg></i></span><span
																class="cardItem__subText-text">${restaurantItem.restaurantGoods }</span>
														</div>
														<span class="cardItem__location"><span>${restaurantItem.restaurantLoc }</span></span>
													</div>
													<div class="cardItem__badge"></div>
												</div>
											</div>
										</c:forEach>
											
									<!-- 카드 레이아웃 시작 -->
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="../include/scrollBtn_ui.jsp"/><!--(위로올라가는 스크롤 버튼) -->
		</div>
		<!-- container 끝 -->

		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
