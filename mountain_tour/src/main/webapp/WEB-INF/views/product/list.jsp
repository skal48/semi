<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="마운틴투어" name="title"/>
</jsp:include>
<style>
.card {
    width: 1000px;
    margin: 30px auto;
    display: flex;
    flex-wrap: wrap;
   }
.admin_btn {
	display: flex;
 	justify-content: flex-end;
}
</style>
 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성  다 작성하고 height 지우기!!!! -->
      <a href="${contextPath}/product/write.form">
      <button type="button" class="admin_btn" style="margin-left: auto;">게시글 작성</button>
      </a>
      <div style="display: flex; justify-content: space-between; align-items: center;">
	  <div style="display: inline-block;"> 
	    00개의 상품
	  </div>
      <div class="btn-group btn-group-sm" role="group" aria-label="Small button group" style="display: inline-block;">
		  <button type="button" class="btn btn-outline-dark">추천순</button>
		  <button type="button" class="btn btn-outline-dark">인기순</button>
		  <button type="button" class="btn btn-outline-dark">리뷰순</button>
	  </div>
	  </div>
	  <hr>
     <div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">아직 내용 설명이 없습니다.</p>
                    <a href="${contextPath}/product/detail.do">
                        <button type="button" class="btn btn-primary detail_btn">상세보기</button>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <!-- 두 번째 카드의 내용 -->
                <img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">아직 내용 설명이 없습니다.</p>
                    <a href="${contextPath}/product/detail.do">
                        <button type="button" class="btn btn-primary detail_btn">상세보기</button>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" style="width: 18rem;">
                <!-- 세 번째 카드의 내용 -->
                <img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">아직 내용 설명이 없습니다.</p>
                    <a href="${contextPath}/product/detail.do">
                        <button type="button" class="btn btn-primary detail_btn">상세보기</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- 나머지 행의 카드들을 추가 -->
        <div class="card" style="width: 18rem;">
                <!-- 세 번째 카드의 내용 -->
                <img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">아직 내용 설명이 없습니다.</p>
                    <a href="${contextPath}/product/detail.do">
                        <button type="button" class="btn btn-primary detail_btn">상세보기</button>
                    </a>
                </div>
            </div>
        <div class="card" style="width: 18rem;">
                <!-- 세 번째 카드의 내용 -->
                <img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">아직 내용 설명이 없습니다.</p>
                    <a href="${contextPath}/product/detail.do">
                        <button type="button" class="btn btn-primary detail_btn">상세보기</button>
                    </a>
                </div>
            </div>
        <div class="card" style="width: 18rem;">
                <!-- 세 번째 카드의 내용 -->
                <img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">아직 내용 설명이 없습니다.</p>
                    <a href="${contextPath}/product/detail.do">
                        <button type="button" class="btn btn-primary detail_btn">상세보기</button>
                    </a>
                </div>
            </div>
        <div class="card" style="width: 18rem;">
                <!-- 세 번째 카드의 내용 -->
                <img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">아직 내용 설명이 없습니다.</p>
                    <a href="${contextPath}/product/detail.do">
                        <button type="button" class="btn btn-primary detail_btn">상세보기</button>
                    </a>
                </div>
            </div>
        <div class="card" style="width: 18rem;">
                <!-- 세 번째 카드의 내용 -->
                <img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">아직 내용 설명이 없습니다.</p>
                    <a href="${contextPath}/product/detail.do">
                        <button type="button" class="btn btn-primary detail_btn">상세보기</button>
                    </a>
                </div>
            </div>
        <div class="card" style="width: 18rem;">
                <!-- 세 번째 카드의 내용 -->
                <img src="../../resources/image/mountain1.jpg" class="card-img-top" alt="Mountain Image">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">아직 내용 설명이 없습니다.</p>
                    <a href="${contextPath}/product/detail.do">
                        <button type="button" class="btn btn-primary detail_btn">상세보기</button>
                    </a>
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
//새로운 카드를 추가하는 함수
  function addNewCard() {
      const cardContainer = document.getElementById('cardContainer');
      const cardRow = document.getElementById('cardRow');
      
      // 새로운 카드의 내용을 추가
      const newCard = document.createElement('div');
      newCard.className = 'col-md-4';
      newCard.innerHTML = `
          <div class="card" style="width: 18rem;">
              <!-- 새로운 카드의 내용 -->
          </div>
      `;
      
      // 현재 카드 행에 새로운 카드 추가
      cardRow.appendChild(newCard);

      // 추가된 카드가 container를 벗어나는 경우, 새로운 row 추가
      if (cardRow.offsetWidth + newCard.offsetWidth > cardContainer.offsetWidth) {
          const newRow = document.createElement('div');
          newRow.className = 'row';
          newRow.id = 'cardRow';
          newRow.appendChild(newCard);
          cardContainer.appendChild(newRow);
      }
  }

  // 예시로 몇 개의 카드를 초기에 추가
  for (let i = 0; i < 6; i++) {
      addNewCard();
  }

  
  
  </script>
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>