<%@page import="kr.co.viva.inquiry.InquiryDTO"%>
<%@page import="kr.co.viva.inquiry.InquiryService"%>
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

<!-- summernote 가져오기 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
<script>
	$(document).ready(
			function() {
				$('#summernote')
						.summernote(
								{
									placeholder : 'write here...',
									tabsize : 2,
									height : 300,
									toolbar : [
											[
													'font',
													[ 'bold', 'underline',
															'clear' ] ],
											[ 'insert', [ 'picture' ] ] ]

								});
			});
</script>	

<jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>
<style>
/* 기본 스타일 및 컨테이너 */
body {
	font-family: Arial, sans-serif;
	background-color: #fff;
	padding: 50px 20px;
}

.inquiry-container {
	max-width: 800px;
	margin: 0 auto;
	background-color: #fff;
}

/* 1. 헤더 (제목 및 필수 입력 안내) */
.inquiry-header {
	text-align: center;
	margin-bottom: 40px;
	position: relative;
}

.inquiry-header h1 {
	font-size: 30px;
	font-weight: bold;
	color: #1a1a1a;
	margin: 0;
}

.required-notice {
	position: absolute;
	top: 5px;
	right: 0;
	font-size: 13px;
	color: #888;
}

.required-notice strong {
	color: #d9534f; /* 빨간색 별표 */
	font-weight: normal;
}

/* 2. 양식 그룹 */
.form-group {
	margin-bottom: 30px;
}

/* 라벨 스타일 */
.form-label {
	display: block;
	font-size: 14px;
	color: #333;
	margin-bottom: 8px;
	font-weight: bold;
}

.form-label .required {
	color: #d9534f;
	margin-right: 2px;
}

/* 제목 입력 필드 */
.input-title {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
	box-sizing: border-box;
	background-color: #f7f7f7; /* 배경색으로 읽기 전용 느낌 */
}

/* 텍스트 영역 (문의 내용, 답변) */
.textarea-content {
	width: 100%;
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
	resize: vertical; /* 수직 크기 조절만 가능 */
	box-sizing: border-box;
	background-color: #f7f7f7;
	color: #333;
	line-height: 1.6;
}

/* 3. 문의 번호 */
.inquiry-number-info {
	font-size: 14px;
	color: #777;
	margin-top: 20px;
}

/* 4. 버튼 영역 */
.action-buttons {
	display: flex;
	justify-content: flex-end; /* 버튼을 오른쪽으로 정렬 */
	gap: 10px;
	margin-top: 40px;
}

.action-button {
	padding: 10px 25px;
	font-size: 16px;
	font-weight: bold;
	border: 1px solid;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.2s, opacity 0.2s;
}

/* 수정 버튼 (주황색/오렌지색 계열) */
.button-modify {
	background-color: #fff;
	color: #ff8c42; /* 오렌지색 */
	border-color: #ff8c42;
}

.button-modify:hover {
	opacity: 0.85;
}

/* 삭제 버튼 (회색 계열) */
.button-delete {
	background-color: #f0f0f0;
	color: #555;
	border-color: #ccc;
}

.button-delete:hover {
	background-color: #e0e0e0;
}

/* Placeholder/입력된 내용 텍스트 스타일 */
.content-placeholder {
	color: #333;
	font-weight: 500;
}
</style>
<script type="text/javascript">



function removeInquiry(){
	
	
	if($("#answer").val()!=0){
	alert("이미 답변 달린 문의는 삭제할 수 없습니다.");
	return;
	}
	if(confirm("정말 문의를 삭제하시겠습니까?")){
	$("#remove").submit()
	}
	}
	
	


function modifyInquiry(){
	
		if ($("#inquiryTitle").val()=="") {
			alert("제목을 입력해주세요.");
			return
		}
		if ($("#summernote").val()=="") {
			alert("문의 내용을 입력해주세요.");
			return
		}
		
	if($("#answer").val()!=0){
		alert("이미 답변 달린 문의는 수정 할 수 없습니다.");
		return;
		}
	if(confirm("수정하시겠습니까?")){
		$("#modify").submit()
	}
	
	
		}


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
		<%
		InquiryService is = InquiryService.getInstance();
		InquiryDTO iDTO = new InquiryDTO();
		if(request.getParameter("inquiryNum")!=null && !request.getParameter("inquiryNum").isEmpty()){
		int inquiryNum =Integer.parseInt(String.valueOf(request.getParameter("inquiryNum"))) ;
		iDTO = is.searchInquiryDetail(inquiryNum);
		}
		
		pageContext.setAttribute("iDTO", iDTO);
		%>
		<div class="container">
			<div class="inquiry-container">

				<div class="inquiry-header">
					<h1>문의</h1>
				</div>
					<form id="modify" action="modifyInquiryProcess.jsp" method="post">
				<div class="form-group">
					<label for="inquiryTitle" class="form-label"> 제목 
					</label> 
					<input type="text" id="inquiryTitle" name="title" class="input-title"
						value="${iDTO.title}" >
				</div>

				<div class="form-group">
					<label for="inquiryContent" class="form-label"> 문의한 내용 </label>
					<textarea id="summernote" name="msg" ><c:out value="${iDTO.msg }" escapeXml="false"/></textarea>
				</div>

				<div class="form-group">
					<label for="inquiryAnswer" class="form-label"> 답변 </label>
					<div id="inquiryAnswer" class="textarea-content"  style="height: 300px;">
					<c:out value="${iDTO.inquiryReturn }"/>
					</div>
					<input type="hidden"  id="answer" value="${iDTO.adminNum}"/>
					<input type="hidden" name="inquiryNum" value="${param.inquiryNum }"/>
				</div>

				<div class="inquiry-number-info">문의 번호 : ${param.inquiryNum }</div>
					</form>

				<div class="action-buttons">
					<button type="button" class="action-button button-modify" onclick="modifyInquiry()">수정</button>
					<form id="remove" action="removeInquiryProcess.jsp">
					<button type="button" class="action-button button-delete" onclick="removeInquiry()">삭제</button>
					<input type="hidden" name="inquiryNum" value="${param.inquiryNum }"/>
					<input type="hidden" name="inquiryReturn" value="${iDTO.inquiryReturn}"/>
					</form>
				</div>  

			</div>

		</div>
		<!-- container 끝 -->

		<div id="footer">
			<jsp:include page="../include/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>
