<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="dt" value="<%=System.currentTimeMillis() %>"/>

<jsp:include page="../layout/header.jsp">
  <jsp:param value="마운틴투어" name="title"/>
</jsp:include>
<style>
.menu {
  text-align : center;
}
</style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
     
      <div id="container">
    <div id="contents">
      <div class="subTitWrap">
        <h2 class="subTit" style="min-height: 25px;"></h2>
      </div>

      <div id="lnbWrap" class ="menu">
        <ul class="lnb">
          <li>
            <a href="#">고객센터</a>
            <div class="sub">
              <ul>
                <li><a href="/customer/notice">공지사항</a></li>
                <li><a href="/customer/faq">자주묻는 질문</a></li>
                <li><a href="/customer/awards">수상갤러리</a></li>
                <!-- <li><a href="/customer/review">여행후기</a></li> -->
                <li><a href="/customer/consult">견적문의</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>




    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>