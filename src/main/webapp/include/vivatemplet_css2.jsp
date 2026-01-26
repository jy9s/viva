<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
@charset "UTF-8";

html, body {
	margin: 0;
	padding: 0;
}

body {
	margin: 0;
	font-family: "Noto Sans KR", sans-serif;
	background: #ffffff;
	font-family: "Noto Sans KR", sans-serif;
}

/* 헤더 */
#header {
	z-index: 999;
	background-color: #fff;
	position: fixed;
	top: 10px;
	left: 0px;
	height: 90px;
	width: 100vw;
	display: flex;
}

hr {
	margin: 0;
	top: 100%;
	width: 100%;
	position: absolute;
}

#logImg {
	margin-right: 50px;
	height: 120px;
	margin-top: 15px;
}

#nav {
	position: relative;
	display: flex;
	align-items: center;
	height: 100%;
	width: 800px;
}

#mainMenu {
	z-index: 9999;
	display: flex;
	justify-content: space-between;
	padding: 0;
	margin: 0;
	font-size: 16px;
	font-weight: 500;
	width: 700px;
}

#mainBar {
	background: #fff;
	min-width: 1300px;
	width: 1250px;
	height: 100%;
	display: flex;
	justify-content: space-between;
	box-sizing: border-box;
	margin: 0px auto;
	align-items: center;
}

.header-btns {
	height: 100%;
	margin-left: 20px;
	margin-right: 20px;
	display: flex;
	gap: 15px;
	align-items: center;
}

.vivaheader_btn {
	padding: 8px 20px;
	border-radius: 20px;
	border: 1.5px solid #FF5A4A;
	color: #FF5A4A;
	background: transparent;
	cursor: pointer;
	font-size: 14px;
}

#subMenu {
	position: absolute;
	top: 0;
	left: 0%;
	display: none;
	justify-content: space-between;
	width: 800px;
	align-items: center;
	background-color: #fff;
}

#subBar {
	display: none;
	background-color: #fff;
	opacity: 0.9;
	position: absolute;
	top: 100%;
	width: 100%;
	height: 200px;
	box-shadow: 0px 10px 10px #8b9597;
}

.liDiv {
	position: relative;
}

.subItems {
	z-index: 999;
	display: none;
	position: absolute;
	top: 300%;
	left: 0;
	width: 140px;
	line-height: 2.7;
}

li {
	color: #000000;
	list-style: none;
}

a {
	font-size: 15px;
	color: #7c7c7c;
	text-decoration: none;
}

a:hover {
	color: #3C25AB;
}

ul {
	padding: 0;
}

/* 메인 컨텐츠 여백 */


.container.isClose {
	display: none;
}
/* 푸터 */
#footer {
	width: 100%;
	background: #fafafa;
	height: 200px;
	margin-top: 0px;
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

.footer-menu {
	display: flex;
	gap: 25px;
	font-size: 13px;
	max-width: 1200px;
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
/* 햄버거 메뉴  */
/* 메뉴 목록 기본 스타일: 화면 밖으로 숨김 */
.hamburger-list {
	position: absolute;
	top: 60px;
	right: 0; /* 왼쪽으로 숨김 */
	transition: right 0.3s ease; /* 부드러운 애니메이션 효과 */
	background-color: #fff;
	width: 100vw;
	visibility: hidden;
}

/* 메뉴가 열렸을 때의 스타일: 화면 안으로 이동 */
.hamburger-list.is-open {
	visibility: visible;
	background-color: #000;
	position: absolute;
	top: 50px;
	right: 0; /* 왼쪽으로 숨김 */
	transition: right 0.3s ease; /* 부드러운 애니메이션 효과 */
	background-color: #fff;
	width: 100vw;
	z-index: 998 ;
}

.hamburger-toggle {
	display: none;
	cursor: pointer;
}
/* 상단 언어/홈 영역 */
.top-bar {
	padding: 15px 20px;
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 14px;
}

.top-bar img {
	width: 20px;
	vertical-align: middle;
}

/* 로그인 박스 */
.login-box {
	margin: 20px auto;
	width: 80%;
	background: #f7f7f7;
	padding: 15px;
	border-radius: 8px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 15px;
	border: 1px solid #ddd;
	cursor: pointer;
}

/* 예매/등록 라인 */
.reservation-box {
	margin: 20px auto;
	width: 80%;
	background: linear-gradient(90deg, #C545FF, #5D09FF);
	padding: 15px;
	border-radius: 12px;
	color: #fff;
	display: flex;
	justify-content: space-around;
	font-size: 18px;
	font-weight: bold;
}

.reservation-box div {
	cursor: pointer;
}

.menu-section {
	width: 80%;
	margin: 40px auto;
}

.menu-title {
	font-size: 13px;
	color: #9d9d9d;
	margin-bottom: 10px;
}

.menu-list {
	display: grid;
	grid-template-columns: 1fr 1fr; /* 두 개의 열을 일정하게 */
	column-gap: 120px; /* 좌우 간격(원하면 조절 가능) */
	margin-bottom: 40px;
	font-size: 17px;
	font-weight: bold;
}

hr {
	margin: 0px;
	position: absolute;
	top: 100%;
	width: 100%;
}

.close {
	z-index: 999;
	opacity: 1;
	background-color: #fff;
	height: 100%;
	width: 20px;
}
#closetop{
 width: 100%;
 position: fixed; top: 0; left: 0;
 height: 10px;
 background-color: #fff; opacity: 1;
 z-index: 998;
}

.menu-list div {
	line-height: 32px;
}

.menu-list>div>a {
	color: #000;
}

.menu-list>div>a:hover {
	color: #3C25AB;
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

@media screen and (min-width:1200px) {
	.hamburger-list.is-open {
		visibility: hidden;
	}
	.container.isClose {
		display: block;
	}
}
.subWrap {
	padding: 0;
}
</style>
<script type="text/javascript">
	$(function() {
		
		
		$("#mainMenu>li").mouseover(function() {
			$("#subBar").slideDown(200);
			$(".subItems").slideDown(200);
		});

		$(".container").mouseover(function() {

			$("#subBar").slideUp(200);
			$(".subItems").slideUp(200);
		});
		$(".header-btns").mouseover(function() {

			$(".subItems").slideUp(200);
			$("#subBar").slideUp(200);
		});
		$(".close").mouseover(function() {

			$(".subItems").slideUp(200);
			$("#subBar").slideUp(200);
		});

		$('.hamburger-toggle').on('click', function() {
			// 햄버거 버튼 클릭 시 메뉴 목록에 'is-open' 클래스를 토글합니다.
			$('.hamburger-list').toggleClass('is-open');
			$('.container').toggleClass('isClose');
			// 아이콘 모양을 바꾸려면 버튼에도 클래스를 토글할 수 있습니다.
			$(this).toggleClass('active');
			
		});
	});
</script>