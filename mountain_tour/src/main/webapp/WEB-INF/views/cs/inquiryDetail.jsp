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
        <div>작성일: <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy/MM/dd" /></div>
        <div>작성자: ${inquiry.userDto.name}</div>
        <div>내용: ${inquiry.inquiryContents}</div>
        
        <div>
          <form method="post" action="${contextPath}/cs/removeInquiry.do" id="frm_removeInquiry">
            <input type="hidden" name="inquiryNo" value="${inquiry.inquiryNo}">
            <button type="submit">문의삭제</button>
          </form>
        </div>
        
        
        <div>
          <%-- 회원이 답변을 확인하는 곳 --%>
          <c:if test="${sessionScope.user.auth eq 1}">
            <textarea rows="10" cols="50" readonly>${answer.contents}</textarea>
          </c:if>
        
          <%-- 관리자가 답변 (확인/작성/수정/삭제)하는 곳 --%>
          <c:if test="${sessionScope.user.auth eq 0}">
            <form id="frm_answer" method="post" >
              <div>
                <textarea rows="10" cols="50" name="contents" placeholder="답변을 작성하세요.">${answer.contents}</textarea>
              </div>
              <input type="hidden" name="inquiryNo" value="${inquiry.inquiryNo}"> 
              <input type="hidden" name="answerNo" value="${answer.answerNo}">
              <input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
              <button type="button" id="btn_add_answer">답변작성</button>
              <button type="button" id="btn_modiy_answer">답변수정</button>
              <button type="button" id="btn_delete_answer">답변삭제</button>
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

  /* 문의글 삭제 취소시 서브밋 방지 */ 
  const fnDeleteInquiry = () => {
    $('#frm_removeInquiry').submit((ev) => {
      if (!confirm('문의글을 삭제하면 답변 확인이 불가능합니다. 삭제하시겠습니까?')) {
        ev.preventDefault(); 
        return;
      }
    });
  };
  
  
  
  /* 답변 작성 버튼 클릭 시 서브밋 */
  const fnAddAnswer = () => {
    $('#btn_add_answer').click(() => {
      let answerContents = "${answer.contents}";

      // 이미 작성된 답변이 있다면 서브밋 방지
      if (answerContents.trim() !== '') {
          alert('이미 작성된 답변이 존재합니다.');
          return;
      }
      // 작성된 데이터가 없다면 서브밋 수행
      $('#frm_answer').attr('action', '${contextPath}/cs/addAnswer.do');
      $('#frm_answer').submit(); // 폼 제출
    });
  };
  
  /* 답변 수정 버튼 서브밋 */
  const fnModifyAnswer = () => {
	$('#btn_modiy_answer').click(() => {
      $('#frm_answer').attr('action', '${contextPath}/cs/modifyAnswer.do');
      $('#frm_answer').submit(); 
	})
  }
  
  /* 답변 삭제 버튼 서브밋 */
  const fnDeleteAnswer = () => {
	$('#btn_delete_answer').click(() => {
      if(!confirm('답변을 삭제하시겠습니까?')){
  		return;
  	  }
      $('#frm_answer').attr('action', '${contextPath}/cs/removeAnswer.do');
      $('#frm_answer').submit(); 
	})
  }
  
  /* 답변 등록 시 전달되는 데이터 확인 */
  const fnAddAnswerResult = () => {
	let addAnswerResult = '${addAnswerResult}';
	if(addAnswerResult !== ''){
	  if(addAnswerResult === '1'){
		alert('답변이 등록되었습니다.');
	  } else {
		alert('답변이 등록되지 않았습니다.');
	  }
	}
  }
  
  /* 답변 수정 시 전달되는 데이터 확인 */
  const fnModifyAnswerResult = () => {
	let modifyAnswerResult = '${modifyAnswerResult}';
	if(modifyAnswerResult !== ''){
	  if(modifyAnswerResult === '1'){
		alert('답변이 수정되었습니다.');
	  } else {
		alert('답변이 수정되지 않았습니다.');
	  }
	}
  }
  
  /* 답변 삭제 시 전달되는 데이터 확인 */
  const fnRemoveAnswerResult = () => {
	let removeAnswerResult = '${removeAnswerResult}';
	if(removeAnswerResult !== ''){
	  if(removeAnswerResult === '1'){
		alert('답변이 삭제되었습니다.');
	  } else {
		alert('답변이 삭제되지 않았습니다.');
	  }
	}
  }
  
  
  
  /* 호출 */
  fnDeleteInquiry();
  fnAddAnswer();
  fnModifyAnswer();
  fnDeleteAnswer();
  fnAddAnswerResult();
  fnModifyAnswerResult();
  fnRemoveAnswerResult();
	
</script>


 
 
 

<%@ include file="../layout/footer.jsp" %>