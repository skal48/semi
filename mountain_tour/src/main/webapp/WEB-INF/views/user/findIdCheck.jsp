<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="dt" value="<%=System.currentTimeMillis() %>"/>

<form id="findForm" action="${contextPath}/user/" method="post">
	<div class="form-group">
    	<input type="text" name="name" id="name" placeholder="이름">
    </div>
    <div class="form-group">
    	<input type="email" name="email" id="email" placeholder="이메일">
    </div>
    <button type="submit" id="id-find" onclick="findSubmit(); return false;">아이디 찾기</button>
</form>

<%@ include file="../layout/footer.jsp" %>