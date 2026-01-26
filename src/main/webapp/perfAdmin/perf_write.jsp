<%@page import="performance.AdminPerformDTO"%>
<%@page import="performance.AdminPerformService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../fragments/siteProperty.jsp" %> --%>
<%@ include file ="../fragments/loginChk.jsp" %>


<%

String perf_num = request.getParameter("perfNum");
String currentPage = request.getParameter("currentPage");
String field = request.getParameter("field");
String keyword = request.getParameter("keyword");


if(perf_num!=null){
	int perfIntNum = Integer.parseInt(perf_num);
	AdminPerformService pfService = new AdminPerformService();
	AdminPerformDTO pDTO = new AdminPerformDTO();
	pDTO = pfService.searchDetailPerform(perfIntNum);
	pageContext.setAttribute("pDTO", pDTO);
	pageContext.setAttribute("perf_num", perfIntNum);
	pageContext.setAttribute("currentPage", currentPage);
	pageContext.setAttribute("field", field);
	pageContext.setAttribute("keyword", keyword);

}


%>



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


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<style>

img{
max-width: 100%;
max-height: 100%;
display: block;
margin: 0 auto;
}

.border border-0{


width:100px;
height:40px;
text-align:center;
justify-content: center;
margin-bottom:20px;
margin-left:20px;
display: flex;
align-items: center;


}


.border{

width:100px;
height:40px;
text-align:center;
justify-content: center;
margin-bottom:20px;
margin-left:20px;
display: flex;
align-items: center;

}

.sub{
border-radius: 10px;
}

</style>


<script>

$(function(){

	
	
	var selectedTime = "${pDTO.getPerfTime()}"
	let start = 10 * 60;   
    let end = 23 * 60;     
    let step = 30;        

    for (let t = start; t <= end; t += step) {
        let hour = Math.floor(t / 60);
        let minute = t % 60;

        let timeStr = 
            ("0" + hour).slice(-2) + ":" + ("0" + minute).slice(-2);

        var selected = (selectedTime === timeStr) ? ' selected' : '';
            
        $("#perfTime").append(
        	'<option value="' + timeStr + '"'+selected + '>' + timeStr + '</option>'
        );
    }
    
    
    
    if($("#performanceType1").val()=="1"){
    	$("#perfPrice").prop('readonly',true);
    }
    if($("#performanceType1").val()=="2"){
    	$("#perfPrice").prop('readonly',false);
    }
    
	$("#performanceType1").on('change', function(){
		
		var selectedType = $(this).val(); // 선택된 옵션의 value 값 (perf1 또는 perf2)
		
		if(selectedType === "1"){
			$("#perfPrice").val(0);
			$("#perfPrice").prop('readonly', true);
		} else{
			$("#perfPrice").val(0);
			$("#perfPrice").prop('readonly', false);
		}
	});
	
	
	$("#addPerf").on('click',function(){	
		var flagTitle = chkTitle(); // Title, Subtitle 예외처리
		if(!flagTitle){
			return;
		}
		
		var flagDate = chkDate();	// Date 체크 예외처리
		
		if(!flagDate){
			return;
		}
		
		var flagTime = chkShowTime(); //공연시간 체크 예외처리
		
		if(!flagTime){
			return;
		}
		
		var flagPrice = chkPrice();
		
		if(!flagPrice){
			return;
		}
		
			
		//이미지 주소 hidden으로 전달.
		$("#typeFlag").val("3");
		
		$("#frm").submit();
	});
	
	$("#deletePerf").on('click',function(){
		$("#typeFlag").val("2");
		$("#frm").submit();
	});
	
	$("#modifyPerf").on('click',function(){	
		
		if(confirm("행사내용을 수정하시겠습니까?")){
			var flagTitle = chkTitle(); // Title, Subtitle 예외처리
			if(!flagTitle){
				return;
			}
			
			var flagDate = chkDate();	// Date 체크 예외처리
			
			if(!flagDate){
				return;
			}
			
			var flagTime = chkShowTime(); //공연시간 체크 예외처리
			
			if(!flagTime){
				return;
			}
			
			var flagPrice = chkPrice();
			
			if(!flagPrice){
				return;
			}
			
			
			//이미지 주소 hidden으로 전달.
			$("#typeFlag").val("1");
			
			$("#frm").submit();
		}
	});
	
	$("#cancelPerf").on('click',function(){		
		history.back();
	});
	
	
	
	
	$("#thumbImgBtn").click(function(){
		$("#thumbfile").click(); //파일을 선택하면 파일이 변경 (change event 발생)
	});
	
	$("#imgBtn").click(function(){
		$("#imgfile").click(); //파일을 선택하면 파일이 변경 (change event 발생)
	});
	
	
	$("#thumbfile").change(function(evt){
		
		//1. HTML File Control 접근
		var file = evt.target.files[0];		
		//2. 파일을 읽기위한 스트림 생성
		var reader = new FileReader();
		//3. file 객체의 onload 이벤트 핸들러를 설정하여 <img 태그에 src속성에 파일명을 설정
		reader.onload=function(evt){
			$("#perfThumb").prop("src", evt.target.result);
		}
		//4. 스트림을 사용하여 <img태그 이미지를 로딩
		reader.readAsDataURL(file);
	});//change
	
	$("#imgfile").change(function(evt){
		
		//1. HTML File Control 접근
		var file = evt.target.files[0];		
		//2. 파일을 읽기위한 스트림 생성
		var reader = new FileReader();
		//3. file 객체의 onload 이벤트 핸들러를 설정하여 <img 태그에 src속성에 파일명을 설정
		reader.onload=function(evt){
			$("#perfImg").prop("src", evt.target.result);
		}
		
		//4. 스트림을 사용하여 <img태그 이미지를 로딩
		reader.readAsDataURL(file);
	});//change
	
	
	
	
	
	
	
	
	
});//ready;



function chkTitle(){
	var title = $("#perfTitle").val();
	if(title==null || title==""){
		alert("제목을 입력해주세요");
		return false;
	}
	
	var subTitle = $("#perfSubTitle").val();
	if(subTitle==null || subTitle==""){
		alert("부제목을 입력해주세요");
		return false;
	}
	
	return true;
	
}

function chkDate(){
	var strDate = $("#strDate").val();
	var endDate = $("#endDate").val();
	
	
	if(strDate=="" || endDate==""){
		alert("종료일,시작일을 입력해주세요.");
		return false;
	}
	
	if(strDate>=endDate){
		alert("종료일은 시작일보다 빠를 수 없습니다");
		return false;
	}
	return true;
}

function chkShowTime(){
	var showTime = $("#showTime").val();
	
	if(showTime==""){
		alert("소요시간을 입력해주세요.");
		return false;		
				
	}
	
	if(!(showTime>0 && showTime<=999)){
		alert("소요시간은 1000분 미만의 숫자만 입력가능합니다.");
		return false;
	}
	return true;
}

function chkPrice(){
	var price = $("#perfPrice").val();
	
	if(price==""){
		alert("가격을 입력해주세요.");
		return false;		
				
	}
	
	if(!(price>=0 && price<=999999)){
		alert("금액은 1,000,000만원 미만의 숫자만 입력가능합니다.");
		return false;
	}
	return true;
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
				<div class="container-fluid">
				
				<h1 class="h3 mb-0 text-gray-800 m-0 font-weight-bold text-danger">행사 관리</h1>
				<form action="perf_write_process.jsp" method="post" id="frm" enctype="multipart/form-data">
					<div class="card shadow mb-4" style="width:80%; margin-top:30px;">
						<div class="card-body" id="photoWrap">
							<div class="table-responsive" style="width:90%; margin: 0 auto">
								<table class="table" id="dataTable" style="border:1px solid #eee">
									<colgroup>
										<col style="width: 50%;">
										<col style="width: 50%;">
									</colgroup>
									<thead>
										<tr style="text-align:center">
											<th style="border-right: 1px solid #eee;">썸네일</th>
											<th>원본 이미지</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="height:400px; border-right: 1px solid #eee;">
											<img src="${CommonURL}/upload/${pDTO.getPerfPreview() == null ? 'bibi.png' : pDTO.getPerfPreview()}" id="perfThumb" name="perfThumb" style="height:400px">
											<input type="file" accept="image/*" name="thumbfile" id="thumbfile" style="display:none"/><br>											
											<div style="text-align:center"><strong>&lt; 썸네일 이미지 &gt;</strong></div>
											</td>
											<td style="height:400px">
											<img src="${CommonURL}/upload/${pDTO.getPerfImg() == null ? 'bibi.png' : pDTO.getPerfImg()}" id="perfImg" name="perfImg" style="height:400px">
											<input type="file" accept="image/*" name="imgfile" id="imgfile" style="display:none"/><br>
											<div style="text-align:center"><strong>&lt; 원본 이미지 &gt;</strong></div>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr style="text-align:center">
											<td style=" border-right: 1px solid #eee;">
											<input type="button" class="btn btn-danger" value="사진 업로드" id="thumbImgBtn">
											
											</td>
											<td>
											<input type="button" class="btn btn-danger" value="사진 업로드" id="imgBtn">
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
				
						<div id="textWrap" style="margin:30px auto; padding-top:20px; padding-bottom:10px; width: 85%; padding-right:200px;background-color:#f8f9fc; border-radius:15px" class="card shadow mb-4">
							<div style="display:flex;">
							<div class="border border-0 font-weight-bold">공연타입</div>
							<select class="form-control" id="performanceType1" style="width:200px; margin-left:20px" name="perfType">
								
								<c:choose>
								<c:when test="${pDTO.getPerfType() eq 1}">
								<option value="1" selected="selected">퍼레이드</option>
						        <option value="2">공연</option>
						        </c:when>
								<c:when test="${pDTO.getPerfType() eq 2}">
								<option value="1">퍼레이드</option>
						        <option value="2" selected="selected">공연</option>
								</c:when>
								<c:otherwise>
								<option value="1">퍼레이드</option>
						        <option value="2">공연</option>
								</c:otherwise>
								</c:choose>
								
								
								
						    </select>
							</div>
							
							<%--img 처리 --%>
							
							<input type="hidden" name="perfPreviewSrc" value="${pDTO.getPerfPreview()}">							
							<input type="hidden" name="perfImgSrc"  value="${pDTO.getPerfImg()}">
							<input type="hidden" name="currentPage" value="${currentPage}"/>
							<input type="hidden" name="field" value = "${field}"/>
							<input type="hidden" name="keyword" value = "${keyword}"/>
							<div style="display:flex">
							<input type="hidden" id="perfNum" name="perfNum" value="${perf_num}">
							<div class="border border-0  font-weight-bold">제목</div>
							<div><input type="text" name="perfTitle" id="perfTitle" style="width:500px; text-align:left; padding-left:10px" class="border sub" value="${pDTO.getPerfTitle()}"></div>
							</div>
							
							
							<div style="display:flex">
							<div class="border border-0 font-weight-bold">부제목</div>
							<div><input type="text" name="perfSubTitle" id="perfSubTitle" style="width:700px; text-align:left; padding-left:10px" class="border sub" value="${pDTO.getPerfSubTitle()}"></div>
							</div>
							
							
							<div style="display:flex">
							<div class="border border-0 font-weight-bold">장소</div>
							<select class="form-control" name="perfLoc" id="performanceType" style="width:200px; margin-left:20px">
								<c:choose>
								<c:when test="${pDTO.getPerfLoc() eq 1}">
								<option value="1" selected="selected">대형메인홀</option>
						        <option value="2">소극장</option>
						        <option value="3">콘서트홀</option>
						        </c:when>
								<c:when test="${pDTO.getPerfLoc() eq 2}">
								<option value="1">대형메인홀</option>
						        <option value="2" selected="selected">소극장</option>
						        <option value="3">콘서트홀</option>
								</c:when>
								<c:when test="${pDTO.getPerfLoc() eq 3}">
								<option value="1">대형메인홀</option>
						        <option value="2">소극장</option>
						        <option value="3" selected="selected">콘서트홀</option>
								</c:when>
								<c:otherwise>
								<option value="1">대형메인홀</option>
						        <option value="2">소극장</option>
						        <option value="3">콘서트홀</option>
								</c:otherwise>
								</c:choose>
						    </select>
							</div>
							
							
							<div style="display:flex">
							<div class="border border-0  font-weight-bold">공연기간</div>
							<div style="margin-left:20px"><input type="date" name="perfStartDate" id="strDate" class="form-control" value="${pDTO.getPerfStartDate()}"></div>
							<div>&nbsp;~&nbsp;</div>
							<div><input type="date"  name="perfEndDate" id="endDate" class="form-control sub" value="${pDTO.getPerfEndDate()}"></div>
							</div>
							
							
							<div style="display:flex">
							<div class="border border-0  font-weight-bold">공연시간</div>
							<select class="form-control" name="perfTime" id="perfTime" style="width:200px; margin-left:20px">								
						    </select>
							</div>
							
							<div style="display:flex">
							<div class="border border-0 font-weight-bold">소요시간</div>
							<div><input type="text" name="showTime" id="showTime" style="width:120px" class="border sub" value="${pDTO.getPerfShowTime()}"></div><span style="padding-top:15px; margin-left:5px">분</span>
							<div class="border border-0 border-bottom-light font-weight-bold">가격</div>
							<div><input type="text" name="perfPrice" id="perfPrice" style="width:150px" class="border sub"value="${empty pDTO.getPerfPrice() ? 0 : pDTO.getPerfPrice()}"></div><span style="padding-top:15px; margin-left:5px">원</span>
							</div>
							
							<input type="hidden" name="typeFlag" id="typeFlag"/>
							
						</div>
						<%
						//글쓰기로 들어왔다면?
						if(perf_num == null){
							
						%>
						<div style="display:flex; justify-content: flex-end; margin-right:50px; margin-bottom:50px">
							<input type="button" class="btn btn-danger" id="addPerf" value="등록" style="margin-right:30px; width:200px; font-size:20px">
							<input type="button" class="btn btn-danger" id="cancelPerf" value="취소" style=" width:200px; font-size:20px">
						</div>
						<%
						}else{
						
						%>
						
						<%
						//기존으로 들어왔다면?
						
						%>
						<div style="display:flex; justify-content: flex-end; margin-right:50px; margin-bottom:50px">
							<input type="button" class="btn btn-danger" id="modifyPerf" value="수정" style="margin-right:30px; width:200px; font-size:20px">
							
							
							<input type="button" class="btn btn-danger" id="deletePerf" value="삭제" style=" width:200px; margin-right:30px; font-size:20px">
							<input type="button" class="btn btn-danger" id="cancelPerf" value="취소" style=" width:200px; font-size:20px">
						</div>
						<%
						}
						%>
				
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

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>


</body>

</html>