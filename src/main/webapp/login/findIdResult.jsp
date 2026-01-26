<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="detail-empty.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel ="shortcut icon" href="http://192.168.10.71/html_prj/common/images/favicon.ico"/>
<meta charset="UTF-8">
<title>V!VA PARK</title>
<!-- 내가만든 css -->
<!-- <link rel="stylesheet" type="text/css" href="http://192.168.10.72/html_prj/common/css/main_v251031.css"/>
 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://www.gjw.co.kr/inc/gjw_2024/js/14jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.js?ver=1763706557">
<link rel="stylesheet"
	href="https://www.gjw.co.kr/css/gjw_2024/reset.css?ver=1763706557">
<link rel="stylesheet" type="text/css"
	href="https://www.gjw.co.kr/css/gjw_2024/sub.css?ver=1763706557">
	<jsp:include page="../include/vivatemplet_css.jsp"/>

<style type="text/css">
*{
  margin:0;
  padding:0;
  box-sizing:border-box;
}
body{
  font-family:"Noto Sans KR",sans-serif;
  background:#fff;
  color:#222;
}
a{
  text-decoration:none;
  color:inherit;
}

#inner {
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
	display: flex;
}
#miniMenu, .miniMenuSub, .nav-link-mini {
	font-family: 'NotoSansKR', sans-serif !important;
	text-decoration: none !important;
	color: gray;
}

.container {
	height: auto;
	margin-top: 200px;
}

.nav-link:hover {
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

/* 캐릭터+선 전체 영역 여백 */
.character-wrap{
  margin-top: 80px;
  margin-bottom: 300px;
}

.title-line-box{
  position: relative;
  align-items:center;
  width:1200px;
  height: 200px;     
  margin: 0 auto;     
}

.title-character{
  position: absolute;
  bottom: 0;  
  height: 180px;    
}

.title-character.poppy{
  margin-top:10px;
  left: 10%;       
  height:260px;
  width:auto;
}

.title-character.bibi{
  right: 10%;
  margin-bottom:40px;
  height:210px;
  width:auto;
}

.title-cover-line{
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 130px;              

  background-color: #ffffff; 
  border-top: 1px solid #333;
  z-index: 2;                
}

.title-text{
  align-items:center;
  position:absolute;
  left: 45%;
  font-size: 30px;
  font-weight: bold;
}
.pass-info{
  z-index:3;  
  position:absolute;
  margin-top:-380px;
  left:30%;
}
.pass-info-title{
  font-size: 30px;
  font-weight:10;
}
.pass-info-desc{
  margin-top:20px;
  font-size: 40px;
}

.info-form{
  margin-top: -100px;
  margin-bottom: 100px;
}

.info-form-line{
  border-top: 1px solid #eee;
  align-items:center;
  margin-bottom: 60px;
  
}

.pay-btn-row{
  display:flex;
  justify-content:center;
  gap:12px;
  margin-top: 100px;
}

.pay-btn{
  align-items:center;
  min-width:160px;
  padding:12px 28px;
  font-size:15px;
  border-radius:4px;
  border:1px solid #ff6b3d;
  cursor:pointer;
  font-weight:600;
}

.pay-btn-primary{
  background:#ff6b3d;
  color:#fff;
}
.pay-btn-cancel{
  border: 1px solid #ff6b3d;
  background:#fff;
  color:#ff6b3d;
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script> 
<script type="text/javascript">

$(function(){
	$("#btn").click(function(){
		chkNull();
	});//click
	$("#pass").keydown(function(evt){
		//엔터가 눌러졌을때 만 null 유효성 검증
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keydown
	$("#pass-chk").keydown(function(evt){
		//엔터가 눌러졌을때 만 null 유효성 검증
		if(evt.which == 13){
			chkNull();
		}//end if
	});//keydown

});//ready

function chkNull(){
		var pass=$("#pass").val().trim();
		var passChk=$("#pass-chk").val().trim();		
		if(pass.replace(/ /g,"")==""){
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
			return;
		}//end if
		else if(passChk.replace(/ /g,"")==""){
			alert("칸을 모두 입력해주세요.");
			$("#pass-chk").focus();
			return;
		}else if(pass!==passChk){
			alert("비밀번호와 확인란을 똑같이 입력해주세요.");
			return;
		}
		//$("#frm").submit();
	}

$(function() {
	
	
	$("#mainMenu>li").mouseover(function() {
		$(".opensubMenu").slideDown(200);
		$("#subBar").slideDown(200);
		$(".subItems").slideDown(200);
	});

	$(".container").mouseover(function() {

		$(".opensubMenu").slideUp(200);
		$("#subBar").slideUp(200);
		$(".subItems").slideUp(200);
	});
	$(".header-btns").mouseover(function() {

		$(".subItems").slideUp(200);
		$(".opensubMenu").slideUp(200);
		$("#subBar").slideUp(200);
	});
	$(".close").mouseover(function() {

		$(".subItems").slideUp(200);
		$(".opensubMenu").slideUp(200);
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

<script>
$(function(){
    $("#btn").click(function(){
        location.href="loginFrm.jsp";
    });

    $(".pay-btn-cancel").click(function(){
        history.back();
    });
});
</script>
  
<%
    String userId = request.getParameter("id");
    if (userId == null) userId = "";

    String maskedId = "";
    if (userId.length() > 3) {
        maskedId = userId.substring(0, userId.length() - 3) + "***";
    } else {
        maskedId = userId;
    }
%>



</head>
<body>
<div class="close" style="width:100%; position:fixed;top:0;left:0; height : 10px;"></div>
	<div id="header" >
	<jsp:include page="../include/header.jsp"/>
	<jsp:include page="../include/hamberger.jsp"/>
	</div>
			<div class="container">
			<div class="character-wrap">
			  <div class="title-line-box">
			  
			  <div class="title-text">아이디 찾기</div>
			  
			    <img src="../common/images/poppy.png" class="title-character poppy">
			    <img src="../common/images/bibi.png" class="title-character bibi">
			    <div class="title-cover-line"></div>
			  </div>
			</div>
				<div class="pass-info">
			  	<div class="pass-info-title">아이디 찾기</div>
			  	<div class="pass-info-desc">입력하신 정보와<br>일치하는 아이디 정보입니다.</div>
				</div>
			<div class="info-form">
			<div class="info-form-line">
			</div>
<div class="input-group mb-3" style="width: 800px; left:20%;">
    <span class="input-group-text" style="width:140px;">아이디 찾기 결과</span>
    <input type="text" class="form-control" id="id_chk_result" 
           value="<%=maskedId %>" readonly>
</div>

<p class="text-muted" style="width:800px; left:20%; position:relative;">
    개인정보 보호를 위해 아이디 뒤 3자리는 ***로 표시됩니다.
</p>

<div class="pay-btn-row">
          <button type="button" class="pay-btn pay-btn-primary" id="btn">확인</button>
          <button type="button" class="pay-btn pay-btn-cancel">취소</button>
        </div>
</div>
		</div>
	<!-- 푸터 -->
	<div id="footer"  >
		<jsp:include page="../include/footer.jsp"/>
	</div>

</body>
</html>
