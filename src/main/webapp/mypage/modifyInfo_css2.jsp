<%@page import="kr.co.viva.modifyInfo.ModifyInfoDTO"%>
<%@page import="kr.co.viva.modifyInfo.ModifyInfoService"%>
<%@page import="kr.co.viva.login.JoinService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/siteproperty.jsp" %>	
<style type="text/css">

/* ----- 전체 Join Wrapper ----- */
#joinWrap {
    position: relative;        /* z-index 적용하려고 */
    z-index: 5;                /* title-cover-line 위로 올라오게 */
    
    max-width: 1000px;         /* 최대 폭 */
    width: 90%;                /* 반응형 */
    
    margin: 0 auto;            /* 가운데 정렬 */
    padding: 10px 0;           /* 최소 패딩 */
    
    font-family: "Noto Sans KR", sans-serif;
}


/* ----- 테이블 기본 ----- */
#joinFrmTd {
   width: 100%;
   border-collapse: separate;
   border-spacing: 0 10px; /* 각 항목 간 간격 */
}

/* 왼쪽 라벨 영역 */
.joinTitle {
   width: 230px;
   padding: 18px 22px;
   background: #FFF2E8;
   font-weight: 700;
   font-size: 16px;
   color: #333;
   border-right: 2px solid #FFD4BF;
   border-radius: 12px;
   vertical-align: middle;
}

/* 오른쪽 입력 영역 */
.joinInput {
   padding-left: 12px;
   margin-bottom: 0px; /* 모든 input 간격 */
}

/* 필수 * */
.star {
   color: #FF2F2F;
   font-weight: 900;
}

/* ----- 기본 인풋 스타일 ----- */
.inputBox {
   width: 260px;
   height: 44px;
   border: 1px solid #ccc;
   border-radius: 8px;
   font-size: 15px;
   padding: 10px 12px;
   background: #FAFAFA;
   transition: 0.25s;
   box-sizing: border-box;
   margin-bottom: 0px; /* 모든 input 간격 */
}

.inputBox:focus {
   background: white;
   border-color: #FF6A2B;
   box-shadow: 0 0 0 4px rgba(255, 106, 43, 0.18);
}

/* 미니 인풋 (휴대폰, 우편번호 등) */
.inputMini {
   width: 110px;
   height: 44px;
   border: 1px solid #ccc;
   border-radius: 8px;
   font-size: 15px;
   padding: 10px;
   background: #FAFAFA;
   transition: 0.25s;
}

.inputMini:focus {
   border-color: #FF6A2B;
   box-shadow: 0 0 0 4px rgba(255, 106, 43, 0.18);
}

/* 넓은 인풋 */
.inputBox.wide {
   width: 430px;
}

/* 이메일 칸 */
.email {
   width: 200px;
}

/* 휴대폰 3칸 가로 배치 */
.phoneRow {
   display: flex;
   align-items: center;
   gap: 10px;
}

/* ----- 버튼 ----- */
.btnBox, .btnJoin, .btnCancel {
   height: 44px;
   border-radius: 8px;
   padding: 0 20px;
   font-size: 15px;
   font-weight: 600;
   cursor: pointer;
   transition: 0.2s;
}

.btnBox, .btnJoin {
   background: #FF6A2B;
   color: white;
   border: none;
}

.btnBox:hover, .btnJoin:hover {
   background: #E4581E;
}

.btnCancel {
   border: 2px solid #FF6A2B;
   background: white;
   color: #FF6A2B;
}

.btnCancel:hover {
   background: #FFE4D6;
}

/* 우편번호 버튼은 오렌지 강조 */
.btnBox.orange {
   background: #FF6A2B;
}

/* 제출 버튼 영역 */
.joinBtns {
   text-align: center;
   padding-top: 40px;
}

.joinBtns button {
   margin: 0 10px;
}



/* 캐릭터·타이틀 전체 영역 */
.character-wrap {
    margin-top: 40px;
    position: relative;
    z-index: 1;
}

/* 캐릭터 + 타이틀 */
.title-line-box {
    position: relative;
    top: 60px;           /* 아래로 이동 */
    width: 100%;
    max-width: 1200px;
    height: 200px;
    margin: 0 auto;
}


/* 캐릭터 이미지 */
.title-character {
    position: absolute;
    bottom: 0;
    height: auto;
}

/* poppy */
.title-character.poppy {
    left: 10%;
    height: 260px;
}

/* bibi */
.title-character.bibi {
    right: 10%;
    margin-bottom: 40px;
    height: 210px;
}

/* 선 영역 — joinWrap 아래로 들어가야 함 */
.title-cover-line {
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 130px;
    background-color: #ffffff;
    border-top: 1px solid #333;
    z-index: 0;                 /* joinWrap 이 이 위로 올라오게 */
}

.title-text {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    top: 10px;
    font-size: 30px;
    font-weight: bold;
}


</style>


<!-- jQuery CDN 시작 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
   /* 아이디 중복, 우편번호 검색 */

   // ===== ID 중복확인 버튼 클릭 =====
   $(function() {
      $("#btnIdSearch").on(
            "click",
            function() {

               let id = $("#user_id").val().trim();

               if (id === "") {
                  alert("아이디를 입력해주세요.");
                  return;
               }

               // findId.jsp 로 입력한 ID 넘기기
               window.open("findId.jsp?id=" + id, "idWin",
                     "width=500,height=400,top="
                           + (window.screenY + 120) + ", left="
                           + (window.screenX + 250));
            });
   });

   // ===== 우편번호 검색 =====
   function findZipcode() {
      findPostcode();
   }

   $(function() {
      $("#btnZipSearch").on("click", function() {
         findZipcode();
      });
   });

   /* ===== 가입 버튼 클릭 ===== */
   $(function() {
      $("#btnJoin").on(
            "click",
            function() {

               // 필수 입력값 체크
               if ($("#user_id").val().trim() === "") {
                  alert("아이디를 입력해주세요.");
                  return;
               }

               if ($("#user_name").val().trim() === "") {
                  alert("이름을 입력해주세요.");
                  return;
               }
               if ($("#birth").val().trim() === "") {
                  alert("생년월일을 선택해주세요.");
                  return;
               }

               if ($("#phone1").val() === ""
                     || $("#phone2").val().trim() === ""
                     || $("#phone3").val().trim() === "") {
                  alert("휴대폰 번호를 입력해주세요.");
                  return;
               }

               if ($("input[name='email1']").val().trim() === ""
                     || $("input[name='email2']").val().trim() === "") {
                  alert("이메일을 입력해주세요.");
                  return;
               }

               if ($("#zipcode").val().trim() === "") {
                  alert("우편번호를 검색해주세요.");
                  return;
               }
               if ($("#addr").val().trim() === "") {
                  alert("주소를 입력해주세요.");
                  return;
               }
               if ($("#addrDetail").val().trim() === "") {
                  alert("상세주소를 입력해주세요.");
                  return;
               }

               // 모든 입력이 완료된 경우
               if(confirm("수정 하시겠습니까?"))	{
               $("#joinFrm").submit();
            	   
               }
            });
   });

   /* ===== 취소 버튼 클릭 ===== */
   $(function() {
      $("#btnCancel").on("click", function() {
         if (confirm("정말 취소하고 메인으로 돌아가시겠습니까?")) {
            location.href = "../main/mainPg_Include.jsp"; // 메인 페이지로 이동
         }
      });
   });
</script>


<!-- 다음 우편번호 API 시작 -->
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 다음 우편번호 API 끝 -->
<script>
   function findPostcode() {
      new daum.Postcode({
         oncomplete : function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
               extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
               extraRoadAddr += (extraRoadAddr !== '' ? ', '
                     + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
               extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addr").value = roadAddr;
            document.getElementById("addrDetail").focus();

         }
      }).open();
   }
</script>

<%
ModifyInfoService mis = ModifyInfoService.getInstance();
String id = (String)session.getAttribute("UserId");
ModifyInfoDTO miDTO = new ModifyInfoDTO();
miDTO = mis.searchInfo(id);

pageContext.setAttribute("miDTO", miDTO);
pageContext.setAttribute("id",  id);

%>

<div class="character-wrap">
   <div class="title-line-box">

      <div class="title-text">내 정보 변경</div>

      <img src="${CommonURL}/images/poppy.png" class="title-character poppy">
      <img src="${CommonURL}/images/bibi.png" class="title-character bibi">
      <div class="title-cover-line"></div>
   </div>
</div>
<div id="joinWrap">
	
   <form name="joinFrm" id="joinFrm" action="modifyInfoProcess.jsp">
      <table id="joinFrmTd">
     	
         <!-- 아이디 -->
         <tr>
            <td class="joinTitle"><label for="user_id"><span
                  class="star">*</span>아이디</label></td>
            <td class="joinInput">
            <input type="text" id="user_id" name="user_id" class="inputBox" value="${id }" readonly>
              </td>
         </tr>

         <!-- 비밀번호 2칸 -->

         <!-- 이름 -->
         <tr>
            <td class="joinTitle"><label for="user_name"><span
                  class="star">*</span>이름</label></td>
            <td class="joinInput">
            <input type="text" readonly id="user_name" name="user_name" class="inputBox" value="${miDTO.name}"></td>
         </tr>

         <!-- 생년월일 -->
         <tr>
            <td class="joinTitle"><label for="birth"><span
                  class="star">*</span>생년월일</label></td>
            <td class="joinInput"><input type="date" id="birth"
               name="birth" class="inputBox" value="${miDTO.birth}"></td>
         </tr>

         <!-- 휴대폰 -->
         <tr>
            <td class="joinTitle"><label><span class="star">*</span>휴대폰</label>
            </td>
            <td class="joinInput phoneRow"><input type="text" id="phone1"
               name="phone1" class="inputMini" value="${miDTO.tel1 }" readonly />
             <input type="text" id="phone2" name="phone2" class="inputMini"
               maxlength="4" value="${miDTO.tel2 }" readonly> <input type="text" id="phone3" name="phone3"
               class="inputMini" maxlength="4" value="${miDTO.tel3 }" readonly></td>
         </tr>

         <!-- 이메일 -->
         <tr>
            <td class="joinTitle"><label><span class="star">*</span>이메일</label>
            </td>
            <td class="joinInput"><input type="text" name="email1"
               class="inputBox email" value="${miDTO.domain}"> @ <input type="text" list="domain"
               name="email2" class="inputBox email" value="${miDTO.tld}"> <datalist id="domain">
                  <option value="naver.com">
                  <option value="gmail.com">
                  <option value="daum.net">
                  <option value="hotmail.com">
               </datalist> 
            </td>
         </tr>

         <!-- 우편번호 -->
         <tr>
            <td class="joinTitle"><label><span class="star">*</span>우편번호</label>
            </td>
            <td class="joinInput"><input type="text" id="zipcode"
               name="zipcode" class="inputMini" readonly value="${miDTO.zipCode}">
               <button type="button" id="btnZipSearch" class="btnBox orange">우편번호
                  검색</button></td>
         </tr>

         <!-- 주소 2줄 -->
         <tr>
            <td class="joinTitle" rowspan="2"><label><span
                  class="star">*</span>주소</label></td>
            <td class="joinInput"><input type="text" id="addr" name="addr"
               class="inputBox wide" readonly value="${miDTO.addr}" ></td>
         </tr>

         <tr>
            <td class="joinInput"><input type="text" id="addrDetail"
               name="addrDetail" class="inputBox wide"
               placeholder="상세 주소를 입력해주세요." value="${miDTO.addrDetail}"></td>
         </tr>

      </table>

      <!-- 최하단 버튼 -->
      <div class="joinBtns">
         <button type="button" id="btnJoin" class="btnJoin">수정</button>
         <button type="button" id="btnCancel" class="btnCancel">취소</button>
      </div>
   </form>

</div>

