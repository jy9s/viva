<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>V!VA ADMIN</title>
<!-- 2024 경주월드 -->
<script src="https://www.gjw.co.kr/inc/gjw_2024/js/14jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.js?ver=1763706557">
<link rel="stylesheet"
	href="https://www.gjw.co.kr/css/gjw_2024/reset.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/css/gjw_2024/sub.css?ver=1763706557">
	
	

<style>

.wrap{
width:65%;
}


</style>
<style type="text/css">


html, body {
    width: 100%;
    height: 100%;
    margin: 0;
}

.bg-img {
    position: fixed;
    top: 0;
    left: 0;

    width: 100vw;
    height: 100vh;

    object-fit: cover;   /* 비율 유지하면서 꽉 채움 */
    z-index: -1;         /* 뒤로 보내기 */
}


/* 배경 영역 */
#loginBgWrap {
    width: 100%;
    object-fit: cover;
    object-position: center;
}



/* 로그인 카드 */
.loginWrap {
    width: 380px;
    background: #fff;
    padding: 45px 40px;
    border-radius: 22px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.15);

    position: absolute;
    top: 50%;
    right: 8%;
    transform: translateY(-50%);
}

/* 제목 */
.page_tit h2 {
    font-size: 26px;
    font-weight: 700;
    text-align: center;
    margin-bottom: 30px;
}

/* 입력창 */
.input_type {
    margin-bottom: 20px;
}

.input_type input {
    width: 100%;
    padding: 14px 15px;
    border: 1px solid #ddd;
    border-radius: 12px;

    font-size: 15px;
    background: #fafafa;
    transition: all .25s;
}

.input_type input:focus {
    background: #fff;
    border-color: #ff4b66;
    box-shadow: 0 0 0 4px rgba(255,75,102,0.15);
}

/* 버튼 */
.btn_red {
    width: 100%;
    padding: 14px 0;
    border-radius: 12px;
    border: none;

    background: #ff4b66;
    color: #fff;
    font-size: 17px;
    font-weight: 600;
    cursor: pointer;

    transition: all .25s;
}

.btn_red:hover {
    background: #ff2f52;
}

</style>

<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>

$(function(){

	$("#btn_login").click(function(){
		
		if($("#id").val()==""){
			alert("아이디 필수 입력");
			 return;
		}
		if($("#password").val()==""){
			alert("비밀번호 필수 입력");
			 return;
		}
		
		$("#loginFrm").submit();
				
	});		
	
});//ready


</script>

</head>
<body>
	<img src="../img/loginPgAdmin.png" class="bg-img" style="width:65vw">
	<div class="wrap">
		<!-- 헤더 -->
		<!-- 햄버거 메뉴-->
		
		<!-- 메인 공간(비어있는 흰 배경 영역) -->
		
 	   <div id="loginBgWrap">
	   
	       <div class="loginWrap">
	           <form action="login_admin_process.jsp" method="post" id="loginFrm" name="loginFrm">
	           <div class="page_tit">
	               <h2>관리자 로그인</h2>
	           </div>
	   			
	           <div class="input_type">
	               <input type="text" id="id" name="id" placeholder="아이디 입력">
	           </div>
	   
	           <div class="input_type">
	               <input type="password" id="password" name="password" placeholder="비밀번호 입력">
	           </div>
	   
	           <button type="submit" class="btn_red" id="btn_login" onclick="return false">
	               로그인
	           </button>
	           
	           </form>
	       </div>
	    </div>
		<!-- container 끝 -->

	</div>
</body>
</html>
