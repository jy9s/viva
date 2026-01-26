<%@page import="dashboard.DashBoardDailyUserDTO"%>
<%@page import="dashboard.DashBoardTicketRevenueDTO"%>
<%@page import="java.util.List"%>
<%@page import="dashboard.DashBoardPerfRevenueDTO"%>
<%@page import="dashboard.DashBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" errorPage="../fragments/isErrorPage.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>
	
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>V!VA ADMIN</title>
<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- sidebar 건들지 말것. -->
		<%@ include file="../fragments/sidebar.jsp"%>


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- headerbar 건들지 말것. -->
				<%@ include file="../fragments/headerbar.jsp"%>


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800 m-0 font-weight-bold text-danger">V!VA
							월드 관리자 대시보드</h1>
						<!-- 
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        -->
					</div>
					
					
					<%
					
					DashBoardService dbService = new DashBoardService();
					List<DashBoardPerfRevenueDTO> perfList= dbService.searchTotalPerf();
					List<DashBoardTicketRevenueDTO> ticketList= dbService.searchTotalTicket();
					
					int totaltodayUser = dbService.searchTotalTodayUser();
					int totalPerf = perfList.get(perfList.size()-1).getPerfRev();
					int totalTicket = ticketList.get(ticketList.size()-1).getTicketRev();
					
					int todayInquiry = dbService.searchTodayInquiry();
					int todayReply = dbService.searchTodayReply();
					
					int onOperate = dbService.searchTodayOnOperate();
					int offOperate = dbService.searchTodayOffOperate();
					
					int totalCntTicket = dbService.searchTodayTicket();
					int refundCntTicket = dbService.searchTodayRefundTicket();
					int totalCntPerf = dbService.searchTodayPerf();
					int refundCntPerf = dbService.searchTodayRefundPerf();
					
					
					pageContext.setAttribute("totaltodayUser", totaltodayUser);
					pageContext.setAttribute("totalPerf", totalPerf);
					pageContext.setAttribute("totalTicket", totalTicket);
					pageContext.setAttribute("todayInquiry", todayInquiry);
					pageContext.setAttribute("todayReply", todayReply);
					pageContext.setAttribute("onOperate", onOperate);
					pageContext.setAttribute("offOperate", offOperate);
					pageContext.setAttribute("totalCntTicket", totalCntTicket);
					pageContext.setAttribute("refundCntTicket", refundCntTicket);
					pageContext.setAttribute("totalCntPerf", totalCntPerf);
					pageContext.setAttribute("refundCntPerf", refundCntPerf);
					
					
					%>


					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xl font-weight-bold text-danger text-uppercase mb-1">
												방문객 수</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
											<fmt:formatNumber value="${totaltodayUser}" pattern="#,###"/>
											</div>
											<div style="font-size: 14px; color: gray; padding: 0px">오늘</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xl font-weight-bold text-danger text-uppercase mb-1">
												입장권 매출</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
											<fmt:formatNumber value="${totalTicket}" pattern="#,###"/>원
											</div>
											<div style="font-size: 14px; color: gray; padding: 0px">이번달</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-ticket-alt fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-4 col-md-6 mb-4">
							<div class="card shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xl font-weight-bold text-danger text-uppercase mb-1">
												행사 매출</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
											<fmt:formatNumber value="${totalPerf}" pattern="#,###"/>원
											</div>
											<div style="font-size: 14px; color: gray; padding: 0px">이번달</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-theater-masks fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>


					</div>

					<!-- Content Row -->

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-4 col-lg-4">
							<jsp:include page="../fragments/dash_user_count.jsp"></jsp:include>
						</div>

						<!-- Pie Chart -->
						<div class="col-xl-4 col-lg-4">
							<jsp:include page="../fragments/dash_ticket_revenue.jsp"></jsp:include>
						</div>

						<div class="col-xl-4 col-lg-4">
							<jsp:include page="../fragments/dash_perf_revenue.jsp"></jsp:include>
						</div>

					</div>



					<!-- Content Row -->
					<div class="row" style="margin-top: 25px">

						<div class="col-xl-6 col-md-6 mb-1">
							<div class="card shadow py-1"
								style="height: 150px; position: relative;">
								<div class="card-body"
									style="padding: 8px 15px; position: relative;">

									<!-- 예매관리 제목 (왼쪽 위 고정) -->
									<div style="position: absolute; top: 10px; left: 15px;">
										<div
											class="text-xl font-weight-bold text-danger text-uppercase"
											style="font-size: 20px;">예매관리</div>
									</div>

									<!-- 테이블 (오른쪽 아래로 배치) -->
									<div
										style="position: absolute; bottom: 30px; right: 30px; display:flex;">
										<table class="table table-bordered table-sm mb-0"
											style="text-align: center;">
											<thead class="thead-light">
												<tr>
													<th style="width:150px">티켓예매</th>
													<th style="width:150px">환불건수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td id="todayCount">${totalCntTicket}</td>
													<td id="refundCount">${refundCntTicket}</td>
												</tr>
											</tbody>
											
										</table>
										<div style="width:50px"></div>
										<table class="table table-bordered table-sm mb-0"
											style="text-align: center;">
											<thead class="thead-light">
												<tr>
													<th style="width:150px">공연예약</th>
													<th style="width:150px">환불건수</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td id="todayCount">${totalCntPerf}</td>
													<td id="refundCount">${refundCntPerf}</td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>


						<div class="col-xl-3 col-lg-6 mb-1">
							<div class="card shadow py-1"
								style="height: 150px; position: relative;">
								<div class="card-body"
									style="padding: 8px 15px; position: relative;">

									<!-- 제목 (왼쪽 위) -->
									<div style="position: absolute; top: 10px; left: 15px;">
										<div
											class="text-xl font-weight-bold text-danger text-uppercase"
											style="font-size: 20px;">1:1 문의</div>
									</div>

									<!-- 테이블 (오른쪽 아래) -->
									<div
										style="position: absolute; bottom: 30px; right: 30px; width: 55%;">
										<table class="table table-bordered table-sm mb-0"
											style="text-align: center;">
											<thead class="thead-light">
												<tr>
													<th>문의 접수</th>
													<th>답변 완료</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td id="askCount">${todayInquiry}</td>
													<td id="answerCount">${todayReply}</td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>

						<div class="col-xl-3 col-lg-6 mb-1">
							<div class="card shadow py-1"
								style="height: 150px; position: relative;">
								<div class="card-body"
									style="padding: 8px 15px; position: relative;">

									<!-- 제목 (왼쪽 위) -->
									<div style="position: absolute; top: 10px; left: 15px;">
										<div
											class="text-xl font-weight-bold text-danger text-uppercase"
											style="font-size: 20px;">놀이기구 관리</div>
									</div>

									<!-- 테이블 (오른쪽 아래) -->
									<div
										style="position: absolute; bottom: 30px; right: 30px; width: 55%;">
										<table class="table table-bordered table-sm mb-0"
											style="text-align: center;">
											<thead class="thead-light">
												<tr>
													<th>정상 운행</th>
													<th>정기 점검</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td id="rideNormal">${onOperate }</td>
													<td id="rideInspect">${offOperate }</td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>

					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- footer 건들지 말것. -->
			<%@include file="../fragments/footer.jsp"%>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<%@include file="../fragments/logout_modal.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../js/demo/chart-area-demo.js"></script>
	<script src="../js/demo/chart-pie-demo.js"></script>

</body>

</html>