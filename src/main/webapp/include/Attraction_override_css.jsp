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
@media screen and ( max-width : 1329px) {
	.breadcrumb__wrap{
		display: none;
	
	}




}
#logImg{
width: 120px;
height: 120px; 
 
}
</style>