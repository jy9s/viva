<%@page import="java.util.List"%>
<%@page import="qna.AdminQnaDTO"%>
<%@page import="qna.AdminQnaService"%>
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
th, td {
	text-align: center
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
</style>

<script type="text/javascript">

$(function(){

	// 검색 후에도 카테고리바 유지되게 하기
	var field = '<c:out value="${field}" />';
    var fieldTextMap = {
        "1": "제목",
        "2": "작성자",
        "3": "답변상태"
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
	
    $(".inquiry-title").on('click',function(){
    	
    	var param = {num : $(this).data('inquiry-num')};

    	
    	$.ajax({			
			url:"qna_process.jsp",
			type : "GET",
			data : param,
			dataType:"JSON",
			error:function(xhr){
				alert("error code : " + xhr.status + ", msg : " + xhr.statusText);
			},
			success:function(jsonObj){
				
				var title = jsonObj.title;
				var email = jsonObj.email;
				var id = jsonObj.id;
				var msg = jsonObj.msg;
				var msg2 = jsonObj.msg2;
				var date = jsonObj.date;
				var num = jsonObj.num;
				
				$("#date").html(date);
				$("#title").html(title);
				$("#email").html(email);
				$("#id").html(id);
				$("#msg").html(msg);
				$('#summernote').summernote('code', msg2);
				$('#inquiryNum').val(num);
				
			}
		});
    	
    });
    
    
    
	
$('#summernote').summernote({
	  placeholder: '내용을 입력하세요.',
	  tabsize: 2,
	  height: 250,
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
	
	$('.note-statusbar').hide();
	// summernote jqeury 끝


});

function qnaWrite(){
	
	
	if($("#inquiryNum").val()==""){
		alert("문의 글을 선택해주세요");
		return;
	}
	
	if($("#summernote").val()==""){
		alert("답변을 입력해주세요");
		return;
	}
	
	if(confirm("답변 하시겠습니까?")){
		$("#qnaFrm").submit();
	}
	
}


function search(){
	$("#searchFrm").submit();
}

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
			<div id="content">

				<!-- headerbar 건들지 말것. -->
				<%@ include file="../fragments/headerbar.jsp"%>

				<!-- 이곳에 작업 -->
				<div class="container-fluid" >



					<h1 class="h3 mb-0 text-gray-800 m-0 font-weight-bold text-danger">1:1 문의</h1>
					
					<jsp:useBean id="rDTO" class="qna.AdminQnaRangeDTO" scope="page"/>
					<jsp:setProperty property="*" name="rDTO"/>
					<%
					AdminQnaService qs = AdminQnaService.getInstance();
					//1. 총 게시글의 수
					int totalCount = qs.totalCnt(rDTO);
					
					//2. 한 화면에 보여줄 게시물의 수
					int pageScale = qs.pageScale();
					//3. 총 페이지의 수
					
					int totalPage = qs.totalPage(totalCount, pageScale);
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
					int startNum = qs.startNum(pageScale, currentPage); //pagenation을 클릭하면 해당페이지의 번호로 설정
					//1 페이지 1, 2페이지 11, 3페이지 21, 4페이지 31					
					//1페이지 : 1*10-10+1 
					//2페이지 : 2*10-10+1					
					//5. 끝번호 1페이지 끝번호 10, 2페이지 끝번호 20
					int endNum = qs.endNum(startNum, pageScale);
					
					
					//rDTO는 시작번호와 끝번호를 web parameter로 받지 않는다.
					//연산된 값(1항~5항)으로 설정한다.
					rDTO.setStartNum(startNum);
					rDTO.setEndNum(endNum);
					//6. 시작번호와 끝 번호사이에 해당하는 모든 게시글을 조회
					List<AdminQnaDTO> qnaList = qs.searchBoardList(rDTO);
					
					//글 제목이 20글자를 초과하면 19자까지만 보여주고, 나머진 ...으로 처리.
					//qs.titleSubStr(boardList);
					rDTO.setUrl("qna.jsp");
					rDTO.setTotalPage(totalPage);
					
					String pagination=qs.pagination(rDTO,"center");
					
					pageContext.setAttribute("totalCount", totalCount);
					pageContext.setAttribute("pageScale", pageScale);
					pageContext.setAttribute("totalPage", totalPage);
					pageContext.setAttribute("currentPage", currentPage);
					pageContext.setAttribute("startNum", startNum);
					pageContext.setAttribute("endNum", endNum);
					pageContext.setAttribute("qnaList", qnaList);
					pageContext.setAttribute("pagination", pagination);
					pageContext.setAttribute("totalPage", totalPage);
					
					%>				
					
					<form id="searchFrm" action="qna.jsp">
					<div
						style="display: flex; justify-content: flex-end; margin-right: 30px; margin-bottom: 20px; width:80%">

						<div class="dropdown search-filter">
							<button class="btn btn-danger dropdown-toggle" type="button"
								data-toggle="dropdown" aria-expanded="false" id="field_text">제목</button>
								<input type="hidden" name="field" id="field_value" value="1">
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" data-value="1">제목</a></li>
								<li><a class="dropdown-item" data-value="2">작성자</a></li>
								<li><a class="dropdown-item" data-value="3">답변상태</a></li>
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
					
					<!-- Form Control 누를때마다 나를 불러 페이지를 보여줌 -->
				
						<div class="card shadow mb-4 border-bottom-danger" style="width:80%;">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered table-hover" id="dataTable" width="100%"
										cellspacing="0">
										<colgroup>
											<col style="width: 5%;">
											<col style="width: 50%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 20%;">
										</colgroup>
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>상태</th>
												<th>등록일</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${ empty qnaList}">
												<tr>
												<td colspan="5" style="text-align:center">작성된 게시글이 없습니다.</td>
												<tr>
											</c:if>
												<c:forEach var="qDTO" items="${qnaList}" varStatus="i">
												<tr>
												<td><c:out value="${totalCount - startNum+1 - i.index }"/></td>
												<td>
												<div class="inquiry-title" data-inquiry-num="${qDTO.inquiryNum}"><c:out value="${qDTO.inquiryTitle}"/></div>
												
												</td>
												<td><c:out value="${qDTO.memberName}"/></td>
												<td><c:out value="${qDTO.inquiryReturn}"/></td>
												<td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${qDTO.inquiryDate }"/></td>
												</tr>										
												</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div id="pagination" style="text-align:center">
							<c:out value="${pagination}" escapeXml="false"/>
							</div>	
						</div>

						<form id="qnaFrm" name="qnaFrm" method="post" action="qna_write_process.jsp">
						<div class="card shadow mb-4"  style="width:80%;">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<colgroup>
											<col style="width: 20%;">
											<col style="width: 80%;">
										</colgroup>
										<tr>
											<td>문의날짜</td>
											<td id="date"></td>
										</tr>
										<tr>
											<td>제목</td>
											<td id="title"></td>
										</tr>
										<tr>
											<td>이메일</td>
											<td id="email"></td>
										</tr>
										<tr>
											<td>작성자</td>
											<td id="id"></td>
										</tr>
										<tr>
											<td>문의내용</td>
											<td style="height: 200px"  id="msg"></td>
										</tr>
										<tr>
											<td>답변</td>
											<td style="height: 150px">
												<div id="noteWrap"
													style=" width: 100%;">

													<textarea name="reply" id="summernote"></textarea>
													<div
														style="display: flex; justify-content: flex-end; margin-top: 30px">
													</div>

												</div>


											</td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
							<input type="hidden" name="inquiryNum" id="inquiryNum"/>
							<input type="hidden" name="currentPage" value="${param.currentPage }">
							<input type="hidden" name="field" value="${param.field }">
							<input type="hidden" name="keyword" value="${param.keyword }">
							<div
								style="text-align: right; margin-bottom: 10px; margin-right: 10px">
								<input class="btn btn-danger" type="button"
									onclick="qnaWrite()"
									style="font-size: 17px; padding-top: 5px; padding-bottom: 5px; margin-right: 10px"
									value="답변하기" id="writeBtn">
							</div>
						</div>




					</form>






				</div>

			</div>
			<!-- End of Main Content -->
			<div>
			<!-- footer 건들지 말것. -->
			<%@include file="../fragments/footer.jsp"%>
			</div>
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<%@include file="../fragments/logout_modal.jsp"%>
	
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
	
	<script src="../js/sb-admin-2.min.js"></script>


</body>

</html>