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

 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
     
      <div>
        <h1> 제목: ${notice.title}</h1>
        <div>내용: ${notice.contents}</div>
        <div>작성일 : ${notice.createdAt}</div>
        <div>수정일 : ${notice.modifiedAt}</div>
        <div>조회수 : ${notice.hit}</div>
        <div> ${notice.noticeNo}</div>
        <div>
          <form id="frm_btn" method="post">
            <input type="hidden" name="noticeNo" value="${notice.noticeNo}">
            <input type="hidden" name="title" value="${notice.title}">
            <input type="hidden" name="contents" value="${notice.contents}">
            <button type="button" id="btn_edit">편집</button>
            <button type="button" id="btn_remove">삭제</button>
          </form>
        </div>       
      </div>






      <script>
      	var frmBtn = $('#frm_btn');
      	
     
      const fnEditNotice = () => {
        $('#btn_edit').click(() => {
      	  frmBtn.attr('action', '${contextPath}/notice/edit.form');
          frmBtn.submit();
      	})
      }
      
      const fnRemoveNotice = () => {
    	  $('#btn_remove').click(() => {
      	  if(confirm('블로그를 삭제하면 모든 댓글이 함께 삭제됩니다. 삭제할까요?')){
      		frmBtn.attr('action', '${contextPath}/notice/remove.do');
      		frmBtn.submit();
      	  }
    		  
    	  })
      }
      	
      
      fnEditNotice();
      fnRemoveNotice();
      
      </script>


  
  
  
  
  
  
  
  
  
    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  

 
 
 

<%@ include file="../layout/footer.jsp" %>