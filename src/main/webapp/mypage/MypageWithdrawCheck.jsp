<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/LoginChk.jsp" %>
<%@ include file="../include/siteproperty.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>
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
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>
  <style>
        .input-group {
            max-width: 600px;
            margin: 50px auto;
            display: flex;
            flex-direction: column;
        }

        /* 라벨 스타일 */
        .input-label {
            display: block;
            font-size: 16px;
            color: #333;
            margin-bottom: 8px;
            font-weight: 500;
        }
        /* 필수 입력 (*) 강조 */
        .input-label .required {
            color: #d9534f; /* 빨간색 별표 */
            margin-left: 2px;
        }

        /* 입력 필드 컨테이너 스타일 */
        .input-container {
            /* 이미지처럼 둥근 모서리와 은은한 그림자 효과를 주기 위한 컨테이너 */
            display:flex;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            padding: 0px;
        }

        /* 실제 입력 필드 스타일 */
        .input-text {
            width: 100%;
            height:40px;
            padding: 15px 12px;
            border: 1px solid #e0e0e0; /* 연한 테두리 */
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            outline: none; /* 포커스 시 기본 파란색 테두리 제거 */
            color: #333;
            transition: border-color 0.2s;
        }

        /* 포커스 시 스타일 변화 */
        .input-text:focus {
            border-color: #aaa;
        }

        /* 플레이스홀더 스타일 (선택 사항) */
        .input-text::placeholder {
            color: #aaa;
            font-size: 16px;
        }
    </style>
    <script type="text/javascript">
    function passChk() {
    	if($("#passwordConfirm").val()==""){
    		alert("비밀번호를 입력해주세요.");
    		return;
    	}
        if (confirm("회원 탈퇴 하시겠습니까?")) {
    	$("#passChk").submit();
        }
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
		<div class="container" style="min-height: 900px;">
		<div style="position: relative;">
		<div style="margin-top:90px;margin-bottom: 50px;"><img src="${CommonURL}/images/MypagePassCh.png"/></div>
		<div style="position: absolute; top:50%;left:50%; transform: translate(-50%, -20%);" >
		<h2><strong>회원 탈퇴</strong></h2></div>
		</div>
		<div style="width :400px; margin:20px auto;"><img src="${CommonURL}/images/vivaLogoX.png" 
		style="width:400px;"/></div>
		<div style="width :400px; margin:0px auto;text-align: center;"><h3>회원 탈퇴 후  같은 아이디로<br> 가입이 불가합니다.</h3></div>
		<div class="input-group">
        <form action="withdrwProcess.jsp" method="post" id="passChk">
        <label for="passwordConfirm" class="input-label">
            비밀번호 확인 <span class="required">*</span>
        </label>
        
        <div class="input-container">
            <input 
                type="password" 
                id="passwordConfirm" 
                class="input-text" 
                placeholder="비밀번호 확인" 
            >
        <input type="button" value="확인" onclick="passChk()" 
            style="color: #FF6124; border: 1.5px solid #FF6124; border-radius: 10px; background-color: #fff; margin-left:20px;" />
        </div>
        </form>
    </div>
		</div>
		<!-- container 끝 -->

		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
