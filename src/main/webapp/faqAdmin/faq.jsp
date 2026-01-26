<%@page import="faq.AdminFaqDTO"%>
<%@page import="faq.AdminFaqRangeDTO"%>
<%@page import="faq.AdminFaqService"%>
<%@page import="java.util.List"%>
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

</head>

<script>
	$(function() {
		// 검색 후에도 카테고리바 유지되게 하기
		var field = '<c:out value="${field}"/>';
        var fieldTextMap = {
            "1": "이용정보",
            "2": "온라인예매/우대정보",
            "3": "연간이용",
            "4": "탑승예약제/싱글라이더",
            "5": "장애인 탑승 예약제",
            "6": "기타"
        };

        if (field && fieldTextMap[field]) {
            $("#field_text").text(fieldTextMap[field]);
            $("#field_value").val(field);
        }
		
		
     // 검색창 선택시 카테고리 적용 되게 하기		
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
		
		
		
		$("#writeBtn").on('click', function(){
			
			document.getElementById("faqFrm").submit();
		})
		

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
				<jsp:useBean id="rDTO" class="faq.AdminFaqRangeDTO" scope="page"/>
				<jsp:setProperty property="*" name="rDTO"/>
				<%
					AdminFaqService fService = AdminFaqService.getInstance();
					//1. 총 게시글의 수
					int totalCount = fService.totalCnt(rDTO);
					
					//2. 한 화면에 보여줄 게시물의 수
					int pageScale = fService.pageScale();
					//3. 총 페이지의 수
					
					int totalPage = fService.totalPage(totalCount, pageScale);
					/*
					int totalPage = totalCount/pageScale;					
					if(totalCount%pageScale!=0){
						//딱 떨어지지 않으면 한장 더 필요.
						totalPage++;
					}
					*/
					//4. 시작번호 
					String tempPage=request.getParameter("currentPage");
					
					int currentPage=1;
					if(tempPage != null){
						try{
						currentPage = Integer.parseInt(tempPage);
						}catch(NumberFormatException nfe){
							
						}
					}					
					int startNum = fService.startNum(pageScale, currentPage); //pagenation을 클릭하면 해당페이지의 번호로 설정
					//1 페이지 1, 2페이지 11, 3페이지 21, 4페이지 31					
					//1페이지 : 1*10-10+1 
					//2페이지 : 2*10-10+1					
					//5. 끝번호 1페이지 끝번호 10, 2페이지 끝번호 20
					int endNum = fService.endNum(startNum, pageScale);
					
					
					//rDTO는 시작번호와 끝번호를 web parameter로 받지 않는다.
					//연산된 값(1항~5항)으로 설정한다.
					rDTO.setStartNum(startNum);
					rDTO.setEndNum(endNum);
					//6. 시작번호와 끝 번호사이에 해당하는 모든 게시글을 조회
					List<AdminFaqDTO> faqList = fService.searchFaqList(rDTO);
					
					//글 제목이 20글자를 초과하면 19자까지만 보여주고, 나머진 ...으로 처리.
					fService.titleSubStr(faqList);
					rDTO.setUrl("faq.jsp");
					rDTO.setTotalPage(totalPage);
					
					String pagination = fService.pagination(rDTO, "left");
					
					pageContext.setAttribute("totalCount", totalCount);
					pageContext.setAttribute("pageScale", pageScale);
					pageContext.setAttribute("totalPage", totalPage);
					pageContext.setAttribute("currentPage", currentPage);
					pageContext.setAttribute("startNum", startNum);
					pageContext.setAttribute("endNum", endNum);
					pageContext.setAttribute("faqList", faqList);
					pageContext.setAttribute("pagination", pagination);
					pageContext.setAttribute("totalPage", totalPage);
					
					%>				
					

				<div class="container-fluid">
				
				

					<h1 class="h3 mb-0 text-gray-800 m-0 font-weight-bold text-danger">FAQ 관리</h1>

						<form id="searchFrm" >
					<div
						style="display: flex; justify-content: flex-end; margin-right: 30px; margin-bottom: 20px; width:80%">
						<div class="dropdown search-filter">
							<button class="btn btn-danger dropdown-toggle" type="button"
								data-toggle="dropdown" aria-expanded="false" id="field_text">이용정보</button>
								<input type="hidden" name="field" id="field_value" value="1">
								<input type="hidden" name="currentPage" id="currentPage" value="${param.cuurentPage }">
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" data-value="1">이용정보</a></li>
								<li><a class="dropdown-item" data-value="2">온라인예매/우대정보</a></li>
								<li><a class="dropdown-item" data-value="3">연간이용</a></li>
								<li><a class="dropdown-item" data-value="4">탑승예약제/싱글라이더</a></li>
								<li><a class="dropdown-item" data-value="5">장애인 탑승 예약제</a></li>
								<li><a class="dropdown-item" data-value="6">기타</a></li>
							</ul>
						</div>

						<div style="margin-left: 10px">
							<input type="text" class="form-control" id="searchText" name="keyword">


						</div>
						<div style="margin-left: 10px">
							<button class="btn btn-danger" type="button" id="search-button"
								onclick="search()"
								style="font-size: 17px; padding-top: 5px; padding-bottom: 5px;">조회</button>
						</div>
					</div>

						</form>

					<form id="faqFrm" name="faqFrm" action="faq_write.jsp">
					<div class="card shadow mb-4" style="width:80%">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<colgroup>
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: 50%;">
										<col style="width: 20%;">
									</colgroup>
									<thead>
										<tr style="text-align:center">
											<th>번호</th>
											<th>카테고리</th>
											<th>제목</th>
											<th>작성일</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${ empty faqList}">
										<tr>
										<td colspan="6" style="text-align:center">작성된 FAQ가 없습니다.</td>
										<tr>
										</c:if>
										<c:forEach var="nDTO" items="${faqList}" varStatus="i">
										<tr>
										<td style="text-align: center"><c:out value="${totalCount - startNum+1 - i.index }"/></td>
										<td style="text-align: center"><c:out value="${nDTO.faqType}"/></td>
										<td><a href="faq_write.jsp?num=${nDTO.faqNum}&field=${param.field}&keyword=${param.keyword}&currentPage=${param.currentPage}"><c:out value="${nDTO.faqTitle}"/></a></td>
										<td style="text-align: center"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${nDTO.faqDate }"/></td>
										</tr>										
										</c:forEach>					
									</tbody>
								</table>
							</div>
						</div>
						<div style="text-align:right; margin-bottom:10px; margin-right:10px">
							<input class="btn btn-danger" type="button" onclick="faqWrite()" style="font-size:17px;padding-top:5px;padding-bottom:5px; margin-right:10px" value="공지쓰기" id="writeBtn">
						</div>
					</div>
					</form>


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