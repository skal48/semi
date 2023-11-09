<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="${product.productNo}번 게시글" name="title"/>
</jsp:include>
<style>

</style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성  다 작성하고 height 지우기!!!! -->
      

	  <h2 style="text-align: center;">게시글</h2>
	  <div>
	    <form id="frm_edit" method="post" action="${contextPath}/upload/modify.do">
	      <div>작성일 : ${product.createdAt}</div>
	      <div>수정일 : ${product.modifiedAt}</div>
	      <div>제목 : <input type="text" name="title" value="${product.productName}"></div>
	      <div>내용</div>
	      <div><textarea name="contents">${product.contents}</textarea></div>
	      <input type="hidden" name="productNo" value="${product.productNo}">
	      <c:if test="${sessionScope.user.userNo == product.userDto.userNo}">      
	        <button type="submit" id="btn_modify">수정</button>
	      </c:if>
	    </form>
	  </div>
	  
	  <hr>
	  
	  <!-- 첨부 추가 -->
	  <c:if test="${sessionScope.user.userNo == product.userDto.userNo}">  
	    <div>
	      <label for="files" class="form-label">첨부</label>
	      <input type="file" name="files" id="files" class="form-control" multiple>
	    </div>
	    <div class="d-grid gap-2 col-6 mx-auto">
	      <input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
	      <button type="button" class="btn btn-primary" style="margin: 32px;" id="btn_add_attach">첨부추가하기</button>
	    </div>
	  </c:if>
  
		       
      
      
      
      
      
      
      

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
  <script>
 
  
  
  </script>
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>