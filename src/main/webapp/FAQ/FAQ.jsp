<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.viva.faq.FaqDTO"%>
<%@page import="kr.co.viva.faq.RangeDTO"%>
<%@page import="java.util.Random"%>
<%@page import="kr.co.viva.faq.FaqService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/siteproperty.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VIVA PARK</title>
<!-- bootstrap cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>
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

.accordion-item {
	border: none;
}

.accordion-header {
	background-color: #fff;
	color: #333;
	cursor: pointer;
	padding: 15px;
	width: 100%;
	text-align: left;
	border: none;
	outline: none;
	font-size: 16px;
	font-weight: bold;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-top: 1px solid #C8C8C8;
}
</style>

<!-- 검색창 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style type="text/css">
    

.search-container {
    display: flex;
    width: 400px; /* 검색창 전체 너비 */
    border: 1px solid #ddd;
    border-radius: 8px; /* 둥근 모서리 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */
    background-color: #fff;
    padding: 5px; /* 내부 여백 */
}

.search-input {
    flex-grow: 1; /* 남은 공간을 모두 차지하도록 설정 */
    border: none;
    outline: none; /* 포커스 시 기본 아웃라인 제거 */
    padding: 10px 15px; /* 텍스트 입력 필드 내부 여백 */
    font-size: 16px;
    color: #333;
}

.search-input::placeholder {
    color: #999; /* 플레이스홀더 텍스트 색상 */
}

.search-button {
    background-color: transparent; /* 버튼 배경 투명 */
    border: none;
    cursor: pointer;
    padding: 10px 15px; /* 버튼 내부 여백 */
    font-size: 18px; /* 아이콘 크기 */
    color: #555; /* 아이콘 색상 */
    display: flex; /* 아이콘 중앙 정렬을 위해 flex 사용 */
    align-items: center;
    justify-content: center;
}

.search-button:hover {
    color: #333; /* 호버 시 아이콘 색상 변경 */
}
.accordion-button:focus {
  box-shadow: none !important; 
  background-color: transparent !important;
}

/* 2. 활성화(열린) 상태 배경색/그림자 재정의 (처음 로드 시 및 항목이 열렸을 때) */
.accordion-button:not(.collapsed) {
    /* 배경색을 흰색으로 강제 설정 */
    background-color: #fff !important; 
    
    /* 활성화 상태에서도 파란색 그림자 제거 */
    box-shadow: none !important; 
    
    /* 활성화 상태의 텍스트 색상을 원하는 색(예: 기본 검정색)으로 설정 */
    color: #333 !important; 
}

/* 3. 활성화된 버튼의 아이콘(화살표) 필터 효과 제거 */
/* 부트스트랩은 활성화될 때 아이콘에 filter를 적용해 색상을 변경하므로 이것도 제거 */
.accordion-button:focus::after,
.accordion-button:not(.collapsed)::after {
  filter: none !important; 
}

/* 탭 버튼 */

/* 3. 탭 메뉴 */
.tab-menu {
	display: flex;
	gap: 5px;
	margin-bottom: 20px;
}

.tab-button {
	padding: 10px 20px;
	border: 1px solid #ddd;
	background-color: #fff;
	color: #555;
	cursor: pointer;
	border-radius: 4px;
	font-size: 14px;
	transition: background-color 0.2s;
}

.tab-button.active {
	background-color: #000;
	color: #fff;
	border-color: #000;
}


@media screen and ( max-width : 1200px) {

	.page_navi {
		display: none;
	}
}
</style>
<script type="text/javascript">

$(function() {
// 탭 버튼 클릭 이벤트 핸들러 추가
$(".tab-menu .tab-button").click(function() {
	// 1. 모든 탭 버튼에서 active 클래스 제거
	$(".tab-menu .tab-button").removeClass("active");

	// 2. 클릭된 버튼에만 active 클래스 추가 (검정색으로 변경)
	$(this).addClass("active");
	var category = $(this).val();
	categoryTab(category);
	function categoryTab(category){
		var param = {category : category};
		$.ajax({
			url:"FAQProcess.jsp",
			type:"get",
			data:param,
			dataType:"JSON",
			error:function(xhr){
				alert("서버에서 문제가 발생 하였습니다.");
				console.log(xhr.status);
			},
			success: function(jsonObj){
			var view ="";	
		 	for(var i=0; i<jsonObj.listSize; i++){
			var lNum =jsonObj.faqList[i].listNum;
			if(lNum==0){
			view+= "<h2 class='accordion-header'>";
			view+="<button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#"+lNum+"'";		
			view+="aria-expanded='true' aria-controls='"+lNum+"'>"+jsonObj.faqList[i].title+"</button></h2>";		
			view+="<div id='"+lNum+"' class='accordion-collapse collapse show' data-bs-parent='#accordionExample'>";		
			view+="<div class='accordion-body'>"+jsonObj.faqList[i].msg+"</div></div>";		
			}else{
				view+= "<h2 class='accordion-header'>";
				view+="<button class='accordion-button' type='button' data-bs-toggle='collapse' data-bs-target='#"+lNum+"'";		
				view+="aria-expanded='true' aria-controls='"+lNum+"'>"+jsonObj.faqList[i].title+"</button></h2>";		
				view+="<div id='"+lNum+"' class='accordion-collapse collapse' data-bs-parent='#accordionExample'>";		
				view+="<div class='accordion-body'>"+jsonObj.faqList[i].msg+"</div></div>";		
			}
			} 
			
			var pagination = jsonObj.pagination;
				
				$("#keyword").val("");
				$("#accordionExample").html(view);
				$("#pagination").html(pagination);
			}
		});//ajax
		
	}//idDup
});//click

$(".tab-button").click(function(){
	$("#category").val($(this).val());
})



});//ready



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
		<div class="container" style=" min-height:1000px;" >
			<div class="page_navi"
				style="margin-bottom: 20px; margin-left: 100px; margin-top: 40px;">
				<img src="${CommonURL}/images/house.png" />
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-offset="20, 0"
						style="background-color: #fff; color: #333; border: none; padding: 0px; margin-left: 10px; font-size: 13px;">
						소통 서비스</button>
					<jsp:include page="../include/page_navi.jsp"></jsp:include>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-secondary dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"
						data-bs-offset="15, 0"
						style="background-color: #fff; color: #333; border: none; padding: 0px; margin-left: 10px; font-size: 13px;">
						FAQ</button>
					<ul class="dropdown-menu dropdown-menu-end"
						style="width: 55px !important; min-width: 55px !important;">
						<li><a href="${CommonURL}/notice/Notice.jsp"
							style="margin: 5px 10px">공지</a></li>
						<li><a href="${CommonURL}/FAQ/FAQ.jsp"
							style="margin: 5px 10px">FAQ</a></li>
						<li><a href="${CommonURL}/inquiry/Inquiry.jsp"
							style="margin: 5px 10px">문의</a></li>
					</ul>
				</div>
			</div>
			<h1 style="text-align: center; margin-bottom: 30px;">FAQ</h1>

			<%
			FaqService fs = FaqService.getInstance();
			RangeDTO rDTO = new RangeDTO();
			
			
			int pageScale = fs.pageScale();
			String currentPageStr = request.getParameter("currentPage");
			
			String category ="전체";
			
			if(request.getParameter("category")!=null && !request.getParameter("category").isEmpty()){
			String tempCategory=request.getParameter("category");
			category = tempCategory.replaceAll("\u00A0"," ");
			}
			String keyword = request.getParameter("keyword");
			rDTO.setCategory(category);
			rDTO.setKeyword(keyword);
			
			int currentPage =1;
			try{
				if( currentPageStr!=null && !currentPageStr.isEmpty()){
				currentPage = Integer.parseInt(currentPageStr);
				rDTO.setCurrentPage(currentPage);
				}
			}catch(NumberFormatException nfe){
			}
			
			int startNum = fs.startNum(currentPage, pageScale);
			int endNum = fs.endNum(startNum, pageScale);
			rDTO.setStartNum(startNum);
			rDTO.setEndNum(endNum);
			rDTO.setUrl("FAQ.jsp");

			int totalCnt = fs.searchFaqTotalCnt(rDTO);
			int totalPage = fs.totalPage( totalCnt, pageScale);
			rDTO.setTotalPage(totalPage);
			List<FaqDTO> list = new ArrayList<FaqDTO>();
			list = fs.searchFaq(rDTO);
			
			String pagination = fs.pagination(rDTO);
			
			pageContext.setAttribute("faqList", list);
			pageContext.setAttribute("pagination", pagination);
			pageContext.setAttribute("category", category);
			
			
			%>
			<form>
			<div
				style="max-width: 1200px; min-height:100px; display: flex;  justify-content: center; border: 1px solid #CFD6DC; 
				border-radius: 10px; box-shadow: 10px 20px 10px #F5F5F5;  margin:60px auto;">
				<div class="search-container" style="height:60px; margin : auto;" >
					<input type="text" name="keyword" id="keyword"class="search-input" placeholder="키워드를 입력해 주세요." value="${param.keyword }">
					<input type="hidden" name="currentPage" value="1"	/>
					<input type="hidden" name="category" value="${param.category }"	id="category"/>
					<button type="submit" class="search-button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
			</form>
			<div class="tab-menu" style="margin-left:120px;">
			<c:choose>
			<c:when test="${category eq '온라인예매/우대정보'}">
						<button class="tab-button " name="button" value="전체" style="border-radius: 20px;">전체</button>
						<button class="tab-button " name="button" value="연간이용" style="border-radius: 20px;">연간이용</button>
						<button class="tab-button active" name="button" value="온라인예매/우대정보" style="border-radius: 20px;">온라인예매/우대정보</button>
						<button class="tab-button" name="button" value="장애인&nbsp;탑승예약제" style="border-radius: 20px;">장애인 탑승예약제</button>
						<button class="tab-button" name="button" value="이용정보" style="border-radius: 20px;">이용정보</button>
						<button class="tab-button" name="button" value="기타" style="border-radius: 20px;">기타</button>
			</c:when>
			<c:when test="${category eq '연간이용'}">
						<button class="tab-button " name="button" value="전체" style="border-radius: 20px;">전체</button>
						<button class="tab-button active" name="button" value="연간이용" style="border-radius: 20px;">연간이용</button>
						<button class="tab-button " name="button" value="온라인예매/우대정보" style="border-radius: 20px;">온라인예매/우대정보</button>
						<button class="tab-button" name="button" value="장애인&nbsp;탑승예약제" style="border-radius: 20px;">장애인 탑승예약제</button>
						<button class="tab-button" name="button" value="이용정보" style="border-radius: 20px;">이용정보</button>
						<button class="tab-button" name="button" value="기타" style="border-radius: 20px;">기타</button>
			</c:when>
			<c:when test="${category eq '장애인 탑승예약제'}">
						<button class="tab-button " name="button" value="전체" style="border-radius: 20px;">전체</button>
						<button class="tab-button " name="button" value="연간이용" style="border-radius: 20px;">연간이용</button>
						<button class="tab-button " name="button" value="온라인예매/우대정보" style="border-radius: 20px;">온라인예매/우대정보</button>
						<button class="tab-button active" name="button" value="장애인&nbsp;탑승예약제" style="border-radius: 20px;">장애인 탑승예약제</button>
						<button class="tab-button" name="button" value="이용정보" style="border-radius: 20px;">이용정보</button>
						<button class="tab-button" name="button" value="기타" style="border-radius: 20px;">기타</button>
			</c:when>
			<c:when test="${category eq '이용정보'}">
						<button class="tab-button " name="button" value="전체" style="border-radius: 20px;">전체</button>
						<button class="tab-button " name="button" value="연간이용" style="border-radius: 20px;">연간이용</button>
						<button class="tab-button " name="button" value="온라인예매/우대정보" style="border-radius: 20px;">온라인예매/우대정보</button>
						<button class="tab-button " name="button" value="장애인&nbsp;탑승예약제" style="border-radius: 20px;">장애인 탑승예약제</button>
						<button class="tab-button active" name="button" value="이용정보" style="border-radius: 20px;">이용정보</button>
						<button class="tab-button" name="button" value="기타" style="border-radius: 20px;">기타</button>
			</c:when>
			<c:when test="${category eq '기타'}">
						<button class="tab-button " name="button" value="전체" style="border-radius: 20px;">전체</button>
						<button class="tab-button " name="button" value="연간이용" style="border-radius: 20px;">연간이용</button>
						<button class="tab-button " name="button" value="온라인예매/우대정보" style="border-radius: 20px;">온라인예매/우대정보</button>
						<button class="tab-button " name="button" value="장애인&nbsp;탑승예약제" style="border-radius: 20px;">장애인 탑승예약제</button>
						<button class="tab-button " name="button" value="이용정보" style="border-radius: 20px;">이용정보</button>
						<button class="tab-button active" name="button" value="기타" style="border-radius: 20px;">기타</button>
			</c:when>
			<c:otherwise>
						<button class="tab-button active" name="button" value="전체" style="border-radius: 20px;">전체</button>
						<button class="tab-button" name="button" value="연간이용" style="border-radius: 20px;">연간이용</button>
						<button class="tab-button" name="button" value="온라인예매/우대정보" style="border-radius: 20px;">온라인예매/우대정보</button>
						<button class="tab-button" name="button" value="장애인&nbsp;탑승예약제" style="border-radius: 20px;">장애인 탑승예약제</button>
						<button class="tab-button" name="button" value="이용정보" style="border-radius: 20px;">이용정보</button>
						<button class="tab-button" name="button" value="기타" style="border-radius: 20px;">기타</button>
			</c:otherwise>
			</c:choose>
					</div>
			<!-- accordion -->
			<div class="accordion" id="accordionExample" 
				style="max-width: 1200px; margin: 0px auto; min-height:800px;">
				<!--  -->
				<c:choose>
				<c:when test="${empty faqList}">
					<div style="margin:200px auto; width:800px;" >
					<img src="${CommonURL}/images/nodata.png" style="width:800px; margin:0px auto;"/>
					<span class="date"></span> 
					</div>
				</c:when>
				<c:otherwise>
				<c:forEach var="fDTO" items="${faqList}" varStatus="i">
				<c:if test="${i.count==1}">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#${i.count}"
							aria-expanded="true"
							aria-controls="${i.count }">${fDTO.title}</button>
					</h2>
					<div id="${i.count }"
						class="accordion-collapse collapse show"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">${fDTO.msg }</div>
					</div>
				</c:if>
				<c:if test="${i.count!=1}">
				<div class="accordion-item">
					<h2 class="accordion-header">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#${i.count}"
							aria-expanded="false"
							aria-controls="${i.count }">${fDTO.title}</button>
					</h2>
					<div id="${i.count }"
						class="accordion-collapse collapse"
						data-bs-parent="#accordionExample">
						<div class="accordion-body">${fDTO.msg }</div>
					</div>
				</div>
				</c:if>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			</div>
			<!-- pagenation -->
			<div id="BoardListPager">
				<div>
					<div class="pagination" style="margin : 0px auto; width:300px;" >
						<div class="page-item" id="pagination" style="display:flex; justify-content: center;width:300px;">
							${pagination}
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- container 끝 -->

		<div id="footer" style ="margin-top:100px">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
