<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
    	url:"${CommonURL}/info/user_guide_process.jsp",
    	type:"GET",
    	data : param,
    	dataType:"JSON",
    	error:function(xhr){
    		
    		/* alert("error code : "+xhr.status +", msg : "+xhr.statusText); */
    		 location.href="${CommonURL}/fragments/detail-empty.jsp"; 
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
			output+="<img src='${CommonURL}/attraction/images/"+attrac.preview+"' alt=''>";
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


