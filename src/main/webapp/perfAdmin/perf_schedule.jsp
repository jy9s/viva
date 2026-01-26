<%@page import="performance.AdminPerformDTO"%>
<%@page import="performance.AdminPerformService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
.search-filter .btn {
	/* 1. 이전에 설정했던 너비와 왼쪽 정렬 재확인 */
	min-width: 100px; /* 적절한 너비로 조정 */
	text-align: left; /* 텍스트를 왼쪽으로 정렬 */
	/* 2. Flexbox를 사용하여 내부 요소 (텍스트와 화살표) 정렬 */
	display: flex;
	/* 텍스트와 화살표를 양쪽 끝으로 최대한 밀어냄 */
	justify-content: space-between;
	/* 수직 중앙 정렬 (이미 기본값일 수 있지만 명시) */
	align-items: center;
}

/* 3. Dropdown-toggle의 기본 화살표 스타일을 재설정하여 공간 확보 */
.search-filter .dropdown-toggle::after {
	/* Bootstrap의 기본 margin-left를 0으로 초기화하거나 제거 */
	margin-left: 0;
	/* flexbox가 이미 공간을 만들었기 때문에, 
       ::after 요소 자체의 불필요한 마진을 없애줍니다. */
}

/* 4. 드롭다운 메뉴 너비 맞추기 (이전 코드 재사용) */
.search-filter .dropdown-menu {
	min-width: 100%;
}
</style>

</head>

<script>
	$(function() {

		$("#writeBtn").on('click', function() {

			//세션 유효성 검증 필요			

			document.getElementById("perfFrm").submit();
		});

	});

	function search() {
		var text = $("#keyword").val();

		$("#searchFrm").submit();
		$("#keyword").val("");

		//text를 입력받아서 처리한다.

	}
</script>


<body id="page-top">

	<div id="wrapper">

		<%@ include file="../fragments/sidebar.jsp"%>


		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<%@ include file="../fragments/headerbar.jsp"%>

				<div class="container-fluid">

					<jsp:useBean id="prDTO" class="performance.AdminPerfRangeDTO" scope="page"/>
					<jsp:setProperty property="*" name="prDTO"/>

					<%
					AdminPerformService pfService = new AdminPerformService();

					//게시판 만들기
					//1. 총 레코드 수 구하기
					int totalCnt = pfService.searchPerfTotalCnt(prDTO);
					//2. 한 화면에 보여줄 게시물 수
					int pageScale = pfService.pageScale();
					//3. 총 페이지 수
					int totalPage = pfService.totalPage(totalCnt, pageScale);

					//4.첫 페이지 수 얻기
					String tempPage = request.getParameter("currentPage");

					int currentPage = 1;
					if (tempPage != null) {
						try {
							currentPage = Integer.parseInt(tempPage);
						} catch (NumberFormatException nfe) {

						}
					}
					
					int startNum = pfService.startNum(pageScale, currentPage);
					int endNum = pfService.endNum(startNum, pageScale);
					
					prDTO.setStartNum(startNum);
					prDTO.setEndNum(endNum);
					
					List<AdminPerformDTO> pDTOList = pfService.searchPerform(prDTO);
					
					prDTO.setUrl("perf_schedule.jsp");
					prDTO.setTotalPage(totalPage);
					
					String pagination=pfService.pagination2(prDTO);

					pageContext.setAttribute("pDTOList", pDTOList);
					pageContext.setAttribute("totalPage", totalPage);
					pageContext.setAttribute("totalCount", totalCnt);
					pageContext.setAttribute("startNum", startNum);
					pageContext.setAttribute("endNum", endNum);
					pageContext.setAttribute("pagination", pagination);
					pageContext.setAttribute("totalPage", totalPage);
					
					
					%>

					<h1 class="h3 mb-0 text-gray-800 m-0 font-weight-bold text-danger">행사
						관리</h1>

					<form id="searchFrm" name="searchFrm" action="perf_schedule.jsp">
						<div
							style="display: flex; justify-content: flex-end; margin-right: 30px; margin-bottom: 20px; width: 80%">

							<div style="margin-left: 10px">
								<input type="hidden" id="field" name="field" value="1" /> <input
									type="hidden" id="currentPage" name="currentPage"
									value="${tempPage}" /> <input type="text" class="form-control"
									id="keyword" name="keyword" placeholder="행사 이름">

							</div>
							<div style="margin-left: 10px; display: flex">
								<button class="btn btn-danger" type="button" id="search-button"
									onclick="search()"
									style="font-size: 17px; padding-top: 5px; padding-bottom: 5px;">조회</button>
							</div>
						</div>
					</form>


					<form id="perfFrm" name="perfFrm" action="perf_write.jsp">
						<div class="card shadow mb-4" style="width: 80%">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<colgroup>
											<col style="width: 10%;">
											<col style="width: 50%;">
											<col style="width: 20%;">
											<col style="width: 10%;">
										</colgroup>
										<thead>
											<tr style="text-align: center">
												<th>행사번호</th>
												<th>행사 이름</th>
												<th>행사 기간</th>
												<th>등록일</th>
											</tr>
										</thead>
										<tbody>


											<c:if test="${ empty pDTOList}">
												<tr>
													<td colspan="4" style="text-align: center">작성된 게시글이
														없습니다.</td>
												<tr>
											</c:if>
											<c:forEach var="pDTO" items="${pDTOList}" varStatus="i">
												<tr>
													<td style="text-align:center"><c:out
															value="${totalCount - startNum + 1 - i.index }" /></td>
													<td style="text-align:center"><a href="perf_write.jsp?perfNum=${pDTO.perfNum}&currentPage=${param.currentPage}&field=${param.field}&keyword=${param.keyword}"><c:out
																value="${pDTO.perfTitle}" /></a></td>
													<td style="text-align:center"><c:out value="${pDTO.perfStartDate}" />~<c:out
															value="${pDTO.perfEndDate}" /></td>
													<td style="text-align:center"><c:out value="${pDTO.perfInputDate}" /></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
							<div
								style="text-align: right; margin-bottom: 10px; margin-right: 10px">
								<input class="btn btn-danger" type="button"
									style="font-size: 17px; padding-top: 5px; padding-bottom: 5px; margin-right: 10px"
									value="행사작성" id="writeBtn">
							</div>
						</div>
					</form>


					<%-- <div id="pagination">
						<c:forEach var="tPage" begin="1" end="${totalPage}" step="1">
						[<a
								href="perf_schedule.jsp?currentPage=${tPage}&field=${param.field}&keyword=${param.keyword}">${tPage}</a>]
					</c:forEach>
					</div> --%>
					
					<div id="pagination" style="text-align:center; margin:0px auto;">
					<c:out value="${pagination}" escapeXml="false"/>
					</div>	



				</div>
				<!-- container-fluid -->


			</div>
			<%@include file="../fragments/footer.jsp"%>

		</div>
	</div>
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<%@include file="../fragments/logout_modal.jsp"%>

	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<script src="../js/sb-admin-2.min.js"></script>



</body>

</html>