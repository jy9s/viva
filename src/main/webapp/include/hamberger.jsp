<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/siteproperty.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="hamburger-list">
			<%
			Object user = session.getAttribute("UserId");
			
			pageContext.setAttribute("user", user);
			%>
				<c:choose>
			<c:when test="${user!=null}" >
				<button class="login-box" onclick="location.href='${CommonURL}/include/logoutProcess.jsp'">
					<span >로그아웃</span> <span>〉</span>
				</button>
			</c:when>
			<c:otherwise>
				<button class="login-box" onclick="location.href='${CommonURL}/login/loginPg_Include.jsp'">
					<span >로그인해 주세요</span> <span>〉</span>
				</button>
			</c:otherwise>
			</c:choose>

				<div class="reservation-box">
					<div><a href="${CommonURL}/perf/perform.jsp?filter=2" style ="color:#000">공연예매</a></div>
					<div>|</div>
					<div><a href="${CommonURL}/pay/reserve.jsp" style ="color:#000">티켓예매</a></div>
				</div>

				<div class="menu-section">
					<div class="menu-title">즐길거리</div>
					<div class="menu-list">
						<div>
							<a href="${CommonURL}/attraction/viva_Attraction_main.jsp">어트랙션</a><br>
							<a href="${CommonURL}/restaurant/viva_Restaurant_main.jsp">푸드코트</a>
						</div>
						<div style="margin-right : 100px">
							 <a href="${CommonURL}/giftShop/viva_Gift_main.jsp">기프트샵</a>
						</div>
					</div>

					<div class="menu-title">행사</div>
					<div class="menu-list">
						<div>
							<a href="${CommonURL}/perf/perform.jsp?filter=2">공연</a>
						</div>
						<div style="margin-right : 100px">
						 	<a href="${CommonURL}/perf/perform.jsp?filter=1">퍼레이드</a>
						 </div>
					</div>

					<div class="menu-title">요금/예매</div>
					<div class="menu-list">
						<div>
							<a href="${CommonURL}/pay/ticketPrice.jsp">티켓 요금</a><br>
							
						</div>
						<div style="margin-right : 100px">
							<a href="${CommonURL}/pay/reserve.jsp">할인/예매</a>
						</div>
					</div>

					<div class="menu-title">이용정보</div>
					<div class="menu-list">
						<div>
							<a href="${CommonURL}/info/user_guide2.jsp">오시는 길</a><br>
							<a href="${CommonURL}/info/user_guide1.jsp">영업 시간</a> 
						</div>
						<div style="margin-right : 100px">
							<a href="${CommonURL}/info/user_guide3.jsp">파크 이용안내</a>
						</div>
					</div>
					
					<div class="menu-title">소통 서비스</div>
					<div class="menu-list">
						<div>
							<a href="${CommonURL}/notice/Notice.jsp">공지</a><br>
							<a href="${CommonURL}/FAQ/FAQ.jsp">FAQ</a> 
						</div>
						<div style="margin-right : 100px">
							<a href="${CommonURL}/inquiry/Inquiry.jsp">문의</a>
						</div>
					</div>

				</div>
			</div>
			<!-- 햄버거 메뉴 끝 -->