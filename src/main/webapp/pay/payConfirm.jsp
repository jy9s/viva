<%@page import="kr.co.viva.pay.QrCodeCreate"%>
<%@page import="java.util.Date"%>
<%@page import="kr.co.viva.pay.PayProcessService"%>
<%@page import="kr.co.viva.pay.ResInfoDTO"%>
<%@page import="kr.co.viva.pay.PromotionDTO"%>
<%@page import="kr.co.viva.pay.PromotionDAO"%>
<%@page import="kr.co.viva.pay.PayInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
request.setCharacterEncoding("UTF-8");


/* ================= 공통 ================= */
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

/* ================= payNum 생성 ================= */
int payNum = (int)(System.currentTimeMillis() / 1000);

/* ================= 결제 정보 ================= */
PayInfoDTO payDto = new PayInfoDTO();

// ✅ 수정: cardNoPure 사용 (payInfoGet.jsp에서 전송됨)
String cardNoPure = request.getParameter("cardNoPure");
String cardNoFormatted = request.getParameter("cardNo"); // 표시용

if(cardNoPure != null && cardNoPure.length() == 16){
    // cardNoPure는 이미 숫자만 정제됨
    payDto.setCardNum1(Integer.parseInt(cardNoPure.substring(0, 4)));
    payDto.setCardNum2(Integer.parseInt(cardNoPure.substring(4, 8)));
    payDto.setCardNum3(Integer.parseInt(cardNoPure.substring(8, 12)));
    payDto.setCardNum4(Integer.parseInt(cardNoPure.substring(12, 16)));
} else {
    // 오류 처리
%>
<script>
    alert("카드번호 정보가 올바르지 않습니다.");
    history.back();
</script>
<%
    return;
}

payDto.setCvc(Integer.parseInt(request.getParameter("cvcPure")));
payDto.setCardPass(Integer.parseInt(request.getParameter("pwdPure")));

// ✅ 수정: installment 값 처리
String inst = request.getParameter("installment");
int installmentVal = "0".equals(inst) ? 0 : Integer.parseInt(inst);
payDto.setInstallment(installmentVal);

payDto.setCardCode(request.getParameter("cardCompany"));
payDto.setPayAgency(request.getParameter("cardCompany"));
payDto.setPayMethod("신용카드");

// ✅ 수정: expPure 사용
String expPure = request.getParameter("expPure");
payDto.setExpiration(expPure != null ? expPure.substring(0,2)+"/"+expPure.substring(2,4) : "");

payDto.setPayNum(payNum);

/* ================= 예약 정보 ================= */
ResInfoDTO resDto = new ResInfoDTO();

// ✅ 수정: cardCompany 첫 4글자 안전 처리
String cardCompany = request.getParameter("cardCompany");
String cardCompanyShort = cardCompany != null && cardCompany.length() >= 4 ? 
    cardCompany.substring(0,4) : cardCompany;

PromotionDAO pDao = PromotionDAO.getInstance();
List<PromotionDTO> pList = pDao.selectAllPromotion();

int promNum = 11;     // 기본값 (프로모션 없음)
int discount = 0;

if(cardCompanyShort != null) {
    for (PromotionDTO p : pList) {
        if (cardCompanyShort.equals(p.getPromPayAgency())) {
            promNum = p.getPromNum();
            discount = p.getDiscount();
            break;
        }
    }
}

int memberNum = 0;
try{
    memberNum = (Integer)session.getAttribute("UserNum"); 
}catch(Exception e){
    memberNum = 0; // 비회원 처리
}

resDto.setMemberNum(memberNum);
resDto.setProm_num(promNum);
resDto.setDiscount(discount);

int originTotalPrice = Integer.parseInt(request.getParameter("originTotalPrice"));
int finalPayAmount = Integer.parseInt(request.getParameter("finalPayAmount"));
int discountTotalPrice = originTotalPrice - finalPayAmount;

resDto.setAdultCnt(Integer.parseInt(request.getParameter("qtyAdult")));
resDto.setTeenAgerCnt(Integer.parseInt(request.getParameter("qtyTeen")));
resDto.setKidsCnt(Integer.parseInt(request.getParameter("qtyKids")));

// ✅ 수정: totalDesc는 문자열이므로 discount에 사용하지 않음
// resDto.setDiscount(discount); // 이미 위에서 설정됨
resDto.setTotalPrice(finalPayAmount);  // ✅ 수정: finalPayAmount 사용
resDto.setTicketType(request.getParameter("ticketType"));

resDto.setResDate(new Date());
resDto.setUseDate(new Date());
resDto.setProm_pay_agency(cardCompany);

/* ================= QR 코드 생성 ================= */
String realPath = request.getServletContext().getRealPath("/qrcode");
String saveFileName = QrCodeCreate.createQR(payNum, realPath);

/* ================= Service 호출 ================= */
PayProcessService service = new PayProcessService();
boolean success = service.process(payDto, resDto, null, saveFileName);

/* ================= 결과 분기 ================= */
if(success){
    // 성공 시 paySuccess.jsp로 forward
    request.setAttribute("payNum", payNum);
    request.setAttribute("totalDiscount", discountTotalPrice);
    request.setAttribute("finalPayAmount", finalPayAmount);
    request.setAttribute("reservNo", "VIVA-" + String.format("%08d", payNum));
    
    RequestDispatcher rd = request.getRequestDispatcher("paySuccess.jsp");
    rd.forward(request, response);
} else {
%>
<script>
    alert("결제 처리 중 오류가 발생했습니다.\n관리자에게 문의하세요.");
    history.back();
</script>
<%
}
%>
