<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="${sessionScope.user.name}님의 문의작성" name="title"/>
</jsp:include>

<style>

  
</style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      
      
      <div>
        
        <form id="frm_write" method="post" action="${contextPath}/cs/addInquiry.do">
        
          <div class="form-floating">
            <select id="title" name="inquiryTitle" id="title" class="form-select" aria-label="Floating label select" style="margin-top: 10px;">
              <option value="기타문의">기타문의</option>
              <option value="여행문의">여행문의</option>
              <option value="예약문의">예약문의</option>
              <option value="결제문의">결제문의</option>
            </select>
            <label for="title" >제목선택</label>
          </div>
          
          <div class="form-floating">
            <select name="productNo" id="product" class="form-select" aria-label="Floating label select" style="margin-top: 10px;">
              <option value="0">선택안함</option>
              <c:forEach items="${productList}" var="p">
                <option value="${p.productNo}">${p.tripName}</option>
              </c:forEach>
            </select>
            <label for="product" >여행선택</label>
          </div>
          
          <div class="form-floating mb-3">
            <label for="name" class="form-label">작성자</label>
            <input type="text" value="${sessionScope.user.name}" id="name" readonly class="form-control-plaintext">
          </div>
          
          <div>
            <label for="contents" class="form-label">내용</label>
            <textarea name="inauiryContents" id="contents" class="form-control" placeholder="내용을 입력하세요" style="height: 500px"></textarea>
          </div>
          
          <div>
            <input type="hidden" name="userNo" value="${sesseionScope.user.userNo}">
            <button type="submit" class="btn btn-outline-success col-6" style="margin-top: 20px;">작성완료</button>
          </div>
          
        </form>
        
      </div>
      
      
      

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
<script>
  
  /* 전역변수 */
//  var contents = $('#contents').val();

  /* textarea 공백 체크 */  
//  const fnFrmWrite = () => {
//	$('#frm_write').submit((ev) => {
	 /*
	 	/  : 정규표현식의 시작
	 	\s : 공백 또는 탭
	 	|  : or
	 	g  : 문자열의 모든 문자 검색
	 	i  : 대소문자 무시
	 */
	 /* 만약 공백을 제외한 모든 문자열의 길이가 0이면 서브밋 방지 */
//	 if(contents.replace(/\s|　/gi, '').length == 0){
//		ev.preventDefault();
//        alert("문의 내용을 입력하세요.");
//		$('#contents').focus();
//        return;    
//	   }
//	})
//  }
  
  //fnFrmWrite();
  
</script>
 
 
 

<%@ include file="../layout/footer.jsp" %>