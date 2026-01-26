<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
.subWrap {
	padding: 0;
}

#content.container {
    width: 100% !important;
    max-width: 100% !important;
    padding-left: 0 !important;
    padding-right: 0 !important;

    margin-top: 4.8rem !important;
    padding-bottom: 9rem !important;
    position: relative !important;
}


@media ( min-width : 1329px) {
	#content.container {
		margin-top: 13rem !important;
		padding-bottom: 12rem !important;
	}
}

.footer-inner>.footer-top>img{
	width: 50px;
	height: 50px;
}


.content__banner {
	object-fit: cover; /* 이미지 비율 유지하며 꽉 채움 */
}

/* 푸터 */
#footer {
	width: 100%;
	background: #fafafa;
	height: 200px;
	margin-top: 40px;
}

.footer-inner {
	width: 100%;
	max-width: 1500px;
	min-width: 1200px;
	margin: 0 auto;
	font-size: 14px;
	color: #333;
}

.footer-top {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 25px;
	width: 100%;
	height: 100px;
}

.footer-bottom {
	font-size: 12px;
	color: #555;
	line-height: 20px;
}

.footer-icons {
	margin-top: 15px;
	display: flex;
	gap: 12px;
}

.attrac_state{
	width: 200px; 
	height: auto;
}

@media screen and ( max-width : 1200px) {
	#nav {
		display: none;
	}
	.header-btns {
		display: none;
	}
	#header {
		height: 50px;
	}
	#logImg {
		margin-left: 20px;
		height: 60px;
		margin-top: 10px;
	}
	.hamburger-toggle {
		display: block;
		position: fixed;
		top: 20px;
		right: 0vw;
		position: fixed;
	}
	.footer-menu {
		flex-wrap: wrap;
	}
	.footer-inner {
		padding-top: 10px;
		max-width: 1200px;
		min-width: 0px;
	}
	.breadcrumb {
		display: none;
	}
}

.dropdown-item {
	font-size: 14px;
	text-align: center;
	color: #B3B3B3;
}

.dropdown-item:hover {
	font-weight: 500 !important; /* 굵게 */
	color: #000000;
	background-color: #ffffff;
}

.dropdown-menu li {
	list-style: none;
}

.map-container {
	width: 100%;
	height: 600px;
	max-width: 1500px;
	margin: 0 auto;
	border-radius: 20px;
	border: 1px solid #E3E3E3;
	position: relative;
	overflow: hidden;
	touch-action: none;
}

#mapArea {
	width: 100%;
	height: 100%;
	cursor: grab;
}

#mapArea:active {
	cursor: grabbing;
}

#mapImage {
	width: 100%;
	height: 100%;
	object-fit: contain;
	transform-origin: center center;
	transition: transform .2s ease;
}

.controls {
	position: absolute;
	top: 30px;
	right: 30px;
	display: flex;
	flex-direction: column;
	gap: 8px;
}

.controls button {
	width: 45px;
	height: 45px;
	border: 1px solid #ccc;
	border-radius: 10px;
	background: #fff;
	cursor: pointer;
	font-size: 22px;
}

.carousel-item{
	border-radius: 20px;

}

/* 버튼 원형 스타일 유지 */
.carousel-control-prev,
.carousel-control-next {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: #FFFFFF;
    backdrop-filter: blur(5px);
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 1 !important;
    pointer-events: auto;
}

.carousel-control-next-icon,
.carousel-control-prev-icon {
    filter: invert(0) brightness(0.2);
}

/* 버튼 위치 - 이미지 세로 가운데 */
.carousel-control-prev,
.carousel-control-next {
    top: 50%;
    transform: translateY(-50%); /* 정확히 중앙 정렬 */
}

/* 좌우 여백: 반응형 %값 적용 */
.carousel-control-prev {
    left: 2.5%;
}

.carousel-control-next {
    right: 2.5%;
}

/* 작은 화면(모바일)에서 버튼 축소 */
@media (max-width: 768px) {
    .carousel-control-prev,
    .carousel-control-next {
        width: 30px;
        height: 30px;
    }
    .carousel-control-prev-icon,
    .carousel-control-next-icon {
        width: 14px;
        height: 14px;
    }
       .attrac_state {
        width: 140px;
    }
    

}

/* 아주 좁은 화면에서 버튼 더 작게 */
@media (max-width: 480px) {
    .carousel-control-prev,
    .carousel-control-next {
        width: 26px;
        height: 26px;
    }
    .carousel-control-prev-icon,
    .carousel-control-next-icon {
        width: 12px;
        height: 12px;
    }
      .attrac_state {
        width: 110px;
    }

}


.attrac_state.red {
    content: url("http://localhost:8080/second_project/common/images/attrac_state_red.png");
}

.floatingBtn {
    position: fixed;
    bottom: 40px;
    right: 20px;
    z-index: 9999;
    opacity: 0;
    visibility: hidden;
    transition: opacity .3s ease-in-out, visibility .3s;
}

.floatingBtn.show {
    opacity: 1;
    visibility: visible;
}

.viva_text_color{
	color:#FF6124;
}
.viva_bg_color{
	background-color:#FFF0EF;
}

/* 비율 고정 지워서 짤림 방지 */
._visualSlide__imgBox_ntppe_179::before {
    content: none !important;
    display: none !important;
    padding-bottom: 0 !important;
}

/* 컨테이너 유연하게 재정의 */
._visualSlide__imgBox_ntppe_179 {
    position: relative !important;
    width: 100% !important;
    height: auto !important;
    display: flex !important;
    justify-content: center;
    align-items: center;
    overflow: hidden !important;
}

/* 이미지가 절대 안 짤리게 contain 강제 */
._visualSlide__imgBox_ntppe_179 img {
    position: static !important;
    width: auto !important;
    height: auto !important;
    max-width: 100% !important;
    max-height: 100% !important;
    object-fit: contain !important;
    object-position: center !important;
    display: block !important;
}

.bottombtns {
    margin-top: 4rem
}

@media (min-width: 1329px) {
    .bottombtns {
        margin-top:8rem
    }

    .bottombtns .button {
        width: 20rem
    }

    .bottombtns .buttonGroup__item {
        flex-basis: auto;
        flex-grow: 0
    }
}

@media (min-width: 1329px) {
    .inner2 {
        margin:0 auto;
        max-width: 136rem
    }
}


._visualSlide__imgBox_ntppe_179._pcImage_ntppe_197 {
    display: none;
    border-radius: 20px;
}
._visualSlide__imgBox_ntppe_179._pcImage_ntppe_197>img {
    border-radius: 20px;
}

#logImg{
width: 120px;
height: 120px; 
 
}

@media screen and ( max-width : 1329px) {
	.breadcrumb__wrap{
		display: none;
	
	}


</style>