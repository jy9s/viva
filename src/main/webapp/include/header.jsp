<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="siteproperty.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.headMenu{
font-size : 17px;
}
</style>
<div class="close"></div>
		<div id="mainBar">
			<div class="logo">
				<button onclick="location.href='${CommonURL}/main/mainPg_Include.jsp'" ><img src="${CommonURL }/images/vivaLog.png"
					alt="VIVA PARK" id="logImg" /></button>
			</div>
			<button class="hamburger-toggle" style="background-color:#fff; border : 0px;"><img src="${CommonURL }/images/hamburger_menu.png"/></button>
			<div id="nav">
				<ul id="mainMenu" class="">
					<li>
						<div class="liDiv">
							<a class="headMenu" href="${CommonURL}/attraction/viva_Attraction_main.jsp">즐길거리</a>
							<div class="subItems">
								<ul>
									<li><a href="${CommonURL}/attraction/viva_Attraction_main.jsp">어트랙션</a></li>
									<li><a href="${CommonURL}/restaurant/viva_Restaurant_main.jsp">레스토랑</a></li>
									<li><a href="${CommonURL}/giftShop/viva_Gift_main.jsp">기프트샵</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="liDiv">
							<a class="headMenu" href="${CommonURL}/perf/perform.jsp?filter=all">행사</a>
							<div class="subItems">
								<ul>
									<li><a href="${CommonURL}/perf/perform.jsp?filter=2">공연</a></li>
									<li><a href="${CommonURL}/perf/perform.jsp?filter=1">퍼레이드</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="liDiv">
							<a class="headMenu"  href="${CommonURL}/pay/ticketPrice.jsp">요금/예매</a>
							<div class="subItems">
								<ul>
									<li><a href="${CommonURL}/pay/ticketPrice.jsp">티켓 요금</a></li>
									<li><a href="${CommonURL}/pay/reserve.jsp">할인/예매</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="liDiv">
							<a class="headMenu" href="${CommonURL}/info/user_guide2.jsp">이용정보</a>
							<div class="subItems">
								<ul>
									<li><a href="${CommonURL}/info/user_guide2.jsp">오시는 길</a></li>
									<li><a href="${CommonURL}/info/user_guide1.jsp">운영/운휴</a></li>
									<li><a href="${CommonURL}/info/user_guide3.jsp">이용 안내</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<div class="liDiv">
							<a class="headMenu" href="${CommonURL }/notice/Notice.jsp">소통 서비스</a>
							<div class="subItems">
								<ul>
									<li><a href="${CommonURL}/notice/Notice.jsp">공지</a></li>
									<li><a href="${CommonURL}/FAQ/FAQ.jsp">FAQ</a></li>
									<li><a href="${CommonURL}/inquiry/Inquiry.jsp">문의</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<%
			Object user = session.getAttribute("UserId");
			
			pageContext.setAttribute("user", user);
			%>
			<c:choose>
			<c:when test="${user!=null}" >
				<div class="header-btns">
				<a href="${CommonURL}/pay/reserve.jsp" class="vivaheader_btn" style="color: #FF6124; border: 1.5px solid #FF6124; ">예약하기</a>
				<a href="${CommonURL}/include/logoutProcess.jsp" class="vivaheader_btn" style="color: #000; border: 1.5px solid #000;">로그아웃</a>
			</div>
			</c:when>
			<c:otherwise>
			<div class="header-btns">
				<a href="${CommonURL}/pay/reserve.jsp" class="vivaheader_btn" style="color: #FF6124; border: 1.5px solid #FF6124; ">예약하기</a>
				<a href="${CommonURL}/login/loginPg_Include.jsp" class="vivaheader_btn" style="color: #000; border: 1.5px solid #000;">로그인</a>
			</div>	
			</c:otherwise>
			</c:choose>
		</div>
		<div id=subBar >
		<div class="close" style="float: right;" ></div>
		<div class="close"></div>
		</div>
		<div class="close"></div>
		<hr style="margin:0px !important">