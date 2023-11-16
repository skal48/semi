<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="dt" value="<%=System.currentTimeMillis() %>"/>

<jsp:include page="../layout/header.jsp">
  <jsp:param value="회원가입" name="title"/>
</jsp:include>

<script src="${contextPath}/resources/js/user_findid.js?dt=${dt}"></script>

<div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; " >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->

<form id="findForm" action="${contextPath}/user/findIdCheck" method="post">
	
	
	<!-- 아이디 찾기 : 이름 -->
	 <div class="row mb-2">
      <label for="inputname" class="col-sm-3 col-form-label">이름</label>
      <div class="col-sm-6"><input type="text" name="name" id="name" class="form-control"></div>
      <div class="col-sm-3"></div>
      <div align="center" class="col-sm-9 mb-3" id="msg_name"></div>
    </div>
    
    <div class="row mb-2">
      <label for="mobile" class="col-sm-3 col-form-label">휴대전화번호</label>
      <div class="col-sm-6"><input type="text" name="mobile" id="mobile" class="form-control"></div>
      <div class="col-sm-3"></div>
      <div align="center" class="col-sm-9 mb-3" id="msg_mobile"></div>
    </div>
    	
    
    
   
    <button type="submit" id="id-find" >아이디 찾기</button>
</form>



	 <div class="col-1">      
    </div>
	</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp" %>