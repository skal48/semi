<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp">
  <jsp:param value="마운틴투어" name="title"/>
</jsp:include>

 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      <div class="subtitle_wrap">
        <h4>예약하기</h4>
      </div>
      <div>상품정보</div>
      <div>
        <table>
          <colgroup>
            <col style="width:100px;">
            <col style="width:*;">
          </colgroup>
          <tbody>
            <tr>
              <td>상품명</td>
              <td>상품명삽입예정</td> <!-- 상품명이 들어가야함 -->
            </tr>
            <tr>
              <td>일정</td>
              <td>
                <div>
                  출발일
                </div>
                <div>
                  도착일
                </div>
              </td> 
            </tr>      
          </tbody>
        </table>
      </div>
      
    <!-- 예약자 정보 -->  
    <form>
      <div>
        <h4>예약자 정보</h4>
      </div>
      <div>
        <table>
          <colgroup>
            <col style="width:100px;">
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
    
    <!-- 요금 및 여행인원 -->
    <form id="frm_price">
      <div>
        <h4>요금 및 여행인원</h4>
      </div>
      <table>
        
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
            <td>얼마</td>
            <td>얼마</td>
            <td>
              <select name="adultCnt">
                <c:forEach></c:forEach>
              </select>
            </td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>
    </form>  
    
    <!-- 여행자 정보 -->
    <form id="frm_tourist">
    
    </form>  
      
      







    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>