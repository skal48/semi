<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />
<jsp:include page="../layout/header.jsp">
  <jsp:param value="예약" name="title"/>
</jsp:include>

 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 100%;" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      
      
      
      <!-- <a href="${contextPath}/reserve/detail.do?resDate=20231111">예약</a> -->
      
      
      
      <div id="contents">
        <div class="subtitle_wrap">
          <h2>예약하기</h2>
        </div>
        <hr>
        <button type="button" onclick="location.href='javascript:history.back()'">이전으로</button>
        <div>
          <h4>상품정보</h4>
        </div>
        <div>
          <table>
            <colgroup>
              <col style="width:100px;">
              <col style="width:*;">
            </colgroup>
            <tbody>
              <tr>
                <td>상품명</td>
                <td>?????</td> <!-- 상품명이 들어가야함 -->
              </tr>
              <tr>
                <td>일정</td>
                <td>
                  <div>
                    출발일 : 
                    <span>??</span>
                  </div>
                  <div>
                    소요시간 : 
                    <span>??</span>
                  </div>
                </td> 
              </tr>      
            </tbody>
          </table>
        </div>
        
        <hr>
        
        <!-- 예약 정보 -->
        <!-- 받아올 정보 : userNo, productNo -->  
        <form id="frm_res_user" name="frmResUser" method="post">
          <div>
            <h4>예약자 정보</h4>
          </div>
          <div>
            <table>
              <colgroup>
                <col style="width:11%;">
                <col style="width:*;">
              </colgroup>
              <tbody>
                <tr>
                  <td>예약자명</td>
                  <td>${sessionScope.user.name}</td> <!-- 로그인한 회원의 이름 -->
                </tr>
                <tr>
                  <td>연락처</td>
                  <td>
                    <span>${sessionScope.user.mobile}</span>
                  </td>
                </tr>
                <tr>
                  <td>예비연락처</td>
                  <td>
                    <div class="phone_number">
                      <select class="select" name="resMobile1" id="resMobile1">
                        <option value="">선택</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                      </select>
                      <input type="text" class="inpMob" name="resMobile2" id="resMobile2" maxlength="4">
                      <input type="text" class="inpMob" name="resMobile3" id="resMobile3" maxlength="4">
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>요청사항</td>
                  <td>
                    <textarea class="textarea" name="resReq" id="resReq" cols="30" rows="10" placeholder="좌성배정 불가능"></textarea>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
          <input type="hidden" name="productNo" value="${productNo}">
        </form>      
        
        <hr>
        <!-- 요금 및 여행인원 -->
        <!-- ajax으로 여행자 정보 생성 -->
        <form id="frm_price" name="frmPrice" method="post">
          <div>
            <h4>요금 및 여행인원</h4>
          </div>
          <div>
            <table>
              <colgroup>
                <col>
                <col style="width:11%;">
                <col style="width:11%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:14%;">
              </colgroup>
              <thead>
                <tr>
                  <th>요금구분</th>
                  <th>성인요금</th>
                  <th>소아요금</th>
                  <th>성인인원</th>
                  <th>소아인원</th>
                  <th>합계</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td></td>
                  <td id="adultPrice">39000</td> <!-- 상품가격 -->
                  <td id="childPrice">39000</td> <!-- 성인요금에서 금액변동 적용하기 -->
                  <td>
                    <select name="adultCnt">
                      <c:forEach var="cnt" begin="0" end="20" step="1"> <!-- end값으로 product.person(최대인원수) 적용하기 -->
                        <option class="adtCnt" value="${cnt}">${cnt}명</option>
                      </c:forEach>
                    </select>
                  </td>
                  <td>
                    <select name="childCnt">
                      <c:forEach var="cnt" begin="0" end="10" step="1"> <!-- end값으로 product.person(최대인원수) 적용하기 -->
                        <option class="cldCnt" value="${cnt}">${cnt}명</option>
                      </c:forEach>
                    </select>
                  </td>
                  <td>
                    <span id="totalPriceOne">
                    <!-- 계산된 총 금액 -->
                    
                    </span>
                    원
                  </td>
                </tr>
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="3">총계</td>
                  <td>
                    <span id="adultCntVal">?</span>명
                  </td>
                  <td>
                    <span id="childCntVal">?</span>명
                  </td>
                </tr>
              </tfoot>
            </table>
          </div>
        </form>  
        
        <hr>
        <!-- 여행자 정보 -->
        <!-- 요금 및 여행인원 ajax 생성 폼 -->
        <form id="frm_tourist" name="frm_tourist" method="post">
        
          <div>
            <div>
              <h4>여행자 정보</h4>
            </div>
            <table>
              
              <thead>
                <tr>
                  <th>구분</th>
                  <th>이름</th>
                  <th>생년월일</th>
                  <th>성별</th>
                  <th>연락처</th>
                </tr>
              </thead>
              <tbody id="inp_tourist">
                <!-- 여행인원 선택시 선택한만큼 추가되어야 함 -->
                <tr>
                  <td>
                    <span>성인??소아??</span>
                    <span class="ageNum">몇번째??</span>
                  </td> 
                  <td>
                    <input type="text" name="touristName" maxlength="10">
                  </td>
                  <td>
                    <input type="date" name="birthDate" max="9999-12-31">
                  </td>
                  <td>
                    <select name="gender">
                      <option value="">선택</option>
                      <option value="M">남</option>
                      <option value="F">여</option>
                    </select>
                  </td>
                  <td> 
                    <input type="text" class="inpMob" name="tourContact1" id="tourContact1" style="width: 32%;" maxlength="4">
                    <input type="text" class="inpMob" name="tourContact2" id="tourContact2" style="width: 32%;" maxlength="4">
                    <input type="text" class="inpMob" name="tourContact3" id="tourContact3" style="width: 32%;" maxlength="4">
                  </td>
                </tr>
              </tbody>
            </table>      
          </div>
        </form>
        
        <hr>
        <!-- 픽업장소 선택 -->
        <form id="frm_pickup" name="frmPickup" method="post">
          <div>
            <h4>승차장소 선택</h4>
          </div>
          <div>
            총<span class="total">?</span>명
          </div>
          <div>
            <ul>
              <li>
                <span>서울역</span>
                <select name="personCnt" class="select">
                  <!-- 총 명수만큼 생성되어야 함(반복문) -->
                  <c:forEach var="cnt" begin="0" end="10" step="1"> <!-- end값으로 위에서 선택한 총 명수 적용하기 -->
                    <option class="totCnt" value="${cnt}">${cnt}명</option>
                  </c:forEach>
                </select>
              </li>
              <li>
                <span>영등포역</span>
                <select name="personCnt" class="select">
                  <!-- 총 명수만큼 생성되어야 함(반복문) -->
                  <c:forEach var="cnt" begin="0" end="10" step="1"> <!-- end값으로 위에서 선택한 총 명수 적용하기 -->
                    <option class="totCnt" value="${cnt}">${cnt}명</option>
                  </c:forEach>
                </select>
              </li>
            </ul>
          </div>
        </form>  
          
        <hr>  
        
  
        <!-- 약관 동의 -->
        <div class="agreeFrom">
          <h4>약관 동의</h4>
        </div>
        <form id="frm_agree" name="frmAgree" method="post">
          <div>
            <table>
              <tbody>
                <tr>
                  <td>
                    <div>
                      <span>
                        <input type="checkbox" id="chkAgree" name="chkAgree" value="0">
                        <label for="chkAgree">개인정보 수집에 동의합니다(필수)</label>
                      </span>
                    </div>
                  </td>
                  <td>
                    <a href="#" >자세히</a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </form>
        
        <div>
          <span>
            <input type="checkbox" id="chkAll">
            <label for="chkAll">모든 약관에 동의합니다.</label>
          </span>
        </div>
        <div>
          <button type="button" id="btn_reserve">예약하기</button>
          <button type="button" onclick="location.href='${contextPath}/reserve/list.do'">예약목록</button>
        </div>
        
        <hr>
        
        <!-- 결제정보 -->
        <!-- 따로 구현 -->
        <div>
          <form id="frm_pay" name="frmPay" method="post">
            <div>
              <h4>결제정보</h4>
            </div>
            <table>
              <colgroup>
                <col style="width:13%;">
                <col style="width:*;">
              </colgroup>
              <tbody>
                <tr>
                  <th>총 여행인원</th>
                  <td>
                    성인 : 
                    <span>?</span>
                     명 / 소아 : 
                    <span>?</span>
                     명
                  </td>
                </tr>
                <tr>
                  <th>결제방식</th>
                  <td>
                    <input type="radio" name="opt1" id="deposit">
                    <label for="deposit">무통장입금</label>
                    <input type="radio" name="opt1" id="card">
                    <label for="card">카드결제</label>
                    <br>
                    
                    <div>
                      <span>[입금자명]</span>
                      <input type="text" name="depositNm" id="depositNm">
                      <input type="checkbox" name="sameResName" id="sameResName">
                      <label for="sameResName">예약자와 동일</label>
                    </div>
                    <div>
                      <!-- 카드결제버튼? -->
                    </div>
                    
                    <span>[입금정보]</span>
                    (구디)1111-111-11, (예금주)주식회사 마운틴투어 
                  </td>
                </tr>
                <tr>
                  <th>최종결제가격</th>
                  <td>
                    <span id="totalPrice">?</span>
                    원
                  </td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>
        
        <hr>
        
      </div>

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 



<script>
	// insertReserve 필요한 데이터
	// frm_res_user : userNo,productNo 'hidden', resReq
	// frm_pickup : pickupLoc, reservePerson(총예약인원수)
	// frm_agree : chkAgree
	
	function fnReserve(){
  	  $("#btn_reserve").click(function(e) {
        e.preventDefault(); // 기본 제출 동작을 막습니다.
      
        var userData = $("#frm_res_user").serialize();
        var pickupData = $('#frm_pickup').serialize();
        var agreeDate = $('frm_agree').serialize();
        var formData = userData + "&" + pickupData + "&" + agreeData;
        
        $.post('${contextPath}/reserve/addReserve.do', formData)
          .done(function(response) {
            // 요청이 성공적으로 완료된 후의 동작을 여기에 작성합니다.
            alert('예약등록 성공');
          })
          .fail(function() {
            // 요청이 실패한 경우의 동작을 여기에 작성합니다.
            alert('예약실패');
          });
      });
	}
		
	//  요금 옵션 선택시 총금액, 총인원수 반영
	function fnChangeTotalPrice(){
	  $(document).ready(function() {
        $('select[name="adultCnt"], select[name="childCnt"]').change(function() {
          var adultCount = parseInt($('select[name="adultCnt"]').val());
          var childCount = parseInt($('select[name="childCnt"]').val());
          
          var adultPrice = parseInt($('#adultPrice').text());
          var childPrice = parseInt($('#childPrice').text());
          
          var totalPrice = (adultCount * adultPrice) + (childCount * childPrice);
          $('#totalPriceOne').text(totalPrice);
          $('#adultCntVal').text(adultCount);
          $('#childCntVal').text(childCount);
        });
      });
	}
	
	
	
	
	
	
	
	fnChangeTotalPrice();
    	
</script> 
 
 
 

<%@ include file="../layout/footer.jsp" %>