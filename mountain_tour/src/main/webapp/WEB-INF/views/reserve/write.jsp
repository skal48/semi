<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp">
  <jsp:param value="예약" name="title"/>
</jsp:include>

 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 100%;" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      <div id="contents">
        <div class="subtitle_wrap">
          <h2>예약하기</h2>
        </div>
        <hr>
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
                    도착일 : 
                    <span>??</span>
                  </div>
                </td> 
              </tr>      
            </tbody>
          </table>
        </div>
        
        <hr>
        
        <!-- 예약자 정보 -->  
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
                  <td>로그인한 회원이름</td> <!-- 로그인한 회원의 이름 -->
                </tr>
                <tr>
                  <td>연락처</td>
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
        </form>      
        
        <hr>
        <!-- 요금 및 여행인원 -->
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
                  <td>???</td>
                  <td>???</td>
                  <td>
                    <select name="adultCnt">
                      <option value="0">0명</option>
                      <option value="1">1명</option>
                      <option value="2">2명</option>
                      <option value="3">3명</option>
                      <option value="4">4명</option>
                      <option value="5">5명</option>
                    </select>
                  </td>
                  <td>
                    <select name="childCnt">
                      <option value="0">0명</option>
                      <option value="1">1명</option>
                      <option value="2">2명</option>
                      <option value="3">3명</option>
                      <option value="4">4명</option>
                      <option value="5">5명</option>
                    </select>
                  </td>
                  <td>
                    계산된 합계금액????
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
                  <option value="0">0명</option>
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                </select>
              </li>
              <li>
                <span>영등포역</span>
                <select name="personCnt" class="select">
                  <!-- 총 명수만큼 생성되어야 함(반복문) -->
                  <option value="0">0명</option>
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                </select>
              </li>
            </ul>
          </div>
        </form>  
          
        <hr>  
        <!-- 결제정보 -->
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
                    <input type="radio" name="opt1" id="opt1">
                    <label for="opt1">무통장입금</label>
                    <br>
                    <span>[입금자명]</span>
                    <input type="text" name="depositNm" id="depositNm">
                    <input type="checkbox" name="sameResName" id="sameResName">
                    <label for="sameResName">예약자와 동일</label>
                    <br>
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
        <!-- 약관 동의 -->
        <div class="agreeFrom">
          <h4>약관 동의</h4>
        </div>
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
        <div>
          <span>
            <input type="checkbox" id="chkAll">
            <label for="chkAll">모든 약관에 동의합니다.</label>
          </span>
        </div>
        
        
      </div>

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 



<script>
	var optNum = 0;
	
</script> 
 
 
 

<%@ include file="../layout/footer.jsp" %>