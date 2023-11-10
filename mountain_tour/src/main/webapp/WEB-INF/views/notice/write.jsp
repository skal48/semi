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
  
  
  .wrap1 > .box2{
  width : 100px;
  height : 80px;
  
  }
  
   .wrap1 > .box3{
  width : 100px;
  height : 80px;
  
  }
  
  
  .title_top {
  text-align :left;
  }
  
  
  .ck.ck-editor {
    max-width: 1000px;
  }
  .ck-editor__editable {
    min-height: 400px;
  }
  .ck-content {
    color: gray;
  }
  
  .form-contents{
    width: 800px;
    height: 200px;
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
 
      
      
      
      
      
      
      
      
      
      
      
      <div>

 
    
    <h1 style="text-align: center;">공지사항을 작성하세요</h1>
    
    <div>
      <label for="title">제목</label>
      <input type="text" name="title" id="title" class="form-control">
    </div>
    
    
    <div class = "wrap1">
        <div class="box2"></div>
       </div>
       
       
    <div>
      <label for="contents">내용</label>
      <input type="text" name="contents" id="contents" class="form-contents">
      <div id="toolbar-container"></div>
      <div id="ckeditor"></div>
    </div>
    
    <div class = "wrap1">
        <div class="box3"></div>
       </div>
       
    
    <div>
      <input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
      <button class="btn btn-primary col-12" type="submit">작성완료</button>
    </div>
    
  </form>

</div>


      
      
      
      
      
      
      
      
      
      
      
      

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