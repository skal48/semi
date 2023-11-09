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
      
      <style>
      h1{
    	  text-align: center;
      }
      
      
      
      </style>
      <body>
        <h1> 춘 하 추 동</h1>
      </body> 
       
     
     
      <div class = "top">
      </div>
      <a href = "${contextPath}/notice/write.form">
        <button type="button" class="admini_btn">공지사항 작성</button>
      </a>
      
      

  
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>