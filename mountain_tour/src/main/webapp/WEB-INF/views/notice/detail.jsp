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
   .wrap2{
  text-align: left;
  }
  
  .wrap3{
  height: 60px; 
 }
 
 .wrap4{
  height: 60px; 
 }
 
 .wrap5{
  height: 100px; 
 }
 
  <div class = "wrap5">
         <div class="box4"></div>
        </div>
        
        
  .form-control{
  width : 200px;
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
       
       
        <div class = "wrap1">
         <div class="box1"></div>
        </div>
       
       <div class = "wrap2">
       <h2>공지사항</h2>
       </div>
       <hr>
        
        <div class = "wrap3">
         <div class="box2"></div>
        </div>
         
        <button type="submit">수정</button>
        <button type="submit">삭제</button>
        
        
        <div class = "wrap4">
         <div class="box3"></div>
        </div>
        
    
      제목 <input type="text">
        
        
         <div class = "wrap5">
         <div class="box4"></div>
        </div>
        
        
       <p>
       내용 <textarea rows="5" cols="50"></textarea>
       </p>   
       
           <div class = "wrap6">
         <div class="box5"></div>
        </div>







    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  

 
 
 

<%@ include file="../layout/footer.jsp" %>