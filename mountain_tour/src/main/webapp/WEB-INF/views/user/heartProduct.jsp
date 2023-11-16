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
    <div>${HeartDto.userNo}</div>
      <div>${HeartDto.productNo}</div>
      <div>${HeartDto.tripName}</div>
      <div>${HeartDto.tripContents}</div>
    </c:forEach>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script>
  
  // 페이지 로딩 시 호출
    $(document).ready(function() {
        fnLove();
    });

    // Ajax 함수 정의
    const fnLove = () => {
        $.ajax({
            type: 'get',
            url: '${contextPath}/user/getHeartList.do',
            dataType: 'json',
            success: (resData) => {
                // Clear existing data in the table
                $('#table').empty();

                // 결과 데이터를 테이블에 추가
                $.each(resData, function(index, h) {
                    $('#table').append('<div>' + HeartDto.userNo + '</div>');
                    $('#table').append('<div>' + HeartDto.productNo + '</div>');
                    $('#table').append('<div>' + HeartDto.tripName + '</div>');
                    $('#table').append('<div>' + HeartDto.tripContents + '</div>');
                });
            },
            error: (error) => {
                console.error('error:', error);
            }
        });
    }
  </script>
</body>
	

<%@ include file="../layout/footer.jsp" %>