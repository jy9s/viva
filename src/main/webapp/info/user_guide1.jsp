<%@page import="kr.co.viva.operate.OperateServiceDTO"%>
<%@page import="kr.co.viva.operate.OperateService"%>
<%@page import="java.util.Formatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/siteproperty.jsp" %>


<%
	OperateService os = OperateService.getInstance();
	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
	
	List<OperateServiceDTO> list = os.searchAtrraction(today); 

	

	pageContext.setAttribute("OperateData", list);



%>
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
	
<link rel = "shortcut icon" href="${CommonURL}/img/farvicon.png">	

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>

 <link rel="stylesheet" type="text/css"
	href="${CommonURL}/info/holiday1.css" />

<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>






<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<jsp:include page="../include/scrollBtn_css_js.jsp"/>
<%-- <jsp:include page="../include/user_guide_css_js.jsp"/> --%>
<style type="text/css">
.wrap {
	margin: 0px auto;
	width: 100%;
	height: auto;
}

.container {
	height: auto;
	margin-top: 100px;
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

.nav-item {
	list-style: none;
}


li {
	list-style: none;
}

/* 캐러셀 관련 */
#innerSwiper {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 20px; /* 위로 올림 */
	height: 300px;
	background-color: #F6F6F6;
	flex-direction: column; /* 세로로 쌓이도록 */
	border-radius: 30px;
	overflow: visible; /* 화살표가 잘리지 않도록 */
}

.swiper {
	width: 100%;
	padding: 0 40px; /* 양쪽에 화살표 공간 확보 */
	box-sizing: border-box;
	position: relative;
	margin: 0px auto;
}

.swiper-slide {
	width: 70px; /* 버튼 폭과 동일하게 */
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
}

.dateBtn, .dayDiv {
	font-family: NotoSansKR;
	border-radius: 10px;
	color: #333333 !important;
	z-index: 10;
}

.dateBtn.active {
	background-color: #FF6B00;
	color: #FFFFFF !important;
	border: 1px solid #FF6B00;
	border-radius: 10px;
}

.dateBtn {
	border: 0.5px solid #DDDDDD;
	background-color: #FFFFFF;
}

.swiper-button-prev, .swiper-button-next {
	width: 40px; /* 화살표 버튼 가로 */
	height: 40px; /* 화살표 버튼 세로 */
	border-radius: 50%; /* 원형 */
	top: 60%;
	transform: translateY(-50%);
	z-index: 10;
	/* 기본 화살표 아이콘 색상 변경 */
	--swiper-navigation-color: gray; /* Swiper 내 아이콘 색상 */
}

/* 위치 */
.swiper-button-prev {
	left: 1px;
}

.swiper-button-next {
	right: 1px;
}

.swiper-button-prev::after, .swiper-button-next::after {
	font-size: 16px; /* 아이콘 크기 조절 */
	color: gray; /* 아이콘 색상 */
}

/*캐러셀 끝*/
#timeInfo {
	display: flex;
	margin-top: 40px; /* Swiper와 간격 */
	font-family: NotoSansKR;
	font-size: 16px;
	text-align: center;
	border: 1px solid #DDDDDD;
	background-color: #FFFFFF;
	width: 300px;
	height: 60px;
	border-radius: 30px;
	padding: 5px;
	justify-content: center;
	align-items: center;
}

#miniMenu, .miniMenuSub, .nav-link-mini {
	font-family: 'NotoSansKR', sans-serif !important;
	text-decoration: none !important;
	color: gray;
}

.nav-link:hover {
	color: gray;
}

.footer-inner>.footer-top>img{
	width: 50px;
	height: 50px;
}

.floatingBtn__topBtn svg {
    display: block;
    transform: translateY(1px);  /* ⭐ 시각적 중앙 보정 */
}



.dropdown-menu>li{
	padding-top: 3px;
	padding-bottom: 3px;
	
	
	
	
	
}

.dropdown-menu>li>a{
	font-family: sans-serif;
	font-size: 14px;
	
	
	
}

.dropdown-menu>li>a:hover {
	color:black;
	font-weight: 500;
	
	
}


#logImg{
width: 120px;
height: 120px; 
 
}



</style>



<script type="text/javascript">

var selectedSlideIndex = 15;

$(function(){

	var today= new Date();
	var date = today.getDate();
	console.log(date);
	var day = ["일","월","화","수","목","금","토"];
	
	
	var swiper;
	swiper = new Swiper('.swiper', {
	slidesPerView: 9,        // 한 화면에 9개
	slidesPerGroup: 9,
	centeredSlides: false,
	initialSlide: selectedSlideIndex,
	spaceBetween: 15,
	pagination: {
	el: '.swiper-pagination',
	type: 'fraction',
	},
	navigation: {
	nextEl: '.swiper-button-next',
	prevEl: '.swiper-button-prev',
	},
	breakpoints:{
		
		1024: {
            slidesPerView: 9,   // 3개 표시
            spaceBetween: 50,
            slidesPerGroup: 9,
        },
        
        900: {
            slidesPerView: 7,   // 3개 표시
            spaceBetween: 45,
            slidesPerGroup: 7,
        },
        
      
        800: {
            slidesPerView: 7,   // 3개 표시
            spaceBetween: 53,
            slidesPerGroup:7,
        },
        
        700: {
            slidesPerView: 6,   // 3개 표시
            spaceBetween: 43,
            slidesPerGroup: 6,
        },
        
       
        
        320: {
            slidesPerView: 4,   // 3개 표시
            spaceBetween: 40,
            slidesPerGroup: 4,
        }
		
	},
	//화면 크기가 변경될 때 현재 날짜는 추가함
	on:{
		//Swiper가 초기화된 후 화면 크기가 변경될때 실행하는 것 
		init:function(){
			  this.slideTo(selectedSlideIndex, 0);  
			
			
		},
		resize:function(){
			//애니메이션 없이 즉시 이동하는 라는 뜻 
			  this.slideTo(selectedSlideIndex, 0);  
		}
		
	},
	
	virtual: {
	slides: (function () {
		var slides = [];
		for (var i = -15; i < 15; i ++) {
			var tempDate = new Date();
			tempDate.setDate(date + i);
			
			let isToday = (i === 0) ? "active" : ""; 
			
			
			
			slides.push(
					  "<div>"
				    + "<form id='postFrm'>"
				    + "<input type='hidden' name='year' value='" + tempDate.getFullYear() + "'>"
				    + "<input type='hidden' name='month' value='" + (tempDate.getMonth() + 1) + "'>"
				    + "<input type='button' value='" + tempDate.getDate() 
				    + "' name='day' class='dateBtn " + isToday 
				    + "' onclick='viewBtn(this)' style='width:70px; height:70px; cursor:pointer;'>"
				    + "<div class='dayDiv'>" + day[tempDate.getDay()] + "</div>"
				    + "</form>"
				    + "</div>"
			);
			
		}//end for
		return slides;
	})(),
	},//virtual
	});
	
	//AJAX로 나중에 동적으로 생성된 .cardItem__link은 리스너가 붙지 않는다.
	//그래서 $(document).on으로 항상 클릭요소 처리를 위해 사용 
	$(document).on("click",".cardItem__link", function(){


		var num = $(this).find(".attractionNum").val();
		
			location.href="${CommonURL}/attraction/viva_AttractionDetall.jsp?attracCode="+num;


		});
	

});//ready




function viewBtn(btn) {
	var $form = $(btn).closest("form");
    
    // 1. 필요한 날짜 데이터 수집
    var year  = $form.find("input[name='year']").val();
    var month = $form.find("input[name='month']").val();
    var date = btn.value; // 눌렀을때 날짜 (일)
    // 서버로 보낼 완전한 날짜 문자열 (예: "2025-12-02")
    // 월은 10 미만일 경우 앞에 0을 붙여줍니다 (패딩)
    var formattedMonth = month.length === 1 ? '0' + month : month;
    var formattedDate = date.length === 1 ? '0' + date : date;
    var fullDate = year + "-" + formattedMonth + "-" + formattedDate;
	
    
    $(".dateBtn").removeClass("active");
    $(btn).addClass("active");
    
    
 // ⭐ ⭐ ⭐ 추가된 부분: 선택된 버튼의 인덱스를 전역 변수에 저장 ⭐ ⭐ ⭐
    // virtual slides에서 인덱스 찾기
    var $slide = $(btn).closest(".swiper-slide");
    if ($slide.length) {
        // Swiper 슬라이드는 0부터 시작하는 인덱스를 가집니다.
        // 현재 슬라이드의 data-swiper-slide-index 속성에서 인덱스를 가져옵니다.
        selectedSlideIndex = parseInt($slide.attr('data-swiper-slide-index'));
    }
    
    var param = "Date=" + fullDate;
    
    $.ajax({
    	url:"user_guide_process1.jsp",
    	type:"GET",
    	data : param,
    	dataType:"JSON",
    	error:function(xhr){
    		
    		/* alert("error code : "+xhr.status +", msg : "+xhr.statusText); */
    	/* 	 location.href="${CommonURL}/fragments/detail-empty.jsp";  */
    		console.log("error code : "+xhr.status +", msg : "+xhr.statusText);
    	},
    	success:function(data){
    		
    		
		   OperateAttractionPrint(data);
    		
    	}
    });//ajax
    
    console.log(fullDate);
}//viewBtn

function OperateAttractionPrint(data){
		var output="";
		$.each(data,function(ind,attrac){
			output+="<li class='attraction__item'>";
			output+="<div class='cardItem cardItem--attraction'>";
			output+="<div class='cardItem__link' id='"+attrac.num+"' style='cursor: pointer;'>";
			output+="<input type='hidden' value='"+attrac.num+"' class='attractionNum'/>";
			output+="<div class='cardItem__img'>";
			output+="<img src='${CommonURL}/upload/"+attrac.preview+"' alt=''>";
			
			output+="</div>";
			output+="<div class='cardItem__cont'>";
			output+="<span class='cardItem__title'>"+attrac.name+"</span>";
			output+="</div>";
			output+="<span class='cardItem__status red'></span>";
			output+="</div></div>";
			output+="</li>";
			
		});//each
		
	
		
		
		$(".attraction__list").html(output);
			
	
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

		<!-- 메인 공간(비어있는 흰 배경 영역) -->
		<div class="container">
			<div class="page_navi"
				style="margin-bottom: 20px; margin-left: 30px; padding-top: 40px; font-family: sans-serif; ">
				<!-- <img src="images/house.png" /> -->
				<a href="${CommonURL }/main/mainPg_Include.jsp"><svg width="13" height="13" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path fill-rule="evenodd" clip-rule="evenodd" d="M2.68299 8.40241C2.24896 8.78218 2 9.33084 2 9.90756V16C2 17.1046 2.89543 18 4 18H16C17.1046 18 18 17.1046 18 16V9.90756C18 9.33084 17.751 8.78218 17.317 8.40241L11.9755 3.7286C10.8444 2.73891 9.15557 2.7389 8.02449 3.7286L2.68299 8.40241ZM10 12C8.89543 12 8 12.8955 8 14V18H12V14C12 12.8955 11.1046 12 10 12Z"
				fill="#495057"></path></svg></a>
				<span style="font-size: 11px; color:#adb5bd" >&nbsp; |</span>																	
												
												
													
				
				
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-offset="20, 0"
						style="background-color: #fff; color: #333; border: none; padding: 0px;  margin-left: 10px; margin-top: 1px; font-size: 16px; color:#adb5bd; font-family: sans-serif; ">
						이용정보</button>

					<ul class="dropdown-menu dropdown-menu-end"
						style="width: 100px !important; min-width: 100px !important; text-align: center;">
						<li><a
							href="${CommonURL}/attraction/viva_Attraction_main.jsp"
							style="margin: 5px 10px; width: auto; heigh: auto; padding: 0px;">즐길거리</a></li>
						<li><a href="${CommonURL}/perf/perform.jsp?filter=all"
							style="margin: 5px 10px; width: auto; heigh: auto; padding: 0px;">행사</a></li>
						<li><a href="${CommonURL}/pay/ticketPrice.jsp"
							style="margin: 5px 10px; width: auto; heigh: auto; padding: 0px;">요금/예매</a></li>
						<li><a href="${CommonURL}/info/user_guide2.jsp"
							style="margin: 5px 10px; width: auto; heigh: auto; padding: 0px;">이용정보</a></li>
						<li><a href="${CommonURL}/notice/Notice.jsp"
							style="margin: 5px 10px; width: auto; heigh: auto; padding: 0px;">소통서비스</a></li>
					</ul>


					<%-- <jsp:include page="../include/page_navi.jsp"></jsp:include> --%>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-offset="15, 0"
						style="background-color: #fff; color: #333; border: none; padding: 0px; margin-left: 10px; margin-top: 1px;  font-size: 16px; font-weight: bold; font-family: sans-serif;">
						운영/운휴</button>
					<ul class="dropdown-menu dropdown-menu-end"
						style="width: 100px !important; min-width: 60px !important; text-align: center; ">
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
				운영/운휴
			</div>


			<div id="inner2">
				<div id="innerSwiper" style="border-radius: 30px;">


					<div class="swiper">
						<div class="swiper-wrapper"></div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>

					<div></div>

					<div id="timeInfo">
						<svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12.5 21C17.4706 21 21.5 16.9706 21.5 12C21.5 7.02944 17.4706 3 12.5 3C7.52944 3 3.5 7.02944 3.5 12C3.5 16.9706 7.52944 21 12.5 21Z" stroke="#111111" stroke-width="2.05714" stroke-linecap="round" stroke-linejoin="round"></path><path d="M12.5 8V12.5L15.5 14" stroke="var(--iconColor, #FF6124)" stroke-width="2.05714" stroke-linecap="round" stroke-linejoin="round"></path></svg>	
												
					
						<span style="font-weight: bold;">&nbsp;운영시간&nbsp;</span> <span style="color:#dee2e6;">|&nbsp;</span> <span style="font-size: 17px; margin-bottom: 1px;">10:00 ~
							22:00</span>
					</div>

				</div>
			</div>


			<div style="height:auto">
						
			<div class="holiday_content" style="width:100%; margin: 0 auto;">
			<div class="holiday_page">
				<div class="attraction_closure">
					<span class="attraction_closure_text">매표 및 입장마감은
						영업종료 <b class="point">1시간</b> 전까지 입니다
					</span>
				</div>
				<ul class="attraction__list">
				
				
				 <c:forEach var="osDTO" items="${OperateData}">
					<li class="attraction__item">
							<div class="cardItem cardItem--attraction">
							<div class="cardItem__link" id="${osDTO.attracNum}" style="cursor: pointer;">
							<input type="hidden" value="${osDTO.attracNum}" class="attractionNum"/>
								<div class="cardItem__img">
									<img
										src="${CommonURL}/upload/${osDTO.attracPreview}"
										alt="">
								</div>
								<div class="cardItem__cont">
									<span class="cardItem__title"><c:out value="${osDTO.attracName}"/></span>
								</div>

								<span class="cardItem__status red"></span>
							
							
							
							</div>
						</div>
						</li>
				 </c:forEach>
				</ul>

			</div>

		</div>		

	</div>
			
			
			
			<div style="background:#f2f2f2; color:#555; padding:20px; margin-top:20px; font-size:14px; line-height:1.6;">
			• 기상상태에 따라 (0°C 이하 또는 30°C 이상, 7~14m/s 이상의 풍속, 0.2m 이상의 비가 내리는 경우) 비바파크 일부 어트랙션은 운행이 중단될 수 있습니다.<br>
			• 기상상태와 별개로 현장 상황에 따라 예고 없이 운휴하거나 운전 점검을 할 수 있습니다.
			</div>
			

			<jsp:include page="../include/scrollBtn_ui.jsp"/><!--(위로올라가는 스크롤 버튼) -->

		</div>


	<!-- container 끝 -->


	<div id="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</div>
	</div>
</body>
</html>
