<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="마운틴투어" name="title"/>
</jsp:include>

 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
  
    <div>
      <h2>예약내역상세</h2>
    </div>
    
    <div>
      <h4>예약상품정보</h4>
    </div>
  
    <div>
      <table>
        <colgroup>
          <col style="width:11%;">
          <col style="width:*;">
        </colgroup>
        <tr>
          <td>상품명</td>
          <td>${reserve.productDto.tripName}</td>
        </tr>
        <tr>
          <td>여행기간</td>
          <td>???~???</td>
        </tr>
        <tr>
          <td>소요시간</td>
          <td>${reserve.productDto.timetaken}</td>
        </tr>
        <tr>
          <td>총인원</td>
          <td>???명(버튼누르면 실제여행객 정보 보여주기?)</td>
        </tr>
        <tr>
          <td>픽업장소</td>
          <td>${reserve.pickupLoc}</td>
        </tr>
        <tr>
          <td>예약상태</td>
          <td>${reserve.reserveStatus}</td>
        </tr>
        <tr>
          <td>요청사항</td>
          <td>${reserve.request}</td>
        </tr>
        <tr>
          <td>주의사항</td>
          <td>${reserve.productDto.danger}</td>
        </tr>
        <tr>
          <td>결제금액</td>
          <td>???원(결제 여부?)</td>
        </tr>
      </table>
    </div>
    
    <div>
      <h4>예약자정보</h4>
    </div>
  
    <div>
      <table>
        <colgroup>
          <col style="width:11%;">
          <col style="width:*;">
        </colgroup>
        <tr>
          <td>이름</td>
          <td>${reserve.userDto.name}</td>
        </tr>
        <tr>
          <td>이메일</td>
          <td>${reserve.userDto.email}</td>
        </tr>
        <tr>
          <td>휴대폰번호</td>
          <td>${reserve.userDto.mobile}</td>
        </tr>
        <tr>
          <td>결제금액</td>
          <td>???원(결제 여부?)</td>
        </tr>
      </table>
    </div>
    
    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>