<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- 로그인폼 디자인 시작 -->
<style type="text/css">

/* 배경 영역 */
/* #loginBgWrap {
    position: relative;
    height: calc(100vh - 120px);
    overflow: hidden;
} */
#loginBgWrap {
    position: relative;
    height: 100vh; 
    overflow: hidden;
}

/* 
.bg-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
} */ 
.bg-img {
    position: absolute;
    top: 100px;
    left: 0;
	bottom: 0;
	width : 1900px;
    object-fit: cover;   /* ← 핵심 */
    object-position: center;

    z-index: 1;
}
/* 로그인 카드 */
.loginFrm {

    width: 380px;
    background: #fff;
    padding: 45px 40px;
    border-radius: 22px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.15);
    
    position: absolute;
    top: 50%;
    right: 15%;
    transform: translateY(-50%);
    z-index: 2;
}


/* .loginFrm {
    width: 380px;
    background: #fff;
    padding: 45px 40px;
    border-radius: 22px;
    box-shadow: 0 12px 35px rgba(0,0,0,0.15);

    position: absolute;
    top: 50%;
    right: 8%;
    transform: translateY(-50%);
} */

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

/* 메뉴 */
.find_joinLink {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.find_joinLink a {
    font-size: 13px;
    color: #888;
}

.find_joinLink a:hover {
    text-decoration: underline;
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
<!-- 로그인폼 디자인 끝 -->

<script type="text/javascript">

$(function(){

	$("#btn_login").click(function(){
		
		if($("#inputId").val()==""){
			alert("아이디 필수 입력");
			 return;
		}
		if($("#inputPw").val()==""){
			alert("비밀번호 필수 입력");
			 return;
		}
		
		$("#loginFrm").submit();
				
	});		
	
	
});


</script>

		<!-- 로그인 창 -->
	      
	   	
	       <div class="loginFrm">
	           <div class="page_tit">
	               <h2>로그인</h2>
	           </div>
	           <form id="loginFrm" name="loginFrm" method="POST" action="login_user_process.jsp"> 
	           <div class="input_type">
	               <input type="text" id="inputId" name="id" placeholder="아이디 입력">
	           </div>
	   
	           <div class="input_type">
	               <input type="password" id="inputPw" name="password" placeholder="비밀번호 입력">
	           </div>
	   
	           <div class="find_joinLink">
	               <a href="${CommonURL }/login/_findId.jsp">아이디 찾기</a>
	               <a href="${CommonURL }/login/passInfoChk.jsp">비밀번호 찾기</a>
	               <a href="${CommonURL }/login/join_Include.jsp">회원가입</a>
	           </div>
	   
	           <button type="submit" class="btn_red" id="btn_login" onclick="return false">
	               로그인
	           </button>
	           </form>
	       </div>
	
	    <!-- 로그인창 끝 -->

	