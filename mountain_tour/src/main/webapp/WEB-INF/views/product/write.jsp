<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="마운틴투어상품게시글작성" name="title"/>
</jsp:include>
<style>
      .ck-editor__editable { height: 400px; }
      .ck-content { font-size: 12px; }
</style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 2500px" >
      <!--  여기다가 작성  다 작성하고 height 지우기!!!! -->
      
	  
	 <div class="row">
	    <form method="post" action="${contextPath}/product/add.do" enctype="multipart/form-data">
    	<div class="col-8" style="margin-top: 30px; margin-bottom: 30px;">
    	  <div class="text-center">
			<img src="https://github.com/skal48/portfolio/blob/main/seolark2.jpg?raw=true" class="rounded" alt="..."  width="500px" height="400px">
		  </div>
    	  <hr>
    	  <div style = "text-align: left;">
    	   <div>
	        <label for="title" class="form-label">제목</label>
	        <input type="text" name="title" id="title" class="form-control">
	       </div>
	      </div>
    	  <div style = "text-align: right;">
    	  <div>
	        <label for="prize" class="form-label">가격</label>
	        <input type="text" name="prize" id="prize" class="form-control">
	      </div>
	      </div>


    	  <div class="mb-3">
    	  <div class="choice">주요 여행일정</div>
    		<label for="tripContents" class="form-label"></label>
 		    <textarea class="form-control" id="tripContents" name="tripContents" rows="10"></textarea>
    	  </div>
    	  
    	  <div>
    	  <div class="choice">상품정보</div>
    	    <label for="contents">내용</label>
			<textarea name="contents" id="contents"></textarea>
            <div id="toolbar-container"></div>
            <div id="ckeditor"></div>
    	  </div>
    	    
    	  
    	  
    	</div>   	   
    	<div class="col-4"> <!-- style="border-left: 2px solid gray;" -->
       <div>
	   <div style="position: sticky; top: 80px;">
	   <div><div>
	   <div>
	   <div>
	   <div>
	   	<div>
	        <label for="title" class="form-label">제목</label>
	        <input type="text" name="title" id="title" class="form-control">
	       </div>
	    </div>
	   </div>
	   <hr>
	   <div>행사금액</div>
	   <div>
	   <div>
	   <div>
	        <label for="prize" class="form-label">가격</label>
	        <input type="text" name="prize" id="prize" class="form-control">
	   </div>
	   </div>
	   </div>
	   </div>
	   </div>
	   </div>
	   </div>
	  </div>
    	</div>  	
    	</form>
  	  </div>

    </div>
	  
	    <div class="d-grid gap-2 col-6 mx-auto">
	      <input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
	      <button type="submit" class="btn btn-primary" style="margin: 32px;">작성완료</button>
	    </div>

    </div>
    <div class="col-1">
    </div>
  </div>

  
   <script>
      ClassicEditor.create( document.querySelector( '#contents' ) );
      
      
      const fnCkeditor = () => {
    	  DecoupledEditor
          .create(document.getElementById('ckeditor'), {
        	  ckfinder: {
              // 이미지 업로드 경로
              uploadUrl: '${contextPath}/blog/imageUpload.do'    		  
        		}
      	  })
          .then(editor => {
            const toolbarContainer = document.getElementById('toolbar-container');
            toolbarContainer.appendChild(editor.ui.view.toolbar.element);
          })
          .catch(error => {
            console.error(error);
          });
      }
      
      
      
      
      
      
      fnCkeditor();
      
      
      
      
	</script>
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>