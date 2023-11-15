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

<div class="col-1">      
    </div>
    
    <div class = "temp"> 
    <c:forEach items="${heartList}" var="h" varStatus="vs"> 
    	<div>${beginNo - vs.index}</div>
    	<div>${h.userNo}</div>
    	<div>${h.productNo}</div>
   <!-- <div>${h.productNo.tripName}</div> --> 	
   <!-- <div>${h.productNo.tripContents}</div> --> 	
    </c:forEach>
    </div>


	

<%@ include file="../layout/footer.jsp" %>