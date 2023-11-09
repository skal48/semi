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
<style>
.card {
    width: 1000px;
    margin: 30px auto;
    display: flex;
    flex-wrap: wrap;
   }
.admin_btn {
	display: flex;
 	justify-content: flex-end;
}
</style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성  다 작성하고 height 지우기!!!! -->
      <a href="${contextPath}/product/write.form">
      <button type="button" class="admin_btn">게시글 작성</button>
      </a>
      <div class="card" style="width: 18rem;">
  		<img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
  		<div class="card-body">
   		<h5 class="card-title">Card title</h5>
    	<p class="card-text">아직내용설명이없습니다.</p>
    	<a href="${contextPath}/product/detail.do">
    	<button type="button" class="btn btn-primary detail_btn">상세보기</button>
    	</a>
  		</div>
	  </div>
      <div class="card" style="width: 18rem;">
  		<img src="..." class="card-img-top" alt="...">
  		<div class="card-body">
   		<h5 class="card-title">Card title</h5>
    	<p class="card-text">아직내용설명이없습니다.</p>
    	<button type="button" class="btn btn-primary detail_btn">상세보기</button>
  		</div>
	  </div>
      <div class="card" style="width: 18rem;">
  		<img src="..." class="card-img-top" alt="...">
  		<div class="card-body">
   		<h5 class="card-title">Card title</h5>
    	<p class="card-text">아직내용설명이없습니다.</p>
    	<button type="button" class="btn btn-primary detail_btn">상세보기</button>
  		</div>
	  </div>
       
      
      
      
      
      
      
      

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
  <script>
  
  
  
  </script>
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>