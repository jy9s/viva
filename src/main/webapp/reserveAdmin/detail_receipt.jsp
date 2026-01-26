<%@page import="reserve.AdminReserveDTO"%>
<%@page import="reserve.AdminReserveService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%@ include file ="../fragments/loginChk.jsp" %> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>결제 상세 내역</title>

<%

String num = request.getParameter("num");
String type = request.getParameter("type");
String name = request.getParameter("name");

if(num!=null && !num.equals("")){
	try{
	int resNum = Integer.parseInt(num);
	

	AdminReserveService arService = AdminReserveService.getInstance();
	
	AdminReserveDTO arDTO = new AdminReserveDTO();
	
	if(type.equals("ticket")){
		arDTO = arService.selectTicketDetail(resNum);
		arDTO.setResName(arService.selectTicketDetailName(resNum));
		
	}else{
		arDTO = arService.selectPerfDetail(resNum);
		arDTO.setResName(arService.selectPerfDetailName(resNum));
	}
	
	pageContext.setAttribute("arDTO", arDTO);
	pageContext.setAttribute("name", name);
	}catch(NumberFormatException nfe){
		
	}
	
	
}


%>


<style>
    body {
        font-family: 'Pretendard', sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 420px;
        margin: 40px auto;
        background: #fff;
        border-radius: 15px;
        box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        overflow: hidden;
        padding-bottom: 30px;
    }

    .header-area {
        text-align: center;
        padding: 30px 20px 10px;
        border-bottom: 1px solid #e6e6e6;
    }

    .header-area img {
        width: 200px;
        height: 200px;
        object-fit: contain;
    }

    .header-area h2 {
        margin: 0;
        font-size: 22px;
        font-weight: 700;
        color: #333;
    }

    table {
        width: 90%;
        margin: 25px auto;
        border-collapse: collapse;
        font-size: 15px;
    }

    table tr {
        border-bottom: 1px solid #eee;
        height: 42px;
    }

    table td.label {
        width: 35%;
        background: #fafafa;
        color: #555;
        padding-left: 10px;
        font-weight: 600;
    }

    table td.value {
        color: #333;
        padding-left: 15px;
    }

    .highlight {
        color: #FF6B00;
        font-weight: 700;
    }

    .btn-area {
        text-align: center;
        margin-top: 18px;
    }

    .btn-area button {
        width: 140px;
        height: 42px;
        background: #FF6B00;
        border: none;
        border-radius: 8px;
        color: white;
        font-size: 16px;
        cursor: pointer;
        font-weight: 600;
        transition: 0.2s;
    }

    .btn-area button:hover {
        background: #e06100;
    }

</style>
</head>

<body>

<div class="container">

    <!-- 상단 영역 -->
    <div class="header-area">
        <!-- 이미지 경로만 넣으면 표시됨 -->
        <h2>결제 상세 내역</h2>
        <img src="../img/vivaLog.png" style="width:400px">
    </div>

    <!-- 결제 상세 정보 -->
    <table>
        <tr>
            <td class="label">구매자명</td>
            <td class="value">${name}</td>
        </tr>
        <tr>
            <td class="label">상품명</td>
            <td class="value">${arDTO.resName }</td>
        </tr>
        <tr>
            <td class="label">결제일시</td>
            <td class="value">${arDTO.resPayDate }</td>
        </tr>
        <tr>
            <td class="label">결제수단</td>
            <td class="value">${arDTO.resPayMethod }</td>
        </tr>
        <tr>
            <td class="label">승인번호</td>
            <td class="value">${arDTO.resPayInfoNum }</td>
        </tr>
        <tr>
            <td class="label">결제기관</td>
            <td class="value">${arDTO.resPayAgency }</td>
        </tr>
        <tr>
            <td class="label">상품금액</td>
            <td class="value highlight">
            <fmt:formatNumber value="${arDTO.resPrice }" pattern="#,###"/>
            </td>
        </tr>
        <tr>
            <td class="label">할부개월</td>
            <c:choose>
            <c:when test="${arDTO.resInstallment eq 0 }">
            <td class="value">일시불</td>
            </c:when>
            <c:otherwise>
            <td class="value">${arDTO.resInstallment}개월</td>
            </c:otherwise>
            </c:choose>
        </tr>
    </table>

    <div class="btn-area">
        <button onclick="self.close()">확인</button>
    </div>

</div>

</body>
</html>
