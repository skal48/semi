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
<style>
  .title{
    width: 60%;
    display: inline-block;
  }
  .title_wrapper {
    text-align: center;
  }
  
  .ck-editor__editable { 
      height: 400px;   
   }
  .ck-content { 
      font-size: 12px; 
   }
  .ck.ck-editor { 
        
   }
   .contents {
      width:60%;
      margin: auto;
      
   }
   p {
    margin-top: 15px;
   } 
   select {
    margin-top: 10px;
    width:20%;
    color: black;
   }
    
  </style>

  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
       <form action="${contextPath}/magazine/thumbnail.do" class="write_form" method="post">
      <div class="wrapper">   
        <h4>제목</h4>
       
        <div class="title_wrapper"><input type="text" id="title" name="title" class="title form-control mb-3" ></div>
      </div>
      <div class="contents">
        <h4>내용</h4>
               
          <textarea name="text" id="editor" class="input_contents"></textarea>
          <div>
              <select id="productNo" >                
                 <!-- <option disabled selected>상품 목록</option> -->
              </select>
          </div>
          <input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
          <p><button type="submit" class="btn btn-secondary">다음</button></p>        
      </div> 
      </form>     
     </div> 
      
    </div>
    <div class="col-1">
    </div>
  </div>
 
<script>
	const fnCkeditor = () => {
		ClassicEditor
		.create(document.querySelector('#editor'), {
			ckfinder: {
		          // 이미지 업로드 경로
		          uploadUrl: '${contextPath}/magazine/imageUpload.do'    		  
		    		}		
		})
		.then(editor => {
			
		})
		.catch(error => {
			 console.error(error);
		});
	}


  
  
  const fnProductNo = () => { 
	  $.ajax({
		  type: 'get',
		  url: '${contextPath}/magazine/getProductNo.do',
		  dataType: 'json',
		  success: (resData) => {
				$('#productNo').empty();
				  console.log('${list.ProductDto.productNo}');
			  $.each(resData.list, (i, product) => {
				  let str = '<option name="prodouctNo" value="${product.productNo}">${product.productNo}</option>';	//여기 고쳐야함 값이 안날라와
				  $('#productNo').append(str);
			  })
		  }
	  })
  }
  
  fnProductNo();
  fnCkeditor();
  
  
</script>
 
 
 

<%@ include file="../layout/footer.jsp" %>