<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setCharacterEncoding("UTF-8");

	String totalDesc = request.getParameter("totalDesc");
	

    // 파라미터 수신
    String ticketName = request.getParameter("ticketName");
    String ticketType = request.getParameter("ticketType");
    String visitDate = request.getParameter("visitDate");
    String payDate = request.getParameter("payDate");
    String expireDate = request.getParameter("expireDate");
    
    // 금액 계산
    int originPrice = Integer.parseInt(request.getParameter("originTotalPrice"));
    int finalPrice = Integer.parseInt(request.getParameter("finalPayAmount"));
    int totalDiscount = (Integer)request.getAttribute("totalDiscount");

    // 결제 수단 (카드사)
    String cardCompany = request.getParameter("cardCompany");
    
    // 예매/결제 번호 생성 (실제 DB 연동 전 임시값)
    String reserveDate = new java.text.SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(new java.util.Date());
    String reserveNo = "R" + System.currentTimeMillis();
    String payNo = "P" + (System.currentTimeMillis() / 100);

    // EL 사용을 위한 attribute 설정
    pageContext.setAttribute("ticketName", ticketName);
    pageContext.setAttribute("visitDate", "annual".equals(ticketType) ? (payDate + " ~ " + expireDate) : visitDate);
    pageContext.setAttribute("reserveDate", reserveDate);
    pageContext.setAttribute("reserveNo", reserveNo);
    pageContext.setAttribute("payMethodName", cardCompany + "(카드)");
    pageContext.setAttribute("payNo", payNo);
    pageContext.setAttribute("discountAmount", totalDiscount);
    pageContext.setAttribute("totalPrice", finalPrice);
%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>VIVA PARK - 결제완료</title>
<link rel="stylesheet" type="text/css"
      href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css">
<style>
/* 기존 스타일 그대로 유지 */
body{background:#f5f5f5;}
.pay-box{ max-width:900px; margin:40px auto 60px; background:#fff; border-radius:10px; padding:30px 40px 40px; box-shadow:0 0 15px rgba(0,0,0,0.12); }
.pay-title{ font-size:24px; font-weight:700; text-align:center; margin-bottom:25px; }
.pay-msg-main{ font-size:20px; font-weight:600; margin-bottom:10px; }
.pay-msg-sub{ font-size:13px; color:#666; line-height:1.6; margin-bottom:0px; }
.pay-line{ border-top:1px solid #ddd; margin:20px 0; }
.table-wrap{ border:1px solid #d7d5ff; border-radius:8px; padding:10px; }
.table-summary{ width:100%; border-collapse:collapse; }
.table-summary th, .table-summary td{ border:1px solid #eee; padding:10px 14px; font-size:14px; }
.table-summary th{ background:#fafafa; width:18%; }
.btn-confirm{ margin-top:28px; display:block; width:160px; height:44px; line-height:44px; border-radius:4px; text-align:center; border:1px solid #ff7a00; color:#ff7a00; background:#fff; margin-left:auto; margin-right:auto; font-weight:600; text-decoration:none;}
.btn-confirm:hover{ background:#ff7a00; color:#fff; }
.container{ padding-bottom:0 !important; }
#footer{ margin-top:0 !important; }
</style>

<script src="https://www.gjw.co.kr/inc/gjw_2024/js/14jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/inc/gjw_2024/bs/bootstrap.min.css?ver=1763706557">
<link rel="stylesheet" href="https://www.gjw.co.kr/css/gjw_2024/reset.css?ver=1763706557">
<link rel="stylesheet" type="text/css" href="https://www.gjw.co.kr/css/gjw_2024/sub.css?ver=1763706557">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>




<script type="text/javascript">
    function goMainAndClose() {
        // 팝업을 연 부모창이 있으면 메인메뉴로 이동
        if (window.opener && !window.opener.closed) {
            window.opener.location.href = "${CommonURL}/main/mainPg_Include.jsp";   // 메인메뉴 JSP 경로로 변경
        } else {
            // 팝업이 아니라 단독창에서 열렸다면 현재창을 메인으로 이동
            window.location.href = "${CommonURL}/main/mainPg_Include.jsp";
            return;
        }
        // 현재 창 닫기
        window.close();
    }
</script>

</head>
<body>
    <div class="wrap">
        <div id="header">
            <jsp:include page="../include/vivatemplet_css.jsp"></jsp:include>
            <jsp:include page="../include/header.jsp"></jsp:include>
        </div>
        <jsp:include page="../include/hamberger.jsp"></jsp:include>

        <div class="container">
            <div class="pay-box">
                <div class="pay-title">결제하기</div>
                <div class="pay-msg-main">결제가 완료 되었습니다.</div>
                <div class="pay-msg-sub">
                    예매한 티켓은 마이페이지에서 확인/취소가 가능합니다.<br>
                    신용카드는 당일 결제시 부분취소가 가능합니다. 단, 복합 결제 및 신용카드를 제외한 다른 결제수단으로 예매 시 부분 취소가 불가합니다.
                </div>
                <div class="pay-line"></div>
                <div class="pay-msg-main" style="font-size:16px;margin-bottom:8px;">예매정보</div>

                <div class="table-wrap">
                    <table class="table-summary">
                        <tr>
                            <th>상품명</th>
                            <!--  <td colspan="3"><c:out value="${ticketName}"/></td> --> 
                            <td colspan="3"><%=ticketName%>/<%= totalDesc %></td>
                        </tr>
                        <tr>
                            <th>예정 방문일</th>
                            <td><c:out value="${visitDate}"/></td>
                            <th>예매 상태</th>
                            <td>예매 완료</td>
                        </tr>
                        <tr>
                            <th>예매 일시</th>
                            <td><c:out value="${reserveDate}"/></td>
                            <th>예매 번호</th>
                            <td><c:out value="${reserveNo}"/></td>
                        </tr>
                        <tr>
                            <th>결제 수단</th>
                            <td><c:out value="${payMethodName}"/></td>
                            <th>결제 번호</th>
                            <td><c:out value="${payNo}"/></td>
                        </tr>
                        <tr>
                            <th>할인 금액</th>
                            <td><fmt:formatNumber value="${discountAmount}" type="number"/>원</td>
                            <th>결제 금액</th>
                            <td><fmt:formatNumber value="${totalPrice}" type="number"/>원</td>
                        </tr>
                    </table>
                </div>
	           <a href="javascript:void(0);" class="btn-confirm" onclick="goMainAndClose();">확인</a>
            </div>
        </div>

        <div id="footer">
            <jsp:include page="../include/footer.jsp"></jsp:include>
        </div>
    </div>
</body>
</html>