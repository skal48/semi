<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="상품/예약관리" name="title"/>
</jsp:include>

<style>

  .listWrap1 {
    background-color: lavender;
    position: fixed;
    top: 400px;
    left: 100px;
  }
  .listWrap1 a {
    color: #1a1a1a;
    text-size: 30px;
  }
  
  
  .listWrap2 {
    background-color: LavenderBlush;

    
  }
  
</style>

 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      
      <div>
        <a href="${contextPath}/manage/memberList.do">회원 관리</a>
        <a href="${contextPath}/manage/productList.do">상품/예약</a>
        <a href="${contextPath}/manage/reviewList.do">리뷰 관리</a>
      </div>

      
      

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>