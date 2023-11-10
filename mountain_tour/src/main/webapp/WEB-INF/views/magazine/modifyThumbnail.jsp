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
    .thumbnail { 
      margin: auto;     
      margin-top: 20px;
      width: 60%;
      height: 800px;
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
      margin-bottom: 10px;
      font-weight: 600;
      font-family: strong;
      font-size: 24px;
    }
  
   

</style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      <form class="thumbnail" style = "border: 1px gray solid;" >
		      <div class="big_picture" >사진</div>
		      <div class="big_title">summary</div>
          <textarea rows="10" cols="60"></textarea>
          <div>
		      <button type="submit" class="btn btn-secondary">완료</button>
          </div>
	    </form>
      




    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>