<%@page import="attr.AdminAttractionDTO"%>
<%@page import="attr.AdminAttractionService"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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


<%
		
		String date = request.getParameter("date");
		String attrNum = request.getParameter("num");
		String keyword = request.getParameter("keyword");
		int num = 0;
		if(attrNum!=null && !attrNum.trim().isEmpty()){
			try{
			num = Integer.parseInt(attrNum);
			}catch(NumberFormatException nfe){
				num = 1;
			}
		}
		
		AdminAttractionService aService = AdminAttractionService.getInstance();
		AdminAttractionDTO aDTO = aService.searchDetailAttraction(date, num);
		
		String tempHeight = aDTO.getAttrHeight();
		
		String strHeight = tempHeight.substring(0,tempHeight.indexOf("cm"));
		String endHeight = tempHeight.substring(tempHeight.lastIndexOf("~")+1,tempHeight.lastIndexOf("cm"));
		
		
		pageContext.setAttribute("date", date);
		pageContext.setAttribute("num", attrNum);
		pageContext.setAttribute("keyword", keyword);
		pageContext.setAttribute("aDTO", aDTO);
		pageContext.setAttribute("strHeight",strHeight);
		pageContext.setAttribute("endHeight",endHeight);
		
		
%>

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


.attr1{
color : #1A9543;
font-weight:bold;
}
.attr2{
color : #FF6B00;
font-weight:bold;
}

</style>


<script>

$(function(){

	//이미지 버튼 활성화
	$("#thumbImgBtn").on('click',function(){
		$("#img1").click();
	});
	$("#imgBtn").on('click',function(){
		$("#img2").click();
	});
	$("#img2Btn").on('click',function(){
		$("#img3").click();
	});
	//이미지 업로드시 화면 미리보기
	$("#img1").on('change',function(evt){
		var file = evt.target.files[0];		
		var reader = new FileReader();
		reader.onload=function(evt){
			$("#img1View").prop("src", evt.target.result);
		}
		reader.readAsDataURL(file);
	})
	$("#img2").on('change',function(evt){
		var file = evt.target.files[0];		
		var reader = new FileReader();
		reader.onload=function(evt){
			$("#img2View").prop("src", evt.target.result);
		}
		reader.readAsDataURL(file);
	})
	$("#img3").on('change',function(evt){
		var file = evt.target.files[0];		
		var reader = new FileReader();
		reader.onload=function(evt){
			$("#img3View").prop("src", evt.target.result);
		}
		reader.readAsDataURL(file);
	})

	
	
	$("#modifyPerf").on('click', function(){
		
		
		if($("#attrStartDate").val()==""){
			alert("시작날짜를 선택해주세요");
			return;
		}
		
		if($("#attrEndDate").val()==""){
			alert("끝날짜를 선택해주세요");
			return;
		}
		
		    
		var startDate = new Date($("#attrStartDate").val());
		var endDate = new Date($("#attrEndDate").val());
		
		if(startDate > endDate) {
		    alert("시작 날짜는 끝 날짜보다 빠를 수 없습니다.");
		    return; 
		}
		
		var attrExplain = $('textarea[name="attrExplain"]').val();
		
		if ($.trim(attrExplain) === "") {
		    alert("내용을 입력해주세요.");
		    $('textarea[name="attrExplain"]').focus();
		    return;
		}
		    
		$("#frm").submit();
	});
	
	
	$("#cancelPerf").on('click', function(){	
		history.back();
	});
	
	
	
	//정상운영, 운행점검 폰트 색 변경을 위한 이벤트처리 (시작값)
	$(".attr-status").each(function() {
		updateSelectColor($(this));
	});

	////정상운영, 운행점검 폰트 색 변경을 위한 이벤트처리 (변경값)
	$(".attr-status").on('change', function() {
		updateSelectColor($(this));
	});
	

	$("#minHeight").val("min${strHeight}");
	$("#maxHeight").val("max${endHeight}");
	
	
	
});//ready;

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
				
				
				<h1 class="h3 mb-0 text-gray-800 m-0 font-weight-bold text-danger">${aDTO.attrName}</h1>
				
					<form id="frm" action="attrac_process.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="attrNum" value="${num }">
					<input type="hidden" name="date" value="${date }">
					<input type="hidden" name="keyword" value="${keyword }">
					
					<div class="card shadow mb-4" style="width:80%; margin-top:30px;">
						<div class="card-body" id="photoWrap">
							<div class="table-responsive" style="width:90%; margin: 0 auto">
								<table class="table" id="dataTable" style="border:1px solid #eee">
									<colgroup>
										<col style="width: 33%;">
										<col style="width: 33%;">
										<col style="width: 33%;">
									</colgroup>
									<thead>
										<tr style="text-align:center">
											<th style="border-right: 1px solid #eee;">썸네일</th>
											<th>원본 이미지1</th>
											<th>원본 이미지2</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="height:300px; border-right: 1px solid #eee;">
											<img src="${CommonURL}/upload/${aDTO.attrMain }" id="img1View">
											<div style="text-align:center"><strong>&lt; 썸네일 이미지 &gt;</strong></div>
											</td>
											<td style="height:300px">
											<img src="${CommonURL}/upload/${aDTO.attrPrev }" id="img2View">
											<div style="text-align:center"><strong>&lt; 원본 이미지1 &gt;</strong></div>
											</td>
											<td style="height:300px">
											<img src="${CommonURL}/upload/${aDTO.attrPrev2 }" id="img3View">
											<div style="text-align:center"><strong>&lt; 원본 이미지2 &gt;</strong></div>
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr style="text-align:center">
											<td style=" border-right: 1px solid #eee;">
											<input type="button" class="btn btn-danger" value="사진 업로드" id="thumbImgBtn">
											<input type="file" accept="image/*" name="img1" id="img1" style="display:none"/><br>
											<input type="hidden" name="thumbImg" id="thumbImg" value="${aDTO.attrMain }"/>
											</td>
											<td>
											<input type="button" class="btn btn-danger" value="사진 업로드" id="imgBtn">
											<input type="file" accept="image/*" name="img2" id="img2" style="display:none"/><br>
											<input type="hidden" name="prevImg" id="prevImg" value="${aDTO.attrPrev }"/>
											</td>
											<td>
											<input type="button" class="btn btn-danger" value="사진 업로드" id="img2Btn">
											<input type="file" accept="image/*" name="img3" id="img3" style="display:none"/><br>
											<input type="hidden" name="prevImg2" id="prevImg2" value="${aDTO.attrPrev2 }"/>	
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
				
				
						<div id="textWrap" style="margin:30px auto; padding-top:20px; padding-bottom:10px; padding-right:250px;background-color:#f8f9fc; border-radius:15px" class="card shadow mb-4">
							<div style="display: flex; margin-bottom:5px">
								<div class="border border-0  font-weight-bold">운영상태</div>
								<div>
								<select class="form-control font-weight-bold attr-status" name="type" style="width:200px; height:38px; margin-left:20px">
									<%if(aDTO.getAttrState().equals("N")){%>
							        <option value="attr1" class="attr1" selected="selected">정상운행</option>
							        <option value="attr2" class="attr2">정기점검</option>
							        <%}else{%>
							        <option value="attr1" class="attr1">정상운행</option>
							        <option value="attr2" class="attr2" selected="selected">정기점검</option>
							        <%}%>
							    </select>
								</div>
							</div>
							
							<div style="display:flex">
							<div class="border border-0  font-weight-bold">날짜선택</div>
							<div style="margin-left:20px"><input type="date" class="form-control" id="attrStartDate" name="attrStartDate" value="${param.date}"></div>
							<div>&nbsp;~&nbsp;</div>
							<div><input type="date" class="form-control sub" name="attrEndDate" id="attrEndDate" value="${param.date}"></div>
							</div>
							
							
							<div style="display:flex">
							<div class="border border-0  font-weight-bold">이름</div>
							<div><input type="text" style="width:200px" class="border sub" disabled="disabled" value="${aDTO.attrName }"></div>
							<input type="hidden" name="attrName" value="${aDTO.attrName }">
							</div>
							
							
							<div style="display:flex">
							<div class="border border-0 font-weight-bold">위치</div>
							<div><input type="text" style="width:400px" class="border sub" disabled="disabled" value="${aDTO.attrLoc}"></div>
							</div>
							
							
							<div style="display:flex">
							<div class="border border-0  font-weight-bold">키제한</div>
							<div>
							<select class="form-control" id="minHeight" name="minHeight" style="width:150px; margin-left:20px">
						        <option value="min70">70</option>
						        <option value="min80">80</option>
						        <option value="min90">90</option>
						        <option value="min100">100</option>
						        <option value="min110">110</option>
						        <option value="min120">120</option>
						        <option value="min130">130</option>
						    </select>
							</div>
							<div style="align-content: center;">&nbsp;cm</div>
							<div>&nbsp;~&nbsp;</div>
							<div>
							<select class="form-control" id="maxHeight" name="maxHeight" style="width:150px; margin-left:20px">
						        <option value="max140">140</option>
						        <option value="max150">150</option>
						        <option value="max160">160</option>
						        <option value="max170">170</option>
						        <option value="max180">180</option>
						        <option value="max190">190</option>
						        <option value="max200">200</option>						
						    </select>
						    </div>
						    <div style="align-content: center;">&nbsp;cm</div>
							</div>
							
							
							<div style="display:flex">
							<div class="border border-0  font-weight-bold">설명</div>
							<div class="form-floating" style="width:400px; margin-left:20px">
								<textarea class="form-control" name="attrExplain" style="height:200px; resize: none;">${aDTO.attrExplain}</textarea>
							</div>
							</div>

						</div>
						<div style="display:flex; justify-content: flex-end; margin-right:50px; margin-bottom:50px">
							<input type="button" class="btn btn-danger" id="modifyPerf"value="수정" style="margin-right:30px; width:200px; font-size:20px">
							<input type="button" class="btn btn-danger" id="cancelPerf" value="취소" style=" width:200px; font-size:20px">
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

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>


</body>

</html>