<%@page import="reserve.AdminReserveDTO"%>
<%@page import="java.util.List"%>
<%@page import="reserve.AdminReserveService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>
<c:set var="field" value="${param.field != null ? param.field : '1'}" />
	
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
/* 드롭다운 버튼에 적용된 고유 클래스 선택 */
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

<style>
.refund-btn {
background-color:#ffffff;
color:#ff6b00;
padding-top:5px;
padding-bottom:5px;
}
.table-responsive .table td {
    vertical-align: middle;
}

</style>


</head>

<script>
	$(function() {
		
		// 검색 후에도 카테고리바 유지되게 하기
		var field = '<c:out value="${field}" />';
        var fieldTextMap = {
            "1": "예매번호",
            "2": "이름",
            "3": "아이디"
        };

        if (field && fieldTextMap[field]) {
            $("#field_text").text(fieldTextMap[field]);
            $("#field_value").val(field);
        }
		
		
        $('.search-filter .dropdown-menu .dropdown-item').on(
				'click',
				function(e) {
					e.preventDefault();
					
					var selectedText = $(this).text();
					// 선택된 항목의 data-value (all, user_num, name, id)를 가져옵니다.
					var selectedValue = $(this).data('value'); 
					
					// 버튼의 텍스트를 업데이트 (id를 category_text로 변경했기 때문에 선택자를 변경)
					$('#field_text').text(selectedText);
					
					// 숨겨진 입력 필드(name="category")의 값을 업데이트합니다. (★ 핵심)
					$('#field_value').val(selectedValue);
					
		});
		
		/* 환불 프로세스 */
		$(".refund-btn").on('click', function() {
			var refundFlag = confirm("환불 하시겠습니까?");
		
			
			if(refundFlag){
				let resNum = this.name; //받아오기
				 $("#resNumInput").val(resNum);
				 $("#nameInput").val("ticket");
				 $("#refundFrm").submit();
			}
		
		});
		/* 환불 프로세스 끝 */
		
		$("tbody").on("click", "tr > .noref", function () {

		    // 해당 tr 안에서 reserve-num div 찾기
		    var $reserveDiv = $(this).closest("tr").find(".reserve-num");
		
		    // data 값 가져오기
		    var num = $reserveDiv.data("reserve-num");
		    var name = $reserveDiv.data("reserve-name");
			
		    // 값이 없으면 실행 방지 (헤더 클릭 방지)
		    if (!num) return;
			
			window.open("detail_receipt.jsp?num="+num+"&type=ticket&name="+name,"idWin","width=500px, height=800px,top="+(window.screenY+120)+", left="+(window.screenX+260));
		
		});
		
	});

	function search() {
		$("#searchFrm").submit();
	}
	
	
	
</script>


<body id="page-top">

	<div id="wrapper">

		<%@ include file="../fragments/sidebar.jsp"%>


		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<%@ include file="../fragments/headerbar.jsp"%>
				
				
				<jsp:useBean id="rDTO" class="reserve.ReserveRangeDTO" scope="page"/>
				<jsp:setProperty property="*" name="rDTO"/>
				<%
				AdminReserveService arService = AdminReserveService.getInstance();
				int totalCount = arService.totalCnt(rDTO,"ticket_reserve");
				
				int pageScale = arService.pageScale();
				int totalPage = arService.totalPage(totalCount, pageScale);
				String tempPage=request.getParameter("currentPage");
				
				int currentPage=1;
				if(tempPage != null){
					try{
					currentPage = Integer.parseInt(tempPage);
					}catch(NumberFormatException nfe){
						
					}
				}					
				int startNum = arService.startNum(pageScale, currentPage); 
				int endNum = arService.endNum(startNum, pageScale);
				
				
				rDTO.setStartNum(startNum);
				rDTO.setEndNum(endNum);
				List<AdminReserveDTO> ticketList = arService.searchReserveList(rDTO,"ticket_reserve");
				
				//arService.titleSubStr(ticketList);
				rDTO.setUrl("ticket_reserve.jsp");
				rDTO.setTotalPage(totalPage);
				
				String pagination=arService.pagination(rDTO,"left");
				
				pageContext.setAttribute("totalCount", totalCount);
				pageContext.setAttribute("pageScale", pageScale);
				pageContext.setAttribute("totalPage", totalPage);
				pageContext.setAttribute("currentPage", currentPage);
				pageContext.setAttribute("startNum", startNum);
				pageContext.setAttribute("endNum", endNum);
				pageContext.setAttribute("ticketList", ticketList);
				pageContext.setAttribute("pagination", pagination);
				pageContext.setAttribute("totalPage", totalPage);
				
				%>		
				
				
				
				

				<div class="container-fluid">

					<h1 class="h3 mb-0 text-gray-800 m-0 font-weight-bold text-danger">티켓 예매 관리</h1>
					<form id="searchFrm" action="ticket_reserve.jsp">
					<div
						style="display: flex; justify-content: flex-end; margin-right: 30px; margin-bottom: 20px; width:80%">

						<div class="dropdown search-filter">
							<button class="btn btn-danger dropdown-toggle" type="button"
								data-toggle="dropdown" aria-expanded="false" id="field_text">예매번호</button>
								<input type="hidden" name="field" id="field_value" value="1">
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" data-value="1">예매번호</a></li>
								<li><a class="dropdown-item" data-value="2">이름</a></li>
								<li><a class="dropdown-item" data-value="3">아이디</a></li>
							</ul>
						</div>

						<div style="margin-left: 10px">
							<input type="text" class="form-control" id="keyword" name="keyword">


						</div>
						<div style="margin-left: 10px">
							<button class="btn btn-danger" type="button" id="search-button"
								onclick="search()"
								style="font-size: 17px; padding-top: 5px; padding-bottom: 5px;">조회</button>
						</div>
					</div>
					</form>

					
					<div class="card shadow mb-4" style="width:80%">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover" id="dataTable" width="100%"
									cellspacing="0">
									<colgroup>
										<col style="width: 7%;">
										<col style="width: 8%;">
										<col style="width: 10%;">
										<col style="width: 8%;">
										<col style="width: 10%;">
										<col style="width: 13%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 7%;">
										<col style="width: 5%;">
									</colgroup>
									<thead>
										<tr style="text-align:center">
											<th>예매번호</th>
											<th>이름</th>
											<th>ID</th>
											<th>예약인원</th>
											<th>금액</th>
											<th>연락처</th>
											<th>결제 수단</th>
											<th>결제 날짜</th>
											<th>환불 여부</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${ empty ticketList }">
										<tr>
										<td colspan="10" style="text-align:center">작성된 게시글이 없습니다.</td>
										<tr>
										</c:if>
										<c:forEach var="ticketDTO" items="${ticketList}" varStatus="i">
										<tr>
										<td class="noref" style="text-align:center; height:60px"><div class="reserve-num" data-reserve-num="${ticketDTO.resNum}" data-reserve-name="${ticketDTO.resName}"><c:out value="${ticketDTO.resNum}"/></div></td>
										<td class="noref" style="text-align:center"><c:out value="${ticketDTO.resName}"/></td>
										<td class="noref" style="text-align:center"><c:out value="${ticketDTO.resId}"/></td>
										<td class="noref" style="text-align:center"><c:out value="${ticketDTO.resCount}"/></td>
										<td class="noref" style="text-align:center"><fmt:formatNumber value="${ticketDTO.resPrice}" pattern="#,###"/></td>								
										<td class="noref" style="text-align:center"><c:out value="${ticketDTO.resTel}"/></td>
										<td class="noref" style="text-align:center"><c:out value="${ticketDTO.resPayMethod}"/></td>
										<td class="noref" style="text-align:center"><c:out value="${ticketDTO.resPayDate}"/></td>
										<td class="noref" style="text-align:center"><c:out value="${ticketDTO.resRefund}"/></td>
										<c:choose>
										<c:when test="${ticketDTO.resRefund eq 'N' }">
										<td style="text-align:center">
										<input type="button" name="${ticketDTO.resNum}" class="btn btn-danger refund-btn" data-refund="${ticketDTO.resNum}" value="환불">
										<form id="refundFrm" name="refundFrm" method="post" action="refund_process.jsp">																			
										<input type="hidden" name="resNum" id="resNumInput">
										<input type="hidden" name="type" id="nameInput">
										<input type="hidden" name="currentPage" value="${param.currentPage}">
										<input type="hidden" name="field" value="${param.field}">
										<input type="hidden" name="keyword" value="${param.keyword}">	
										</form>
										</td>
										</c:when>
										<c:otherwise>
										<td style="text-align:center">환불완료</td>
										</c:otherwise>
										</c:choose>
										
										</tr>										
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>


					<div id="pagination" style="text-align:center">
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

	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="../js/sb-admin-2.min.js"></script>



</body>

</html>