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

  .wrap1 > .box1{
  width : 100px;
  height : 100px;
  
  }


</style>

 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
     
       <h1>공지 사항</h1>
   <hr>
 
     
      <div id="container">
    <div id="contents">
      <div class="subTitWrap">
        <h2 class="subTit" style="min-height: 25px;"></h2>
      </div>

      <div class="list-group">
        <a href="#" class="list-group-item list-group-item-action active" aria-current="true">고객센터</a>
        <a href="#" class="list-group-item list-group-item-action">공지사항</a>
        <a href="#" class="list-group-item list-group-item-action">자주 묻는 질문</a>
      </div>
      
      <div class = "wrap1">
        <div class="box1"></div>
      </div>
      
      
      <div class="container text-center">
  <div class="row">
    <div class="col">
      Column
    </div>
    <div class="col">
      Column
    </div>
    <div class="col">
      Column
    </div>
  </div>
</div>
      
      
      
      
      
      
      


    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>