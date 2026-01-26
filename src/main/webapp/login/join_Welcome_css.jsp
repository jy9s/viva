<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
body {
	font-family: 'Pretendard', sans-serif;
	background-color: #fffaf5;
	margin: 0;
	padding: 0;
}

#completeWrap {
	width: 600px;
	margin: 120px auto;
	text-align: center;
	padding: 80px 60px;
	background: #ffffff;
	border-radius: 22px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

#logo {
	width: 240px;
	margin-bottom: 30px;
}

#completeWrap h2 {
	font-size: 28px;
	font-weight: 700;
	margin-bottom: 15px;
}

#completeWrap p {
	font-size: 16px;
	color: #888;
	margin-bottom: 40px;
}

#confirmBtn {
	width: 160px;
	padding: 14px 0;
	font-size: 17px;
	background: #ffffff;
	border: 2px solid #ff7a00;
	color: #ff7a00;
	border-radius: 12px;
	cursor: pointer;
	transition: 0.2s;
}

#confirmBtn:hover {
	background: #ff7a00;
	color: #ffffff;
}
</style>

<div class="wrap">

	<!-- 메인 공간(비어있는 흰 배경 영역) -->
	<div class="container">
		<div id="completeWrap">

			<!-- 로고 -->
			<img src="${CommonURL}/img/logo.png" id="logo">

			<!-- 안내 문구 -->
			<h2>
				${param.name}님<br>회원가입이 완료되었습니다
			</h2>
			<p>로그인 하시면 더욱 다양한 서비스와 혜택을 받으실 수 있습니다</p>

			<!-- 확인 버튼 -->
			<button id="confirmBtn"
				onclick="location.href='${CommonURL}/main/mainPg_Include.jsp'">
				확인</button>

		</div>
		<h1></h1>
	</div>
</div>