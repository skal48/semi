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

  .col-8 > .qna_table{
  width: 500px;
  
  
  }
  
  
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
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
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
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${noticeList}"  var="n" varStatus="vs">
          <tr>
            
            <td>${beginNo - vs.index}</td>
            <td>
              <a href="${contextPath}/notice/detail.do?noticeNo=${n.noticeNo}">${n.title}</a>
            </td>
            <td>${n.createdAt}</td>
            <td>${n.modifiedAt}</td>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="5">${paging}</td>
        </tr>
       </tfoot> 
    </table>
    <div>
      <form method="get" action="${contextPath}/notice/search.do">
        <select name="column">
          <option value="TITLE">제목</option>
        </select>
        <input type="text" name="query" placeholder="검색어 입력">
        <button type="submit" class="btn btn-outline-primary">검색</button>
      </form>
    </div>
    
    
    
    
    
    
    
    
    
      
      </div>
      </div>
      </div>
      
      
      
      
      
      <script>

      
      </script>
      
      
      
      
      
      
      
      
      
      

    </div>
    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 

<%@ include file="../layout/footer.jsp" %>