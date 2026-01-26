<%@page import="notice.AdminNoticeDTO"%>
<%@page import="notice.AdminNoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<!-- jQeury DNS 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- summerNote를 사용하기 위함 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>


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
/*서머노트 크기 설정*/
#summernote,
.note-editor,
.note-editable,
.note-toolbar {
    width: 100% !important;
    max-width: 100%;
    box-sizing: border-box;
}
/* 1. 편집 영역 (본문) 왼쪽 정렬 (Placeholder 유지) */
.note-editable {
    text-align: left !important;
}

/* ✨ 2. 툴바 버튼 그룹 강제 왼쪽 정렬 (가장 강력한 방법) ✨ */
/* 툴바 내부의 각 버튼 그룹에 float: left를 적용하여 왼쪽 끝에 정렬합니다. */
.note-toolbar .note-btn-group {
    float: left !important;
}
/* float을 사용하면 부모 요소가 높이를 잃을 수 있으므로, 
   툴바 컨테이너에 overflow: hidden을 추가하여 높이를 잡아줍니다. */
.note-toolbar {
    overflow: hidden !important; 
    padding-left: 0 !important; /* 혹시 모를 내부 여백 제거 */
}

/* Summernote 에디터의 텍스트 입력 영역 스타일 변경 */
.note-editable {
    background-color: #FFFFFF !important; /* 원하는 색상 코드로 변경 */
    /* 배경색이 어두워진다면 텍스트 색상도 변경해야 합니다 */
    /* color: #333333; */ 
}

</style>

<%
String num = request.getParameter("num");

int noticeNum = 0;
if(num!=null && !num.isEmpty()){
	
	try{
	noticeNum = Integer.parseInt(num);
	}catch(NumberFormatException nfe){
		noticeNum=0;
	}
	
}

AdminNoticeService nService = AdminNoticeService.getInstance(); 
AdminNoticeDTO nDTO = new AdminNoticeDTO(); 

if(noticeNum != 0){
	
	
	nDTO = nService.searchOneNotice(noticeNum);
	
}else{
	nDTO.setNoticeType("공지");
	nDTO.setNoticeTitle("");
	nDTO.setNoticMsg("");
}


String field = request.getParameter("field");
String keyword = request.getParameter("keyword");
String currentPage = request.getParameter("currentPage");




pageContext.setAttribute("field",field);
pageContext.setAttribute("keyword",keyword);
pageContext.setAttribute("currentPage",currentPage);
pageContext.setAttribute("nDTO",nDTO);

%>


<script type="text/javascript">

$(function() {
	$('.search-filter .dropdown-menu .dropdown-item').on('click', function(e) {
	    // 브라우저의 기본 동작 (페이지 이동)을 막습니다.
	    e.preventDefault(); 
	    
	    // 2. 클릭된 항목의 텍스트를 가져옵니다.
	    var selectedText = $(this).text();        
	    
	    // 3. 드롭다운 버튼 요소를 찾습니다.
	    // 클릭된 항목의 부모(ul.dropdown-menu)의 부모(div.search-filter)에서 button을 찾습니다.
	    var $button = $(this).closest('.search-filter').find('button.dropdown-toggle');
	    
	    // 4. 버튼 내부 텍스트를 가져온 텍스트로 변경합니다.
	    // 버튼 내부에서 텍스트 노드(nodeType === 3)만 찾아 텍스트를 변경하여 화살표(::after)를 유지합니다.
	    $button.contents().filter(function() {
	        return this.nodeType === 3; // 텍스트 노드만 선택
	    }).first().replaceWith(selectedText);
	});
 
	// summernote jqeury 시작
	$('#summernote').summernote({
	  placeholder: '내용을 입력하세요.',
	  tabsize: 2,
	  height: 500,
	  disableResizeEditor: true,
      toolbar: [
          ['style', ['bold','italic','clear']],
          ['fontsize', ['fontsize']],          
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['insert', ['link', 'picture']]
        ],
        callbacks: {
            onInit: function() {
                // Summernote가 초기화된 후 실행됩니다.
                // 현재 편집 중인 내용(content)에 왼쪽 정렬을 적용합니다.
          	  $('.note-editable').css('text-align', 'left');
            }
        }
	});
	

	$("#category").text("${nDTO.noticeType}");

	$('.note-statusbar').hide();
	// summernote jqeury 끝
	
	$("#writeBtn").click(function(){
		var text = $("#category").text();
		$("#fieldType").val(text);
		$("#flag").val("1");
		searchFrm.submit();
		
	});
	$("#updateBtn").click(function(){
		if(confirm("정말 수정하시겠습니까?")){
			var text = $("#category").text();
			$("#fieldType").val(text);
			$("#flag").val("2");
			searchFrm.submit();
		}
	});
	
	$("#deleteBtn").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
			$("#flag").val("3");
			searchFrm.submit();
		}
	});
	
	$("#cancelBtn").click(function(){
		history.back();
	});
	
	
});

</script>


</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- sidebar 건들지 말것. -->
		<%@ include file="../fragments/sidebar.jsp"%>


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content" >

				<!-- headerbar 건들지 말것. -->
				<%@ include file="../fragments/headerbar.jsp"%>
				

				<!-- 이곳에 작업 -->
				<div class="container-fluid" style="padding-left:24px; padding-write:24px">
				
				<h1 class="h3 mb-2 text-gray-800">공지 관리</h1>
				
				<form id="searchFrm" name="searchFrm" method="post" action="notice_write_process.jsp">
				<input type="hidden" name="num" value="${param.num}">
				<input type="hidden" name="field" value="${field}">
				<input type="hidden" name="keyword" value="${keyword}">
				<input type="hidden" name="currentPage" value="${currentPage}">
				<input type="hidden" name="fieldType" id="fieldType">
				<input type="hidden" name="flag" id="flag">
				<div id="writeWrap" style="display:flex; margin-left:50px; margin-top:50px; width:85%;">

					<div class="dropdown search-filter">
							<button class="btn btn-danger dropdown-toggle" type="button"
								data-toggle="dropdown" aria-expanded="false" id="category" name="category">공지</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">공지</a></li>
								<li><a class="dropdown-item" href="#">뉴스</a></li>
								<li><a class="dropdown-item" href="#">일반</a></li>
								<li><a class="dropdown-item" href="#">이벤트</a></li>
							</ul>
						</div>

					<div style="width:70%; margin-left:20px" >
						<input type="text" class="form-control" id="searchText" name="title" value="${nDTO.noticeTitle}">
						<input type="text" style="display:none">
    				</div>
    			</div>
				<div id="noteWrap" style="margin-left:50px; margin-top:50px; width:80%;">
				
							<textarea name="intro" id="summernote">${nDTO.noticMsg}</textarea>
							<div style="display:flex; justify-content:flex-end; margin-top:30px">
							
							<c:choose>
							<c:when test="${ empty nDTO.noticMsg }">
								<input type="button" value="작성" class="btn btn-danger" id="writeBtn" style="display:flex; margin-right:20px;">
								
								<input type="button" value="취소" class="btn btn-danger" id="cancelBtn" style="border: 1px; solid #ff6b00;">
							</c:when>
							<c:otherwise>			
								<input type="button" value="변경" class="btn btn-danger" id="updateBtn" style="display:flex; margin-right:20px;">
								
								<input type="button" value="삭제" class="btn btn-danger" id="deleteBtn" style="display:flex; margin-right:20px;">
								<input type="button" value="취소" class="btn btn-danger" id="cancelBtn" style="border: 1px; solid #ff6b00;">
							</c:otherwise>
							</c:choose>
							</div>

				</div>
				</form>
				
				
				
				
				</div>

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

</body>

<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="../js/sb-admin-2.min.js"></script>

</html>