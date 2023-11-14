<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />
<jsp:include page="../layout/header.jsp">
  <jsp:param value="${product.productNo}번 상품" name="title"/>
</jsp:include>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>여행상품</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );

  </script>
</head>
<body>


  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height:4000px">
      <!--  여기다가 작성  다 작성하고 height 지우기!!!! -->
      <div class="row">
    	<div class="col-8" style="margin-top: 30px; margin-bottom: 30px;">
    	  <div class="text-center">
			<img src="https://github.com/skal48/portfolio/blob/main/seolark2.jpg?raw=true" class="rounded" alt="..."  width="500px" height="400px">
		  </div>
    	  <hr>
    	  <c:if test="${sessionScope.user.auth == 0}">
    	   <form id="frm_btn" method="post">
    	   	  <input type="hidden" name="productNo" value="${product.productNo}">
    	   	  <input type="hidden" name="tripName" value="${product.tripName}">
    	   	  <input type="hidden" name="price" value="${product.price}">	    	
    	   	  <input type="hidden" name="plan" value="${product.plan}">	    	
    	   	  <input type="hidden" name="tripContents" value="${product.tripContents}">
    	   	  <input type="hidden" name="guide" value="${product.guide}">
    	   	  <input type="hidden" name="timetaken" value="${product.timetaken}">
    	   	  <input type="hidden" name="danger" value="${product.danger}">
    	   	  <input type="hidden" name="termUse" value="${product.termUse}">
	    	  <button type="button" id="btn_edit">편집</button> <!-- 관리자만 보이게 -->
	    	  <button type="button" id="btn_remove">삭제</button> <!-- 관리자만 보이게 -->
	       </form>
    	  </c:if>    	  
    	  
    	  
    	  
    	  
    	 <div style="text-align: left;">
			 <span class="badge text-bg-success">단순코스</span>
			 <span class="badge text-bg-warning">난이도하</span>
			 <span class="badge text-bg-secondary">트레킹</span>
		 </div>
    	  <div class="choice">상품선택</div>
    	  <div class="calender">
    	  <div style = "text-align: left; font-size:16px;">출발일 선택</div>
	    	 <div class="calender_mini">
	    	  <div class="row">
			    <div class="col">
			      <div id="datepicker"></div>
			    </div>
			    <div class="col" style = "border: 1px gray solid;">
			      예약이 가능해요!<br>
			      인원수를 정해주시고<br>
			      예약하기를 클릭해주세요!
			    </div>
			  </div>
	    	 
    
			

	    	  
	    	 </div>
	      <div style="text-align: left; font-weight: bold; color: red;">상품 선택</div>
    	  <div style = "text-align: left; font-size:16px; border: 1px red solid; height: 150px">
    	  
    	  <span class="badge text-bg-dark" style="margin: 10px">예약가능</span>
    	  <div style="margin: 10px">
	    	  <div>${product.tripName}상품</div>
			  <div>예약가능인원수</div>
		      <div>현재예약</div>
    	  </div>
    	  
    	  
    	  
    	  
    	  
    	  
    	  
    	  
    	  
    	  </div>
	    <div> 
	   
	    
	    
		 
		
		<div style="text-align: right;">

		    <a style="display: inline-block; margin-top: 20px">
		        <button type="button" id="btn_reserve" class="btn btn-outline-success">예약하기</button>
		    </a>
		</div>
	    	  
	    	  
	    	  
	    	 </div>
    	  </div>
    	  <div class="choice">주요 여행일정</div>
    	    <div style = "border: 1px gray solid; height: 200px">
    	  	${product.plan} 
 	     </div>
    	  <div class="choice">상품정보</div>
    	    <div style = "border: 1px gray solid; height: 200px">
    	  	${product.tripContents} 
    	    </div>
    	    
    	    <div class="choice">소요시간</div>
    	    <div style = "border: 1px gray solid; height: 100px">
    	  	${product.timetaken}
    	    </div>
    	    <div class="choice">가이드</div>
    	    <div style = "border: 1px gray solid; height: 100px">
    	  	${product.guide}
    	    </div>
    	    <div class="choice">주의사항</div>
			<div style = "border: 1px gray solid; height: 100px">
    	  	${product.danger}
    	    </div>
    	    
    	    
    	    
    	    
    	  <div class="choice">약관/정보</div>
    	    <div style = "border: 1px gray solid; height: 100px">	  
    	    ${product.termUse}
    	    </div>
    	
	    <div class="choice">리뷰</div> 
	 	<form class="mb-3" name="myform" id="myform" method="post">
		<fieldset>
			<span class="text-bold"> ❤️ 별점을 선택해주세요</span>
			<input type="radio" name="reviewStar" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="reviewStar" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="reviewStar" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="reviewStar" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="reviewStar" value="1" id="rate5"><label
				for="rate5">★</label>
		</fieldset>
			<div>
				<textarea class="col-auto form-control" type="text" id="reviewContents"
						  placeholder="행복했던 여행후기를 남겨보세요🙂"></textarea>   <!-- 예약한사람만 보이게 -->
			</div>
		 </form>	
	    
    <div style="overflow: hidden;">
	    <strong class="tit mid" style="float: left;">여행후기</strong> 
	    <div style="height: 100px; float: right;">
	        <select class="form-select form-select-sm mb-3 h-50 d-inline-block" style="width: 120px;" aria-label=".form-select-sm example">
	            <option value="1" selected>최신순</option>
	            <option value="2">별점순</option>
	        </select>
	    </div>
	</div>

	    
	    
			
	
	
	    <div class="accordion accordion-flush" id="accordionFlushExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
		        콩이아빠님의 후기
		      </button>
		    </h2>
		    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">가이드가 별로였어요.. 드라이빙 가이드라고 해서 운전기사도 해주시고 가이드도 해주시는데 타지에서 온 관광객에게 그 지역에 대해 설명도 안해주고 도착하면 몇시까지만 오시면 됩니다~ ...</div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
		        콩이엄마님의 후기
		      </button>
		    </h2>
		    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">코로나때문에 여행을 못하다가 이번 친구랑 같이 가서 너무 즐겁게 지내다 왔어요 .</div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
		        콩이언니님의 후기
		      </button>
		    </h2>
		    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
		      <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
		    </div>
		  </div>
		</div>
	   
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    		
    	</div>   	
    	   
    	<div class="col-4"> <!-- style="border-left: 2px solid gray;" -->
       <div>
	   <div style="position: sticky; top: 80px;">
	   <div><div class="css-a5xtki">
	   <div>
	   <div>
	   <div>선택중인 행사</div>
	   <div>${product.tripName}</div>
	   </div>
	   <hr>
	   <div>행사금액</div>
	   <div>
	   <div>${product.price}원</div>
	   </div>
	   <button class="btn btn-success"  style="margin: 20px auto;">
	   <div>
	   <div style="color: white;">찜하기♥</div>
	   </div>
	   </button>
	   </div>
	   </div>
	   </div>
	   </div>
	  </div>
    	</div>  	

  	  </div>
	  

	  	
		       
      
      
      
      
      
      
      

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
 
</body>
</html>
<style>
.admin_btn {
	display: flex;
 	justify-content: flex-end;
}
.choice{
    box-sizing: border-box;
    margin: 0px 0px 28px;
    min-width: 0px;
    line-break: anywhere;
    font-size: 20px;
    letter-spacing: -0.02em;
    line-height: 30px;
    font-weight: 700;
    border-top: 1px solid rgb(25, 25, 25);
    border-bottom: 1px solid rgb(237, 237, 237);
    width: 100%;
	text-align: left;
    justify-content: space-between;
    background: rgb(251, 251, 251);
    padding: 8px 16px;
    margin-top: 80px;
}
.calender{
  margin: 20px 20px;
}

.calender_mini {
  margin: 20px auto;
}
 
 
 
 
 
 
 #myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
</style>
 

  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );

  
  
  var frmBtn = $('#frm_btn');
  
  const fnEditProduct = () => {
    $('#btn_edit').click(() => {
      frmBtn.attr('action', '${contextPath}/product/edit.do');
      frmBtn.submit();
    })
  }

  const fnRemoveProduct = () => {
      $('#btn_remove').click(() => {
        if(confirm('상품을 삭제할까요?')){
          frmBtn.attr('action', '${contextPath}/product/remove.do');
          frmBtn.submit();          
        }
      })
    }
  
  
  function fnGoReserve(){
      $('#btn_reserve').click(function(){
         location.href='${contextPath}/reserve/write.form?productNo=${product.productNo}&resDate=' + $("#datepicker").val();
      })
   }
  
  
  
  
  
  fnGoReserve();
  fnEditProduct();
  fnRemoveProduct();
  
  </script>

 





 
 

 

<%@ include file="../layout/footer.jsp" %>