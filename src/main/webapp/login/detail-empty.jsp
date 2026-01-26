<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="isErrorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>오류낫다리</title>
<script src="http://192.168.10.71/jsp_prj/common/js/color-modes.js"></script>

<link rel = "shortcut icon" href="http://192.168.10.71/jsp_prj/common/images/favicon.ico">
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->


<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.71/jsp_prj/common/css/carousel.css" rel="stylesheet">
<style type="text/css">


#error_container{

  margin: 0 auto;
  margin-top: 40px;
  text-align: center;
  font-family: sans-serif;
 
}
#error_img{
	width: 25%;
	height: auto;
}

.title_context{
	font-size: 30px;
	font-weight: bold;

}

.title_eng{

	font-size: 22px;

}


.sub_context{
		margin-top: 20px;
}
.btn_context{
	margin: 0 auto;
	margin-top: 30px;

}
.home_btn{
	 width: 150px;
	 height: 50px;
	 background-color: #FFFFFF; 
	 border: 1px solid #FF6124;
	 border-radius: 7px;
	 color:#FF6124;

}
@media screen and (max-width:700px) {
	.home_btn{
	 width: 100%;
	 
	}
	.title_context{
	font-size: 20px;
	font-weight: bold;

	}
	
	.title_eng{

	font-size: 15px;

}
	.sub_context{
		font-size: 12px;
	}
}

</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
 $(".home_btn").click(function(){
	 alert("갈곳없는데...수고링");
	 history.back();
	 
	 
 });
	
	
	
});//ready

</script>
</head>
<body>

<div id ="error_container" >
	<img src="images/err_img.png" id = error_img>
	<div class="title_context">
		서비스 이용에 불편을 드려 죄송합니다.<br>
		<span class = "title_eng">We apologize for the inconvenience in using our service.</span>
	</div>
	<div class="sub_context">
		조회된 데이터가 없습니다.<br>
		같은 문제가 지속적으로 발생할 경우 고객센터로 문의해주세요<br>
		No Data Found.<br>
		If this problem persists, please contact customer service.<br>
	</div>
	<div class="btn_context">
	<input type="button" value="HOME" class="home_btn"/>
	</div>
</div>
	

</body>
</html>