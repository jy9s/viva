<%@page import="kr.co.viva.attr.AttractionDTO"%>
<%@page import="kr.co.viva.attr.AttractionService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/siteproperty.jsp" %>
	
<%
	
        //내가 해야될 유효성 검사 
        //1. int가 아닌 한글 정규식 또는 catch 
        //2 결과 값이 없다. 대부분 검색이 안되는다는거는 이름이 없다는거라 aDTO.getName==null
        //3. null 에초에 null이 아닐때 if문ㅇ
        	
		 
		 String attracCode = request.getParameter("attracCode");
		 
		 
	if(attracCode==null){// 쿼리 스트링 부분이 틀리면 main화면으로 
%>

      	<c:redirect url="${CommonURL}/attraction/viva_Attraction_main.jsp"/>
<%		
		return;
	}//end if
        try{

		    int TempCode = Integer.parseInt(attracCode);
		    
		    AttractionService as = AttractionService.getInstance();
		    AttractionDTO aDTO=as.searchAttracDetail(TempCode);
			
			if(aDTO==null || aDTO.getAttracName()==null){
				throw new NumberFormatException("오류발생");
			}
				List<AttractionDTO>  operate = as.searchAttracOperate(TempCode);
				pageContext.setAttribute("operate", operate);
		        pageContext.setAttribute("DetailData", aDTO);
			
        }catch(NumberFormatException ne){
     %>

          	<c:redirect url="${CommonURL}/fragments/detail-empty.jsp"/>
    <%	        
        	
        	
		}//end catch 
		
        
		
      	

        
        
         	
		

%>	

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>
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
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 
 <link rel="stylesheet" type="text/css"
	href="	attraction_Detail.css"> 

<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>
 <jsp:include page="../include/location_map_js.jsp"></jsp:include> 

 <jsp:include page="../include/attraction_Detail_css.jsp"></jsp:include> 


	<c:set var="minimenu_title" value="즐길거리" scope="request"/>
	<c:set var="minimenu_sub" value="어트랙션" scope="request"/> <!-- 추후 include나 core의 import? 같은걸로 할 예정 지금은 구지.. -->
	
			


<script type="text/javascript">
$(function () {
    
    if ($('.attrac_state.red').length > 0) {
    	$('._page__offSchedule_ntppe_69').show();
    } else {
    	$('._page__offSchedule_ntppe_69').hide();
    }
    
    $("#holiday_btn").click(function(){
    	location.href="${CommonURL}/info/user_guide1.jsp";
    	
    });
           
});

</script>
<style type="text/css">
/* .carousel-item {
  aspect-ratio: 1328 / 560; /* 비율 고정 */
}
.carousel-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
 */
</style>

<c:set var="bottom_Path" value="attraction/viva_Attraction_main.jsp"  scope="session"/>
<c:set var="folder_name" value="attraction" scope="session"/>
<c:set var="map_fileName" value="${DetailData.attracLocImg}" scope="session"/>

<jsp:include page="../include/scrollBtn_css_js.jsp"/>
<jsp:include page="../include/bottomBtn_css_js.jsp"/>


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
		
		
			
			<!-- 미니 메뉴바 시작  -->
				<jsp:include page="../include/miniMenu.jsp"></jsp:include>
			<!-- 미니 메뉴바 시작 끝 -->
			
			<main class="content" style="border-radius: 20px">
				<div class="content__cont content__cont--noMargin">
					<div class="page__visualSlide" style="border-radius: 20px" >
						<div class="inner2">
						
	
						<!-- carousel 시작 -->
							<div class="_visualSlide_ntppe_143" style="border-radius: 20px" >
								<div id="carouselExample" class="carousel slide"  >
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="${CommonURL}/upload/${DetailData.attracBg}" class="d-block w-100" alt="..." style="border-radius: 20px">
										</div>
										<div class="carousel-item">
											<img src="${CommonURL}/upload/${DetailData.attracBg2}" class="d-block w-100" alt="..."style="border-radius: 20px">
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExample" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExample" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
								<div
									class="_visualSlide__nav_ntppe_159 _visualSlide__next_ntppe_168"></div>
							</div>
						<!-- carousel 끝 -->
						
						</div>
					</div>
					<div class="page__intro">
						<div class="inner2">
							<div class="_introHead_ntppe_214">
								<div class="_introHead__status_ntppe_219">
											<c:set var="state" value=" "/>
											<c:if test="${DetailData.attracState == 'Y'}">
												<c:set var="state" value="red" /> 
											</c:if> 
												 
											
									
											<img src="${CommonURL}/images/attr/attrac_state_green.png" class="attrac_state ${state} " />

									<!-- <span class="_badgeStatus_ntppe_228 _red_ntppe_250">정기점검</span> -->
								</div>
								<span class="_introHead__title_ntppe_264"><span>${f:trim(DetailData.attracName)}</span></span>
							<%-- 	//<%= aDTO.getAttracName().trim() %> --%>
								<p class="_introHead__desc_ntppe_291">
									<%-- <% String explain =aDTO.getAttracExplian().replace("//", "<br>");
									   
										
									
									%> --%>
										<span>${f:trim(DetailData.attracExplian)}</span>
									
								</p>
								<div class="_locationPin_ntppe_112 _introHead__badge_ntppe_312 viva_bg_color">
									<div class="_locationPin__box_ntppe_122">
										<i class="icon _locationPin__icon_ntppe_125"
											style="--iconColor:#FF5A4A;"><svg
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
													fill="var(--iconColor, #111111)"></path></g></g></g></svg></i><span
											class="_locationPin__text_ntppe_132 viva_text_color"><span >${DetailData.attracLoc}</span></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="_page__infoBox_ntppe_77">
						<div class="inner2">
							<div class="contentBox _page__contentBox_ntppe_94">
								<div class="_infoBox_ntppe_436">
									<div class="_infoBox__content_ntppe_441">
										<span class="_infoBox__title_ntppe_467">탑승정보</span>
										<ul class="_infoMenu_ntppe_487">
											<li class="_infoMenu__item_ntppe_497"><span
												class="_infoMenu__title_ntppe_501">운영시간</span><span
												class="_infoMenu__text_ntppe_524">10:00 ~ 20:40</span></li>
											<li class="_infoMenu__item_ntppe_497"><span
												class="_infoMenu__title_ntppe_501">탑승인원</span><span
												class="_infoMenu__text_ntppe_524">${DetailData.attracCapac}명</span></li>
											<li class="_infoMenu__item_ntppe_497"><span
												class="_infoMenu__title_ntppe_501">키 제한</span><span
												class="_infoMenu__text_ntppe_524">${DetailData.attracHeight} 탑승 가능</span></li>
										</ul>  
									</div>
									
									<div class="_infoBox__content_ntppe_441">
										<span class="_infoBox__title_ntppe_467">탑승제한</span>
										<ul class="_iconList_ntppe_606">
											<li class="_iconList__item_ntppe_611"><span
												class="_iconList__iconBox_ntppe_632"><i
													class="icon _iconList__icon_ntppe_632"><svg width="32"
															height="32" viewBox="0 0 32 32" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<path
																d="M7.90544 11.5559H20.5474C20.9665 11.5559 21.3685 11.7 21.6648 11.9564C21.9612 12.2129 22.1277 12.5607 22.1277 12.9234V26.5986C22.1277 27.324 21.7947 28.0197 21.202 28.5326C20.6093 29.0455 19.8054 29.3337 18.9672 29.3337H9.48569C8.64747 29.3337 7.84359 29.0455 7.25088 28.5326C6.65817 28.0197 6.3252 27.324 6.3252 26.5986V12.9234C6.3252 12.5607 6.49169 12.2129 6.78804 11.9564C7.08439 11.7 7.48633 11.5559 7.90544 11.5559Z"
																stroke="#666666" stroke-width="1.5"
																stroke-linecap="round" stroke-linejoin="round"></path>
															<path
																d="M22.126 13.5293H24.7597C25.109 13.5293 25.4439 13.6894 25.6909 13.9743C25.9379 14.2593 26.0766 14.6458 26.0766 15.0488V21.8864C26.0766 22.2894 25.9379 22.6758 25.6909 22.9608C25.4439 23.2458 25.109 23.4058 24.7597 23.4058H22.126"
																stroke="#666666" stroke-width="1.5"
																stroke-linecap="round" stroke-linejoin="round"></path>
															<path d="M11.6572 14.7012V23.0582" stroke="#666666"
																stroke-width="1.5" stroke-linecap="round"
																stroke-linejoin="round"></path>
															<path d="M16.9697 14.7012V23.0582" stroke="#666666"
																stroke-width="1.5" stroke-linecap="round"
																stroke-linejoin="round"></path>
															<path
																d="M5.33496 8.44306C5.33496 10.1613 6.72785 11.5542 8.44607 11.5542H20.0016C21.7198 11.5542 23.1127 10.1613 23.1127 8.44306C23.1127 6.72484 21.7198 5.33195 20.0016 5.33195L19.9702 5.33211C19.7545 3.82434 18.4579 2.66528 16.8905 2.66528C15.7588 2.66528 14.7682 3.26954 14.2238 4.17303C13.6795 3.26954 12.6889 2.66528 11.5572 2.66528C9.9898 2.66528 8.69315 3.82434 8.47756 5.33211L8.44607 5.33195C6.72785 5.33195 5.33496 6.72484 5.33496 8.44306Z"
																stroke="#666666" stroke-width="1.5"
																stroke-linejoin="round"></path></svg></i></span>음주</li>
											<li class="_iconList__item_ntppe_611"><span
												class="_iconList__iconBox_ntppe_632"><i
													class="icon _iconList__icon_ntppe_632"><svg width="24"
															height="24" viewBox="0 0 24 24" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<path
																d="M7.1961 21.5973L3.13444 17.7085C0.920837 15.4067 4.14986 10.9504 7.1961 14.5554C10.2423 10.9609 13.5018 15.4172 11.2578 17.7085L7.1961 21.5973Z"
																stroke="#666666" stroke-width="1.5"
																stroke-linecap="round" stroke-linejoin="round"></path>
															<path
																d="M13.2031 8.39844C14.86 8.39844 16.2031 7.05529 16.2031 5.39844C16.2031 3.74158 14.86 2.39844 13.2031 2.39844C11.5463 2.39844 10.2031 3.74158 10.2031 5.39844C10.2031 7.05529 11.5463 8.39844 13.2031 8.39844Z"
																stroke="#666666" stroke-width="1.5"
																stroke-linecap="round" stroke-linejoin="round"></path>
															<path
																d="M11.7841 21.5992H20.4023V18.7516C20.4065 17.4669 20.127 16.1978 19.5846 15.0392C19.0422 13.8807 18.2509 12.8626 17.27 12.0611C16.2891 11.2597 15.1439 10.6956 13.92 10.411C12.6961 10.1264 11.4252 10.1287 10.2023 10.4177V11.4611"
																stroke="#666666" stroke-width="1.5"
																stroke-linecap="round" stroke-linejoin="round"></path></svg></i></span>임산부</li>
											<li class="_iconList__item_ntppe_611"><span
												class="_iconList__iconBox_ntppe_632"><i
													class="icon _iconList__icon_ntppe_632"><svg width="24"
															height="24" viewBox="0 0 24 24" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<path
																d="M19.0494 4.66394C19.0494 5.84089 18.1112 6.7771 16.9759 6.7771C15.8405 6.7771 14.9023 5.84089 14.9023 4.66394C14.9023 3.48699 15.8405 2.55078 16.9759 2.55078C18.1112 2.55078 19.0494 3.48699 19.0494 4.66394Z"
																stroke="#666666" stroke-width="1.5"></path>
															<path
																d="M14.8596 13.9693L16.5611 10.5185C16.8103 10.0133 16.7121 9.40571 16.3166 9.00462C14.3019 6.96171 10.852 7.66591 9.79912 10.335L9.108 12.087C8.3921 13.9019 9.31593 15.9496 11.1503 16.614L12.742 17.1904L14.1537 22.2009H16.2714L17.1406 17.5C17.2594 16.8575 17.0568 16.1974 16.598 15.7321L14.8596 13.9693Z"
																stroke="#666666" stroke-width="1.5"
																stroke-linejoin="round"></path>
															<path
																d="M5.50831 7.20117L6.29922 8.40117L7.49922 8.10117L7.79922 8.96588M4.19922 10.0247L5.18104 10.7306L6.49013 10.3776L7.14467 10.7306M4.19922 13.2012L5.50831 13.5012L5.99922 12.6012L6.89922 12.3012"
																stroke="#666666" stroke-width="1.5"
																stroke-linecap="round" stroke-linejoin="round"></path></svg></i></span>디스크
												환자</li>
											<li class="_iconList__item_ntppe_611"><span
												class="_iconList__iconBox_ntppe_632"><i
													class="icon _iconList__icon_ntppe_632"><svg width="24"
															height="24" viewBox="0 0 24 24" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<path
																d="M3.19727 8.37567C3.90343 4.79787 8.09889 2.10725 12.0867 6.8631C17.7775 0.0129355 23.8561 8.50656 19.7299 12.8843L12.0867 20.2871L7.61427 15.9239"
																stroke="#666666" stroke-width="1.5"
																stroke-linecap="round" stroke-linejoin="round"></path>
															<path
																d="M3.08594 12.2896H6.54754L8.6245 9.38086L11.3938 14.4712L13.4707 11.5624H15.5477"
																stroke="#666666" stroke-width="1.5"
																stroke-linecap="round" stroke-linejoin="round"></path></svg></i></span>심/혈관계
												질환자</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="_page__noticeGuide_ntppe_77">
						<div class="inner2">
							<div class="noticeBox">
								<div class="noticeBox__inner">
									<span class="noticeBox__title"><i
										class="icon noticeBox__icon"><svg width="24" height="24"
												viewBox="0 0 24 24" fill="none"
												xmlns="http://www.w3.org/2000/svg">
												<mask id="mask0_5312_36477" maskUnits="userSpaceOnUse" x="0"
													y="0" width="24" height="24" style="mask-type: alpha;">
												<rect width="24" height="24" fill="#D9D9D9"></rect></mask>
												<g mask="url(#mask0_5312_36477)">
												<path
													d="M8.6 22.5L6.7 19.3L3.1 18.5L3.45 14.8L1 12L3.45 9.2L3.1 5.5L6.7 4.7L8.6 1.5L12 2.95L15.4 1.5L17.3 4.7L20.9 5.5L20.55 9.2L23 12L20.55 14.8L20.9 18.5L17.3 19.3L15.4 22.5L12 21.05L8.6 22.5ZM9.45 19.95L12 18.85L14.6 19.95L16 17.55L18.75 16.9L18.5 14.1L20.35 12L18.5 9.85L18.75 7.05L16 6.45L14.55 4.05L12 5.15L9.4 4.05L8 6.45L5.25 7.05L5.5 9.85L3.65 12L5.5 14.1L5.25 16.95L8 17.55L9.45 19.95ZM12 17C12.2833 17 12.5208 16.9042 12.7125 16.7125C12.9042 16.5208 13 16.2833 13 16C13 15.7167 12.9042 15.4792 12.7125 15.2875C12.5208 15.0958 12.2833 15 12 15C11.7167 15 11.4792 15.0958 11.2875 15.2875C11.0958 15.4792 11 15.7167 11 16C11 16.2833 11.0958 16.5208 11.2875 16.7125C11.4792 16.9042 11.7167 17 12 17ZM11 13H13V7H11V13Z"
													fill="#1C1B1F"></path></g></svg></i>꼭 알아두세요!</span>
									<div class="noticeBox__content">
										<div class="admin">
											<p>
												※100kg 이하 탑승 가능합니다.<br>※마감 시간과 입장 가능 시간이 다를 수 있으니 인지해
												주시기 바랍니다.
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="_page__offSchedule_ntppe_69">
						<div class="inner2">
							<div class="section">
								<div class="section__head">
									<div class="section__title-box">
										<span class="section__title"><span
											class="title--button">운휴 일정</span></span>
									</div>
									<div class="section__controlers">
										
										<input type="button" class="button button--small button--line viva_text_color" style="border: 1px solid #FF6124; font-size:13px;" value="자세히 보기" id="holiday_btn"/> 
									</div>
								</div>
								<div class="section__body">
									<div class="contentBox _iconDate_ntppe_661 contentBox--gray">
										<div class="_iconDate__box_ntppe_666">
										
										
										
										<c:set var="startNum" value="0"/>
										<c:if test="${operate.size()!=1}">
											<c:set var="startNum" value="1"/>
										</c:if>
										
										<c:forEach var="operateItem" items="${operate}" begin="${startNum}" >
											<div class="_iconDate__item_ntppe_682">
												<span class="_iconDate__iconWrap_ntppe_692 inspection"><i
													class="icon _iconDate__icon_ntppe_692"
													style="--iconColor: var(--color-white);"><svg
															width="24" height="24" viewBox="0 0 24 24" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<path
																d="M20.9898 7.37503C20.976 7.2148 20.6184 6.90708 20.467 6.85219C20.3153 6.79697 20.1454 6.83456 20.0313 6.94809L17.7417 9.23769L14.7678 6.26374L17.1032 3.93712C17.2175 3.82337 17.2547 3.65413 17.1997 3.50324C17.1441 3.35205 16.7774 3.03175 16.6162 3.01787C15.1979 2.89613 13.8082 3.40061 12.8034 4.40174C11.4273 5.77278 11.0629 7.77488 11.7082 9.48143C11.6377 9.54063 11.5681 9.60336 11.4994 9.671L3.70384 16.9993C3.70109 17.002 3.69838 17.0049 3.69541 17.0075C2.77861 17.9209 2.77861 19.407 3.69541 20.3206C4.61235 21.2339 6.09318 21.2228 7.00982 20.3094C7.01377 20.3057 7.01739 20.302 7.021 20.2979L14.3128 12.4712C14.3793 12.4047 14.441 12.3351 14.4992 12.2637C16.2127 12.9077 18.2236 12.5455 19.6009 11.1736C20.6055 10.1724 21.1122 8.78782 20.9898 7.37503Z"
																stroke="var(--iconColor, #111111)" stroke-width="1.5"
																stroke-linejoin="round"></path></svg></i></span>
												<div class="iconDate__textBox">
													<strong class="_iconDate__date_ntppe_721">${operateItem.attracOperDate}</strong><span
														class="_iconDate__sub_ntppe_735">정기점검</span>
												</div>
											</div>
											
											</c:forEach>
										
										</div>
										
										
										
										<div class="infoList _iconDate__infoList_ntppe_745"
											style="--itemGap: 0.4rem;">
											<ul class="infoList__list">
												<li class="infoList__item _iconDate__infoItem_ntppe_750">기상
													및 파크 상황에 따라 운휴 일정이 변경될 수 있습니다.</li>
												<li class="infoList__item _iconDate__infoItem_ntppe_750">오늘
													기준으로 7일 동안의 운휴정보입니다.</li>
											</ul>
										</div>
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
										<div class="_location__badge_ntppe_772" id="_location__badge_ntppe_772" >
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
														fill="#FF5A4A"></path></g></g></g></svg></i><span style="color:#FF5A4A">${DetailData.attracLoc}</span>
										</div>
										
										<!-- 지도 Ui -->
										<div class="map-container" id="map-container">
											<div id="mapArea">
												<img id="mapImage"
													 src="${CommonURL}/images/attr/${map_fileName}" 
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
			<jsp:include page="../include/bottomBtn_ui.jsp"/>
			<jsp:include page="../include/scrollBtn_ui.jsp"/>
		</div>
		<!-- container 끝 -->

		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
