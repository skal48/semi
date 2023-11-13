<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="마운틴투어" name="title"/>
</jsp:include>
<style>
  .card {
      width: 18rem;
      margin-bottom: 20px;
  }

  .admin_btn {
      display: flex;
      justify-content: flex-end;
  }
</style>

<div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style="border: 1px gray solid; height: 1500px">
      <a href="${contextPath}/product/write.form">
        <button type="button" class="admin_btn" style="margin-left: auto;">게시글 작성</button>
      </a>
      <div style="display: flex; justify-content: space-between; align-items: center;">
        <div style="display: inline-block;"> 
          00개의 상품
        </div>
        <div class="btn-group btn-group-sm" role="group" aria-label="Small button group" style="display: inline-block;">
          <button type="button" class="btn btn-outline-dark">추천순</button>
          <button type="button" class="btn btn-outline-dark">인기순</button>
          <button type="button" class="btn btn-outline-dark">리뷰순</button>
        </div>
      </div>
      <hr>

      <div class="container">
        <div class="row" id="product_list"> <!-- Added id attribute -->
          <!-- Product cards will be appended here -->
        </div>
      </div>

    </div>
    <div class="col-1">
    </div>
  </div>
</div>

<script>
//전역 변수
var page = 1;
var totalPage = 0;

const fnGetProductList = () => {
  $.ajax({
    // 요청
    type: 'get',
    url: '${contextPath}/product/getList.do', // Use the correct URL
    data: 'page=' + page,
    // 응답
    dataType: 'json',
    success: (resData) => {  
      totalPage = resData.totalPage;
      $.each(resData.productList, (i, product) => {
        let str = '<div class="col-md-4">';
        str += '<div class="card">';
        str += '<img src="' + product.imagePath + '" class="card-img-top" alt="Product Image">'; // Assuming there is an "imagePath" property in the product data
        str += '<div class="card-body">';
        str += '<h5 class="card-title">' + product.tripName + '</h5>';
        str += '<p class="card-text">' + product.tripContents + '</p>';
        str += '<a href="' + '${contextPath}/product/detail.do?productNo=' + product.productNo + '" class="btn btn-primary">상세보기</a>';
        str += '</div>';
        str += '</div>';
        str += '</div>';
        $('#product_list').append(str);
      })
    }
  })
}


  fnGetProductList();
</script>

<%@ include file="../layout/footer.jsp" %>
