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
    <div class="col-10" style = "border: 1px gray solid; height:3000px">
      <!--  여기다가 작성  다 작성하고 height 지우기!!!! -->
      <div class="row">
    	<div class="col-8" style="margin-top: 30px; margin-bottom: 30px;">
    	  <img alt="" src="https://github.com/skal48/portfolio/blob/main/seolark2.jpg?raw=true" width="500px" height="400px">
    	  <hr>
    	  <div style = "text-align: left;">[당일] 월간영월 12월 주천강 둘레길 트레킹 (강원/영월)</div>
    	  <div style = "text-align: right;">69,000<span class="css-5aoa4c">원</span></div>
    	  <div style = "border: 1px gray solid; height: 200px">
    	  
    	  
    	  
    	  
    	  
    	  </div>
    	  <div class="choice">상품선택</div>
    	  <div class="calender">
    	  <div style = "text-align: left; font-size:16px;">출발일 선택</div>
	    	 <div class="calender_mini">
	    	  
	    	 <div id="datepicker"></div>
	    	 
    
			

	    	  
	    	 </div>
    	  <div style = "text-align: left; font-size:16px; border: 1px gray solid; height: 300px">상품 선택</div>
    	  	 <div>
	    	  <div style="text-align: center;">
    <div style="display: inline-block; margin: 0px 120px;">
        <div>성인</div>
        <div>23000원</div>
    </div>
    <div style="display: inline-block; margin: 0px 120px;">
        <div>유아</div>
        <div>23000원</div>
    </div>
</div>
<table style="margin: 0;">
    <tr style="text-align:center;">
        <td></td>
        <td class="bseq_ea"></td>
        <td>
            <div style="margin: 10px 20px;">
                <button type="button" class="btn btn-dark" onclick="fnCalCount('m', this);">-</button>
                <input type="text" name="pop_out1" value="0" readonly="readonly" style="text-align:center; width: 200px;" />
                <button type="button" class="btn btn-dark" onclick="fnCalCount('p', this);">+</button>
            </div>
        </td>
        <td></td>
        <td class="bseq_ea"></td>
        <td>
            <div style="margin: 10px 20px;">
                <button type="button" class="btn btn-dark" onclick="fnCalCount('m', this);">-</button>
                <input type="text" name="pop_out2" value="0" readonly="readonly" style="text-align:center; width: 200px;" />
                <button type="button" class="btn btn-dark" onclick="fnCalCount('p', this);">+</button>
            </div>
        </td>
    </tr>
</table>
<div style="text-align: right;">
    <div style="display: inline-block; margin-right: 20px;">
        <div>총 금액</div>
        <div>
            <div>39,000<span>원</span></div>
        </div>
    </div>
    <a href="${contextPath}/reserve/write.form" style="display: inline-block;">
        <button type="button" class="btn btn-outline-success">예약하기</button>
    </a>
</div>
	    	  
	    	  
	    	  
	    	 </div>
    	  </div>
    	  <div class="choice">주요 여행일정</div>
    	    <div style = "border: 1px gray solid; height: 200px">
    	  
    	     
    	  
    	  
    	  
    	    </div>
    	  <div class="choice">상품정보</div>
    	    <div style = "border: 1px gray solid; height: 200px">
    	  
    	  
    	  
    	  
    	  
    	    </div>
    	  <div class="choice">약관/정보</div>
    	    <div style = "border: 1px gray solid; height: 100px">
    	  
    	  
    	  
    	  
    	  
    	    </div>
    	  
    	</div>   	   
    	<div class="col-4"> <!-- style="border-left: 2px solid gray;" -->
    	<form id="frm_btn" class="admin_btn">
	        <input type="hidden" name="productNo" value="${product.productNo}">
	        <a href="${contextPath}/product/edit.do">
	        <button type="button" id="btn_edit">편집</button> <!-- 관리자만 보이게 -->
	        </a>
	        <button type="button" id="btn_remove">삭제</button> <!-- 관리자만 보이게 -->
	  </form>
       <div>
	   <div id="side-bar" class="css-17dn726" style="position: sticky; top: 80px;">
	   <div class="css-wldo8h"><div class="css-a5xtki">
	   <div class="css-17dn726">
	   <div class="css-vurnku">
	   <div class="css-7nm51y">선택중인 행사</div>
	   <div class="css-jqbm3n">[당일] 월간영월 12월 주천강 둘레길 트레킹 (강원/영월)</div>
	   </div>
	   <hr class="css-8hwf4v">
	   <div class="css-mbxvxt">행사금액</div>
	   <div class="css-oxy8lg">
	   <div class="css-1xhmgr4">69,000<span class="css-5aoa4c">원</span></div>
	   </div>
	   <button class="btn btn-success" style="margin: 20px auto;">
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
    margin-top: 20px;
}
.calender{
  margin: 20px 20px;
}

.calender_mini {
  margin: 20px auto;
}
 
</style>
 

  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );

  function fnCalCount(type, ths){
      var $input = $(ths).siblings("input");
      var tCount = Number($input.val());
      
      if (type == 'p') {
          $input.val(Number(tCount) + 1);
      } else {
          if (tCount > 0) $input.val(Number(tCount) - 1);
      }
  }
  
  </script>

 





 
 

 

<%@ include file="../layout/footer.jsp" %>