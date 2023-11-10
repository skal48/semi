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
    .magazine {
      width: 60%;
      margin: auto;
    }
    h3 {
      margin-top: 40px;
      text-align: left;
      font-weight: 700;
      
    }
    .big_magazine {         
      height: 410px;
      margin-top:15px; 
    }    
    .big_picture {
      height: 270px;
      margin-bottom: 30px;
    }
    .big_title {
      text-align: left;
      margin-left: 40px;
      font-weight: 600;
      font-family: strong;
      font-size: 24px;
    }
    .big_date {
      margin-bottom: 15px;
      margin-left: 40px;
    }
    .big_hit {
      margin-bottom: 15px;
    }
    .small_magazine {      
      margin-top: 20px;
    }
    
    .small_picture {
      height: 200px;
    }
    .small_title {
      margin-top: 20px;
      font-weight: 600;
      font-family: strong;
      font-size: 24px;
    }
    .small_summary {
      margin: 10px;   
    }
    .small_summary {
    
    }
    .small_summary {
    
    }
  
  </style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      <div class="magazine">
        <h3>매거진</h3>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <button type="button" class="m_write btn btn-secondary">작성</button>
        </div>  
        
	      <div class="big_magazine" style = "border: 1px gray solid;" data-magazine_no="${magazine.magazineNo}">
		      <div class="big_picture" >사진</div>
		      <div class="big_title">title</div>
		       <span class="big_date position-absolute bottom-0 start-0">date</span>
           <span class="big_hit position-absolute bottom-0">조회수</span>
	      </div>
	      
	      <div class="small_magazine" style = "border: 1px gray solid;">
          <div class="row">
            <div class="col">
               <div class="small_picture" style = "border: 1px gray solid;">사진</div>
            </div>
            <div class="col">
              <div class="small_title">title</div>
    	        <div class="small_summary">summary</div>
    	        <span class="small_date position-absolute bottom-0 start-0">date</span>
              <span class="small_hit position-absolute bottom-0">조회수</span>
            </div>
          </div>
	      </div>       
   </div>
  </div> 
    <div class="col-1">
    </div>
 	 </div>
 </div>

<script>
	
  const fnMagazineWrite = () => {
  	$('.btn').click(() => {
  		location.href = '${contextPath}/magazine/write.form';  		
  	})
  }

  fnMagazineWrite();	


</script>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>