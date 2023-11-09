<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">  
<link rel="shortcut icon" href="${contextPath}/resources/image/favicon.ico" type="image/x-icon">
<link rel="icon" href="${contextPath}/resources/image/favicon.ico" type="image/x-icon">
<title>${param.title == null ? '마운틴 투어' : param.title}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="${contextPath}/resources/css/init.css?dt=${dt}" />
<link rel="stylesheet" href="${contextPath}/resources/css/header.css?dt=${dt}" />
<link rel="stylesheet" href="${contextPath}/resources/css/main.css?dt=${dt}" />
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css?dt=${dt}" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/decoupled-document/ckeditor.js"></script> 
<!-- ck 에디터 쓸지 네이버 쓸지 정해야함  -->
</head>
<body>
  <div class="position-relative">
  
    <div class="banner">     
    </div>
    
    <div class="div_login position-absolute bottom-0 end-0">
      <span class="banner_login"><a href='#'>로그인</a></span>
      <span class="banner_join"><a href='#'>회원가입</a></span>

    </div>
  </div>
  
  
  <hr class="hr">
  <nav class="navbar navbar-expand-lg" id="nav" >
  <div class="container-fluid color" >
    <div class="collapse navbar-collapse justify-content-center" id="navbarColor01">
      <ul class="navbar-nav me-aouto">
        <li class="nav-item">
          <a class="nav-link" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/product/list.do">여행상품</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">매거진</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/cs/faqList.do">문의하기</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
  
  <div class="main_wrap"></div>
