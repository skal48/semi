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

 <meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
    .table-container {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr; /* 3개의 열로 나누기 */
      gap: 10px; /* 열 사이의 간격 설정 */
    }

    .table-container > div {
      border: 1px solid #dddddd;
      padding: 8px;
      text-align: center;
    }
  </style>
</head>
<body>

  <div class="col-1"></div>

  <div class="temp table-container" id="table">
    <c:forEach items="${heartList}" var="h" varStatus="vs">
      
      <div>${h.userNo}</div>
      <div>${h.productNo}</div>
    </c:forEach>
  </div>

</body>

<script>
//전역변수 
var page = 1;
var totalPage = 0;
var heartList = resData.heartList;


const fnLove = () => {
  $.ajax({
    //요청
    type: 'get',
    url: '${contextPath}/user/getHeartList.do',
    data: 'page=' + page,
    //응답 
    dataType: 'json',
    success: (resData) => {
      totalPage = resData.totalPage;


      
      $.each(heartList, function (index, h) {
        var userNo = h.userNo;
        var productNo = h.productNo;

       
        console.log('회원번호:', userNo);
        console.log('상품번호:', productNo);

        $('#table').append('<div>' + userNo + '</div>');
        $('#table').append('<div>' + productNo + '</div>');
      });

     
    },
    error: (error) => {
      console.error('error:', error);
    }
  });
}

</script>
	

<%@ include file="../layout/footer.jsp" %>