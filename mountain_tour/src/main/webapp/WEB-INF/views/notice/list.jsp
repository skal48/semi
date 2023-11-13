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

  .wrap1 > .box1{
  width : 100px;
  height : 80px;
  }

 .wrap1 > .box2{
  width : 100px;
  height : 80px;
  
  }
  
   .wrap1 > .box3{
  width : 100px;
  height : 80px;
  
  }
  .qna_table{
  width: 600px;
  }
  
  .search {
  position: relative;
  width: 300px;
}

input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}


img {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
  margin: 0;
  }

</style>

 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 800px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
       
       
       
       
       
       
       <h1>춘 하 추 동</h1>
       <hr>
       
        <div class = "wrap1">
         <div class="box1"></div>
        </div>
      
      
       <div>
      <a href="${contextPath}/notice/write.form">
        <button type="button" class="btn btn-primary">새글작성</button>
      </a>
     </div>
     


      
      
       
       
       
       <div class = "wrap1">
        <div class="box2"></div>
       </div>
      
        
        <div class="search">
  <input type="text" placeholder="검색어 입력">
  <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
</div>
      
      <div class = "wrap1">
        <div class="box3"></div>
       </div>
      



      <div class="container text-center">
      <div class="row">
      <div class="col-4">
      <ul class="list-group">
      <li class="list-group-item active" aria-current="true">공지사항</li>
      <li class="list-group-item">자주 묻는 질문</li>
      <li class="list-group-item">고객센터</li>
      </ul>
      
      </div>
      <div class="col-8">
      
      
    <table border="1" class="qna_table">
      <thead>
        <tr>
          <td>공지번호</td>
          <td>제목</td>
          <td>작성일</td>
          <td>수정일</td>
          <td>조회수</td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>5</td>
          <td>이용후기</td>
          <td>23/11/10</td>
          <td>99/12/12</td>
          <td>20</td>
        </tr>
        <tr>
          <td>4</td>
          <td>게시판이용문의</td>
          <td>23/11/10</td>
          <td>99/12/11</td>
          <td>15</td>
        </tr>
        <tr>
          <td>3</td>
          <td>가입인사</td>
          <td>23/11/10</td>
          <td>99/12/10</td>
          <td>7</td>
        </tr>
        <tr>
          <td>2</td>
          <td>[필독]게시판이용안내</td>
          <td>23/11/10</td>
          <td>99/12/09</td>
          <td>94</td>
        </tr>
      </tbody>
      <tfoot>
        <tr>
          <td>1</td>
          <td>[긴급]공지사항</td>
          <td>23/11/10</td>
          <td>99/12/08</td>
          <td>85</td>
        </tr>
      </tfoot>
    </table>
      
      </div>
      </div>
      </div>
      
      
      
      
      <script>
      const fnTemp = () => {
	  $('.qna_table').click(() => {
		  location.href = '${contextPath}/notice/detail.do';
	  })
  }
      
      fnTemp();  
      
     </script>
     
   
      
      
      
      
      
      
      
      

    </div>
    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 

<%@ include file="../layout/footer.jsp" %>