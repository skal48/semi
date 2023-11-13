<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="${inquiry.inquiryNo}번 문의" name="title"/>
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
      
        <h2> ${inquiry.inquiryTitle}</h2>
        <div>문의상품: ${inquiry.productDto.tripName}</div>
        <div>조회수: ${inquiry.hit}</div>
        <div>작성일: <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy/MM/dd" /></div>
        <div>작성자: ${inquiry.userDto.name}</div>
        <div>내용: ${inquiry.inquiryContents}</div>
        
        <div id="answer">답변 나타낼곳</div>
        
        <div>
          <form method="post" action="${contextPath}/cs/removeInquiry.do" id="frm_removeInquiry">
            <input type="hidden" name="inquiryNo" value="${inquiry.inquiryNo}">
            <button type="submit">삭제하기</button>
          </form>
        </div>
        
        
        <div>
        
          <!-- 로그인 구현되면 이프문 안에 폼 가두기 -->
          <c:if test="${sessionScope.user.auth == 0}">
            <form method="post" action="${contextPath}/cs/addAnswer.do">
              <div>
                <textarea rows="10" cols="50" name="inauiryContents" placeholder="답변을 작성하세요."></textarea>
              </div>
              <input type="hidden" name="inquiryNo" value="${inquiry.inquiryNo}"> 
              <button type="submit">작성완료</button>
            </form>
          </c:if>
            
        </div>
        
        
        <div>
          <a href="${contextPath}/cs/inquiryList.do">목록보기</a>
        </div>
        
        
        
      </div>









    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 


<script>

  const fnDelete = () => {
  	  $('#frm_removeInquiry').submit((ev) => {
  	    if (!confirm('문의글을 삭제하면 답변 확인이 불가능합니다. 삭제하시겠습니까?')) {
  	      ev.preventDefault(); 
  	      return;
  	    }
  	  });
  	};
  
  
  
  fnDelete();

	
</script>


 
 
 

<%@ include file="../layout/footer.jsp" %>