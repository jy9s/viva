<%@page import="userinfo.AdminUserInfoDTO"%>
<%@page import="userinfo.AdminUserInfoService"%>
<%@page import="java.util.ArrayList"%>
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
		var field = '<c:out value="${field}" />';
        var fieldTextMap = {
            "1": "회원번호",
            "2": "이름",
            "3": "아이디"
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

	});

	function searchUser() {
		
		$("#searchFrm").submit();

	}
	
</script>


<body id="page-top">

	<div id="wrapper">

		<%@ include file="../fragments/sidebar.jsp"%>


		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<%@ include file="../fragments/headerbar.jsp"%>
				
				<jsp:useBean id="rDTO" class="userinfo.AdminUserRangeDTO" scope="page"/>
				<jsp:setProperty property="*" name="rDTO"/>

				<%
				
				AdminUserInfoService uiService = new AdminUserInfoService();
				
				int totalCount = uiService.totalCnt(rDTO);
				int pageScale = uiService.pageScale();
				int totalPage = uiService.totalPage(totalCount, pageScale);
				String tempPage=request.getParameter("currentPage");
				int currentPage=1;
				if(tempPage != null){
					try{
					currentPage = Integer.parseInt(tempPage);
					}catch(NumberFormatException nfe){
						
					}
				}					
				int startNum = uiService.startNum(pageScale, currentPage);
				int endNum = uiService.endNum(startNum, pageScale);
				
				
				rDTO.setStartNum(startNum);
				rDTO.setEndNum(endNum);

				List<AdminUserInfoDTO> userList = uiService.searchUserInfo(rDTO);
				
				rDTO.setUrl("userinfo.jsp");
				rDTO.setTotalPage(totalPage);
				
				String pagination2=uiService.pagination2(rDTO,"left") ;
				
				pageContext.setAttribute("totalCount", totalCount);
				pageContext.setAttribute("pageScale", pageScale);
				pageContext.setAttribute("totalPage", totalPage);
				pageContext.setAttribute("currentPage", currentPage);
				pageContext.setAttribute("startNum", startNum);
				pageContext.setAttribute("endNum", endNum);
				pageContext.setAttribute("userList", userList);
				pageContext.setAttribute("pagination2", pagination2);
				pageContext.setAttribute("totalPage", totalPage);
				
				%>



				<div class="container-fluid">

					<h1 class="h3 mb-2 text-gray-800">회원 정보</h1>

						<form id="searchFrm" action="userinfo.jsp">
					<div
						style="display: flex; justify-content: flex-end; margin-right: 30px; margin-bottom: 20px;">
						

						<div class="dropdown search-filter">
							<button class="btn btn-danger dropdown-toggle" type="button"
								data-toggle="dropdown" aria-expanded="false" id="field_text">회원번호</button>
								<input type="hidden" name="field" id="field_value" value="1">
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" data-value="1">회원번호</a></li>
								<li><a class="dropdown-item" data-value="2">이름</a></li>
								<li><a class="dropdown-item" data-value="3">아이디</a></li>
							</ul>
						</div>

						<div style="margin-left: 10px">
							<input type="text" class="form-control" id="keyword" name="keyword">


						</div>
						<div style="margin-left: 10px">
							<button class="btn btn-danger" type="button" id="search-button"
								onclick="searchUser()"
								style="font-size: 17px; padding-top: 5px; padding-bottom: 5px;">조회</button>
						</div>
						
						
					</div>
						</form>

					<div class="card shadow mb-4">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">

									<colgroup>
										<col style="width: 5%;">
										<col style="width: 8%;">
										<col style="width: 20%;">
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: 17%;">
										<col style="width: 8%;">
										<col style="width: 5%;">
									</colgroup>
									<thead>
										<tr>
											<th style="text-align:center">회원번호</th>
											<th style="text-align:center">이름</th>
											<th style="text-align:center">주소</th>
											<th style="text-align:center">ID</th>
											<th style="text-align:center">Email</th>
											<th style="text-align:center">전화번호</th>
											<th style="text-align:center">가입일</th>
											<th style="text-align:center">탈퇴여부</th>
										</tr>
									</thead>
									
									<tbody>
									
										<c:if test="${ empty userList}">
										<tr>
										<td colspan="8" style="text-align:center">작성된 게시글이 없습니다.</td>
										<tr>
										</c:if>
										<c:forEach var="userDTO" items="${userList}" varStatus="i">
										<tr>
										<td style="text-align:center"><c:out value="${userDTO.userNum}"/></td>
										<td style="text-align:center"><c:out value="${userDTO.userName}"/></td>
										<td style="text-align:center"><c:out value="${userDTO.userAddr}"/></td>
										<td style="text-align:center"><c:out value="${userDTO.userId}"/></td>
										<td style="text-align:center"><c:out value="${userDTO.userEmail}"/></td>
										<td style="text-align:center"><c:out value="${userDTO.userTel}"/></td>
										<td style="text-align:center"><c:out value="${userDTO.userInputDate}"/></td>
										<td style="text-align:center"><c:out value="${userDTO.userFlag}"/></td>
										</tr>										
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>


					<div id="pagination" style="text-align:center">
					<c:out value="${pagination2}" escapeXml="false"/>
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