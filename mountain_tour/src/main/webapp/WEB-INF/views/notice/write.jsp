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
  .fs-1 {
  text-align : left;
  }

   .wrap1 > .box1{
  width : 100px;
  height : 80px;
  }  
  
  .title_top {
  text-align :left;
  }
  
  
  </style>
 
 
 
 
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
     
       <h1>춘 하 추 동</h1>
       <hr>
       
      <p class="fs-1">공지 사항</p>
      <hr>
      
      <div class = "wrap1">
         <div class="box1"></div>
        </div>
 
      <div>
       <label for ="title" class="title_top">제목</label>
       <input type="text" name="title" id="title" >
       </div>
      
      <div>
        <label for="contents" class="title_mid">내용</label>
        <textarea name="contents" id="contents"></textarea>
      <div>

    </div>
    </div>
    <div class="col-1">
    </div>
  </div>
</div>
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       



    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>