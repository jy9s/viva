<%@page import="attr.AdminAttractionDTO"%>
<%@page import="attr.AdminAttractionService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>
<%@ include file ="../fragments/siteProperty.jsp" %>

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
<style>

.imgWrap{
	height:300px;
}

td .imgWrap img {
    max-width: 100%;
    height: auto;
    max-height: 100%; 
}

.attr1{
color : #1A9543;
font-weight:bold;
}
.attr2{
color : #FF6B00;
font-weight:bold;
}

#logWrap{
width:260px;
height:500px;
position:fixed;
right: 60px;
}


</style>



</head>

<script>
	$(function() {

		$("#writeBtn").on('click', function() {

			//세션 유효성 검증 필요			

			document.getElementById("perfFrm").submit();
		});
		
		//정상운영, 운행점검 폰트 색 변경을 위한 이벤트처리 (시작값)
		$(".attr-status").each(function() {
			updateSelectColor($(this));
		});

		
	});//ready

	function search() {
		
		$("#searchFrm").submit();

	}
	
	function updateSelectColor($selectElement) {
		var selectedValue = $selectElement.val();
		$selectElement.css('color', ''); // 색상 초기화 (선택 사항)
		
		if(selectedValue === 'attr1'){
			$selectElement.css('color', '#1A9543');
		} else if(selectedValue === 'attr2'){
			$selectElement.css('color', '#FF6B00');
		}
	}
	
</script>


<body id="page-top">

	<div id="wrapper">

		<%@ include file="../fragments/sidebar.jsp"%>


		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<%@ include file="../fragments/headerbar.jsp"%>
				
				<%
				
				String date = request.getParameter("date");
				String attrName = request.getParameter("keyword");
				
				AdminAttractionService aService = AdminAttractionService.getInstance();				
				List<AdminAttractionDTO> list = new ArrayList<AdminAttractionDTO>();				
				list = aService.searchAttraction(date, attrName);		
				
				Date currentDate = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");        
		        String today =  formatter.format(currentDate);
				
				pageContext.setAttribute("list", list);
				pageContext.setAttribute("today", today);
				
				%>

				<div class="container-fluid">

					<h1 class="h3 mb-0 text-gray-800 m-0 font-weight-bold text-danger">놀이기구
						관리</h1>
					<form id="searchFrm" name="searchFrm">
					<div
						style="display: flex; justify-content: flex-end; margin-right: 30px; margin-bottom: 20px; width: 80%">
							
						<div style="display: flex; align-items: center;">
							<div>기준 일 :&nbsp;</div>
							<div>
								<input type="date" class="form-control" name="date" value="${param.date==null? today : param.date}">
							</div>

						</div>
						<div style="margin-left: 10px">
							<input type="text" class="form-control" id="searchText" name="keyword"
								placeholder="놀이기구 이름">
						</div>

						<div style="margin-left: 10px">
							<button class="btn btn-danger" type="button" id="search-button"
								onclick="search()"
								style="font-size: 17px; padding-top: 5px; padding-bottom: 5px;">조회</button>
						</div>
					</div>
					</form>

					<form id="perfFrm" name="perfFrm">
						<div class="card shadow mb-4" style="width: 80%">
							<div>
								<div class="table-responsive">
									<table class="table" id="dataTable" width="100%"
										cellspacing="0">
										<colgroup>
											<col style="width: 33%;">
											<col style="width: 33%;">
											<col style="width: 33%;">
										</colgroup>
										<tbody>
										
										<c:choose>
										<c:when test="${empty list}">
										<c:out value="조회된 결과가 없습니다."/>
										</c:when>
										<c:otherwise>
										<%for(int i = 0; i<list.size(); i++) {
											if(i%3==0){
											%>										
											<tr>		
											<%} %>
																			
												<td style="text-align: center">
													<div class="imgWrap">
														<a href="attrac_edit.jsp?num=<%=list.get(i).getAttrNum()%>&date=${param.date==null? today : param.date}&keyword=${param.keyword}">
														<img src="${CommonURL}/upload/<%=list.get(i).getAttrMain()%>"></a>
													</div>
													<div class="textWrap card shadow mb-4"
														style="margin: 30px auto; padding-top: 20px; padding-bottom: 10px; background-color: #f8f9fc; border-radius: 15px;" >
														<div style="margin-left:30px">
															
															<div style="display: flex; margin-bottom:5px">
																<!-- <div class="border border-0  font-weight-bold" style="align-content: center">이름 : &nbsp;</div> -->
																<div style="margin-left:20px; height:38px; align-content: center;" class="font-weight-bold"><%= list.get(i).getAttrName()%></div>
																<div class="font-weight-bold attr-status" id="attr-status" style="height:38px; margin-left:20px;">
																	<%if(list.get(i).getAttrState()==null || list.get(i).getAttrState().equals("N")){
																		%>
																		<div class="attr1" style="height:38px; align-content:center">정상운행</div>
																        <%
																	}else{%>
															        <div class="attr2" style="height:38px; align-content:center">정기점검</div>
															        <%
															        }%>
															        
															    </div>
															</div>
															<div style="display: flex; margin-bottom:5px">
		<!-- 														<div class="border border-0 font-weight-bold" style="align-content: center">운영상태  : &nbsp;</div> -->
																<%-- <div class="font-weight-bold attr-status" id="attr-status" style="height:38px; margin-left:20px;">
																	<%if(list.get(i).getAttrState()==null || list.get(i).getAttrState().equals("Y")){
																		%>
																		<div class="attr1" style="height:38px; align-content:center">정상운행</div>
																        <%
																	}else{%>
															        <div class="attr2" style="height:38px; align-content:center">정기점검</div>
															        <%
															        }%>
															        
															    </div> --%>
															        <input type="hidden" value="<%=list.get(i).getAttrNum()%>"/>
															        <input type="hidden" value="<%=list.get(i).getAttrName()%>"/>
															</div>
														</div>
													</div>
												</td>
												
											<%						
											if(i%3==2 || i == 17){
											%>										
											</tr>		
											<%} 
										} %>
										</c:otherwise>
										</c:choose>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						
						
					</form>


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