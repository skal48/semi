<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="회원 비밀번호 변경" name="title"/>
</jsp:include>

<script>
  
  /* 함수 호출 */
  $(() => {
    fnCheckPassword();
    fnCheckPassword2();
    fnModifyPassword();
    fnModifyResult();
  })
  
  
  /* 전역변수 선언 */
  var pwPassed = false;
  var pw2Passed = false;
  
  
  /* 함수 정의 */
  
  const fnCheckPassword = () => {
    $('#pw').keyup((ev) => {
      let pw = $(ev.target).val();
      // 비밀번호 : 8~20자, 영문,숫자,특수문자, 2가지 이상 포함
      let validPwCount = /[A-Z]/.test(pw)          // 대문자가 있으면   true
                       + /[a-z]/.test(pw)          // 소문자가 있으면   true
                       + /[0-9]/.test(pw)          // 숫자가 있으면     true
                       + /[^A-Za-z0-9]/.test(pw);  // 특수문자가 있으면 true
      pwPassed = pw.length >= 8 && pw.length <= 20 && validPwCount >= 2;
      if(pwPassed){
        $('#msg_pw').text('사용 가능한 비밀번호입니다.');
      } else {
        $('#msg_pw').text('비밀번호는 8~20자, 영문/숫자/특수문자를 2가지 이상 포함해야 합니다.');       
      }
    })
  }
  
  const fnCheckPassword2 = () => {
    $('#pw2').blur((ev) => {
      let pw = $('#pw').val();
      let pw2 = ev.target.value;
      pw2Passed = (pw !== '') && (pw === pw2);
      if(pw2Passed){
        $('#msg_pw2').text('');
      } else {
        $('#msg_pw2').text('비밀번호 입력을 확인하세요.');
      }
    })
  }
  
  const fnModifyPassword = () => {
    $('#frm_modify_pw').submit((ev) => {
      if(!pwPassed || !pw2Passed){
        alert('비밀번호를 확인하세요.');
        ev.preventDefault();
        return;
      }
    })
  }
  
  const fnModifyResult = () => {
	let modifyPwResult = '${modifyPwResult}';
	if(modifyPwResult !== ''){
	  if(modifyPwResult === '1'){
		alert('${userNo.name}'회원의 비밀번호가 변경되었습니다.);
	  } else {
		alert('${userNo.name}'회원의 비밀번호가 변경되지 않았습니다..);
	  }
	}
  }
 
</script>

 
  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10" style = "border: 1px gray solid; height: 1200px" >
      <!--  여기다가 작성 다 작성하고 height 지우기!!!! -->
      
      <div>

        <form id="frm_modify_pw" method="post" action="${contextPath}/user/modifyMemberPw.do">
          
          <h1>비밀번호 변경하기</h1>
            
          <div>
            <label for="pw">비밀번호</label>
            <input type="password" name="pw" id="pw">
            <span id="msg_pw"></span>
          </div>
          
          <div>
            <label for="pw2">비밀번호 확인</label>
            <input type="password" id="pw2">
            <span id="msg_pw2"></span>
          </div>
          
          <div>
            <input type="hidden" name="userNo" value="${userNo}">
            <button type="submit">비밀번호변경하기</button>
          </div>
          
        </form>
    
      </div>

      
      

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
  
 
 
 
 
 

<%@ include file="../layout/footer.jsp" %>