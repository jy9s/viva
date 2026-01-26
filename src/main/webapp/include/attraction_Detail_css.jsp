<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

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

.content__banner {
	position: absolute;
	width: 100vw;
	left: 50%;
	right: auto;
	margin-left: -50vw;
}
 
/* .content__banner  {
    position: absolute;
    left: 0;
    top: 0 ;
    right: 0  ;
    height: 16rem ;
    overflow: hidden;
} */
@media ( min-width : 1329px) {
	.content__banner {
		height: 36rem;
	}
}

.content__banner--pc {
	display: none;
	object-fit: cover;
	height: 100%;
}

@media ( min-width : 1329px) {
	.content__banner--pc {
		display: block;
	}
}

.content__banner--mo {
	display: block;
	object-fit: cover;
	height: 100%;
}

@media ( min-width : 1329px) {
	.content__banner--mo {
		display: none;
	}
}

.subWrap {
	padding: 0;
}

.content__cont {
	position: relative
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


.footer-inner>.footer-top>img{
	width: 50px;
	height: 50px;
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

.cardItem__status::before {
	content: "정상운행";
}

.red::before {
	content: "정기점검";
}

@media screen and ( max-width : 1200px) {
	#nav {
		display: none;
	}
	.header-btns {
		display: none;
	}
	#header {
		top:0px;
		height: 60px;
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
	.page_navi {
		display: none;
	}
}

#map-container.map-container {
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

.attrac_state{
	width:200px; 
	height: 130px;
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
        width: 160px;
        height: 100px;
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
        width: 130px;
        height: 80px;
    }

}


.attrac_state.red {
    content: url("http://localhost/second_prj/attrectionDT/images/attrac_state_red.png");
}


.button--line {
    background-color: #fff;
    border-color: var(--btnMainColor);
/*     --btnTextColor: var(--btnMainColor) */
     --btnTextColor: color:#FF5A4A;

}

.viva_text_color{
	color:#FF6124;
}
.viva_bg_color{
	background-color:#FFF0EF;
}


.carousel-item {
  aspect-ratio: 1328 / 560; /* 비율 고정 */
}
.carousel-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
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
