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
  .ck-editor__editable { 
      height: 400px;      
   }
  .ck-content { 
      font-size: 12px; 
   }
  .ck.ck-editor { 
    
   }
   .contents {
      width: 60%; 
      margin: auto;
   }
  
    
    
  </style>

  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
       <form action="${contextPath}/magazine/thumbnail.do" method="get">
      <div>   
        <h4>제목</h4>
       
        <input type="text" id="title" name="title" >
      </div>
      <div class="contents justify-content-center">
        <h4>내용</h4>
               
          <textarea name="text" id="editor" class="input_contents"></textarea>
          <p><input type="submit" value="다음"></p>
        
      </div> 
      </form>     
     </div> 
      
    </div>
    <div class="col-1">
    </div>
  </div>

  
 
  
<script>
  ClassicEditor.create( document.querySelector( '#editor' ) );
</script>
 
 
 

<%@ include file="../layout/footer.jsp" %>