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
        <h2>예약내역목록</h2>
      </div>
      <div>
        <table>
          <colgroup>
            <col style="width:30%;">
            <col style="width:15%;">
            <col style="width:15%;">
            <col style="width:15%;">
            <col style="width:10%;">
            <col style="width:15%;">
          </colgroup>
          <thead>
            <tr>
              <th>예약날짜/예약번호</th>
              <th>상품명</th>
              <th>결제금액</th>
              <th>인원</th>
              <th>여행일정</th>
              <th>예약상태</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${reserveList}" var="res" varStatus="vs">
              <tr>
                <td id="resSche">${r.reserveDate}</td> 
                <td id="prodName">${r.productDto.tripName}</td>
                <td id="totalPrice">??</td>
                <td id="personCnt">${r.reservePerson}</td>
                <td id="trvlSche">${r.reserveStart} / ${r.reserveFinish}</td>
                <td id="resStatus">${r.reserveStatus}</td>
              </tr>
            </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="6">${paging}</td>
            </tr>
          </tfoot>
        </table>
      </div>
      <hr>
      <button type="button" onclick="location.href='${contextPath}/product/list.do'">다른상품 예약하러가기</button>
      

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  

 
 

<%@ include file="../layout/footer.jsp" %>