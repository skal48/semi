<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="문의하기" name="title"/>
</jsp:include>

<style>
  .mainWrap {
  display: flex;
  }

  .listWrap1 {
    justify-content: center;
    width: 20%;
    border-right: 1px solid gray;
    margin-top: 50px;
    padding-bottom: 30px;
  }

  .listWrap1 a {
    color: #1a1a1a;
    font-size: large;
    font-weight: bold;
  }
  
  .listWrap1 .inquiry {
    text-decoration: underline;
    text-underline-position: under;
  }

  
  
  .listWrap2 {
    justify-content: center;
    width: 70%;
    margin: 30px auto;
    margin-top: 20%;
    
  }

  
</style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      
      
      
      <div class="mainWrap">
      
        <%-- 각 페이지로 이동가능한 목록 --%>
        <div class="listWrap1">
          <div class="faq">
            <a href="${contextPath}/cs/faqList.do" >자주 묻는 질문</a>
          </div>
          <div class="inquiry">
            <a href="${contextPath}/cs/inquiryList.do">1:1 문의하기</a>
          </div>
        </div>
        
        <%-- 자주묻는질문 목록이 표시될 div --%>
        <div class="listWrap2">
          <div>
            <span>총 ()개</span>
          </div>
          <div>
            <table border="1" class="table table-hover">
              <thead>
                <tr>
                  <th scope="col">문의번호</th>
                  <th scope="col">상품</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성자</th>
                  <th scope="col">작성일</th>
                  <th scope="col">답변여부</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</td>
                  <td >테스트1</td>
                  <td >테스트1</td>
                  <td >테스트1</td>
                  <td >테스트1</td>
                  <td >테스트1</td>
                </tr>
                <tr>
                  <th scope="row">2</td>
                  <td >테스트2</td>
                  <td >테스트2</td>
                  <td >테스트2</td>
                  <td >테스트2</td>
                  <td >테스트2</td>
                </tr>
                <tr>
                  <th scope="row">3</td>
                  <td >테스트3</td>
                  <td >테스트3</td>
                  <td >테스트3</td>
                  <td >테스트3</td>
                  <td >테스트3</td>
                </tr>
                <tr>
                  <th scope="row">4</td>
                  <td >테스트4</td>
                  <td >테스트4</td>
                  <td >테스트4</td>
                  <td >테스트4</td>
                  <td >테스트4</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        
      </div>









    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>