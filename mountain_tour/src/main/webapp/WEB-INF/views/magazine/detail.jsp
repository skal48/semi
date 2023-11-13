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
  .wapper {
   
   
  }
  .btn_wrapper{
    text-align: right;
  }
  .btn {    
    margin: 15px;
  }
  h1 {
    font-size: 55px;
  }
  .date_hit {
    text-align: right;
    margin-right: 20px; 
    margin-bottom: 90px;
  }
  .date_hit > span {
    margin-right: 20px;
  }
 .contents {
    width: 80%;
    margin: auto;
 }
 .btn_like {
    border: none;
    background-color: white;
    margin-top: 70px;   
 }
 .like_num {
    color: gray;
 }
 
 </style>
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      <div class="wapper">
	      <div class="btn_wrapper">
	        <button type="button" class="goDelete btn btn-secondary">삭제</button>
	        <button type="button" class="goModify btn btn-secondary">수정</button>
	      </div>
	      <div>
	        <h1>title</h1>
	        <div class="date_hit">
		        <span>2023년 11월 12일</span>
		        <span>조회수   40</span>
	        </div>
	        <div class="contents">본문</div>
	        <div class="like">
	          <button type="button" class="btn_like"><i class="fa-regular fa-thumbs-up fa-bounce fa-2xl" style="color: #1f753d;"></i></button>
	          <div class="like_num">좋아요수 </div> 
	        </div>
	      </div>
      </div>
      <!-- 좋아요 누르면  <i class="fa-solid fa-thumbs-up fa-2xl" style="color: #1f753d;"></i> 이거로 바뀌어야함-->


    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
<script>
  const fnModify = () => {
	  $('.goModify').click(() => {
		  location.href = '${contextPath}/magazine/modify.do';
	  })	  
  }
  
  const fnDelete = () => {
	  $('.goDelete').click(() => {
		  location.href = '${contextPath}/magazine/delete.do';
	  })
  }
  
  fnModify();
  fnDelete();
  
  
</script>
 
 
 
 

<%@ include file="../layout/footer.jsp" %>