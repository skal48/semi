/**
* 아이디,비밀번호 찾기 페이지
*/

/* 함수 호출 */
$(() => {
  fnCheckName();
  fnCheckMobile();
  
})


/* 전역변수 선언 */
var namePassed = false;
var mobilePassed = false;


/* 함수 정의 */

const fnCheckName = () => {
  $('#name').blur((ev) => {
    let name = ev.target.value;
    let bytes = 0;
    for(let i = 0; i < name.length; i++){
      if(name.charCodeAt(i) > 128){  // 코드값이 128을 초과하는 문자는 한 글자 당 2바이트임
        bytes += 2;
      } else {
        bytes++;
      }
    }
    namePassed = (bytes <= 50);
    if(!namePassed){
      $('#msg_name').text('이름은 50바이트 이내로 작성해야 합니다.');
    }
  })
}

const fnCheckMobile = () => {
  $('#mobile').keyup((ev) => {
    ev.target.value = ev.target.value.replaceAll('-', '');
    // 휴대전화번호 검사 정규식 (010숫자8개)
    let regMobile = /^010[0-9]{8}$/;
    mobilePassed = regMobile.test(ev.target.value);
    if(mobilePassed){
      $('#msg_mobile').text('');
    } else {
      $('#msg_mobile').text('휴대전화번호를 확인하세요.');       
    }
  })
}

const fnJoin = () => {
  $('#frm_join').submit((ev) => {
    if(!emailPassed){
      alert('이메일을 인증 받아야 합니다.');
      ev.preventDefault();
      return;
    } else if(!pwPassed || !pw2Passed){
      alert('비밀번호를 확인하세요.');
      ev.preventDefault();
      return;
    } else if(!namePassed){
      alert('이름을 확인하세요.');
      ev.preventDefault();
      return;
    } else if(!mobilePassed){
      alert('휴대전화번호를 확인하세요.');
      ev.preventDefault();
      return;
    }
  })
}
 