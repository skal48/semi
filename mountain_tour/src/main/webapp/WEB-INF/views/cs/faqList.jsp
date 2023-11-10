<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="자주묻는질문" name="title"/>
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
  
  .listWrap1 .faq {
    text-decoration: underline;
    text-underline-position: under;
  }

  
  
  .listWrap2 {
    justify-content: center;
    width: 70%;
    margin: 30px auto;
    margin-top: 10%;
    
  }
  
</style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid;" >
      
      
      
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
          <div style="text-align: left;">총 ${total}개</div>
          <div>
            <table border="1" class="table table-hover">
              <thead>
                <tr>
                  <th scope="col">번호</th>
                  <th scope="col" >제목</th>
                </tr>
              </thead>
              <tbody id="faqList">
                <c:forEach items="${faqList}" var="f" varStatus="vs">
                  <tr>
                    <td>${beginNo - vs.index}</td>
                    <td style="text-align: left; padding-left: 25%">${f.title}</td>
                  </tr>
                </c:forEach>
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="2">${paging}</td>
                </tr>
              </tfoot>
            </table>
            <div>
              <form method="get" action="${contextPath}/cs/faqSearch.do">

                <select name="column">

                <select name="column" class="form-select-sm" style="height: 40px">

                  <option value="TITLE">제목</option>
                  <option value="CONTENTS">내용</option>
                  <option value="FAQ_NO">번호</option>
                </select>

                <input type="text" name="query" placeholder="검색어 입력">
                <button type="submit" >검색</button>

                <input type="text" name="query" class="form-control-sm" placeholder="검색어 입력" >
                <button type="submit" class="btn btn-outline-success" >검색</button>

              </form>
            </div>
          </div>
        </div>
        
      </div>




    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  



<script>



	
</script>












<%@ include file="../layout/footer.jsp" %>