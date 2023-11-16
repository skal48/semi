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

  <div class="temp table-container">
    <c:forEach items="${heartList}" var="h" varStatus="vs">
      <div>${beginNo - vs.index}</div>
      <div>${h.userNo}</div>
      <div>${h.productNo}</div>
    </c:forEach>
  </div>

</body>
  



	

<%@ include file="../layout/footer.jsp" %>