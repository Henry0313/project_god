function searchPost() {

  new daum.Postcode({

      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var fullAddr = ''; // 최종 주소 변수
          var extraAddr = ''; // 조합형 주소 변수

          // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              fullAddr = data.roadAddress;

          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              fullAddr = data.jibunAddress;
          }

          // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
          if(data.userSelectedType === 'R'){
              //법정동명이 있을 경우 추가한다.
              if(data.bname !== ''){
                  extraAddr += data.bname;
              }
              // 건물명이 있을 경우 추가한다.
              if(data.buildingName !== ''){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
              fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
          }

          // 3단계 : 해당 필드들에 정보 입력
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('memberZip').value = data.zonecode; //5자리 새우편번호 사용
          document.getElementById('memberAddr').value = fullAddr;
      }

  }).open();

}; //

$(function() {  
	   
    // 이메일 중복 점검 플래그 : 기존 검증된 정보이므로 true 설정
    var emailCheckFlag = true;
    // 연락처 중복 점검 플래그 : 기존 검증된 정보이므로 true 설정
    var phoneCheckFlag = true;
    
    var passwordFlag = true;
    
    // 이메일 중복 점검
    $("#memberEmail").blur(function() {
       
        console.log("이메일 중복점검");
       
        // 정규식 점검으로 유효 데이터 전송
        var regexEmail = new RegExp($("#memberEmail").attr("pattern"));
        var memberEmail = $("#memberEmail").val();
 
        if (regexEmail.test(memberEmail)) { // 정규식 점검 통과
       
            $.ajax({
                 url : rootPath + '/member/email_check.do',
                 type : 'post',
                 dataType:'text',
                 data : {
                     memberId : $('#memberId').val(),
                     memberEmail : $('#memberEmail').val()
                 },
                 success : function(data) {
                   
                    console.log("이메일 중복 점검 수신 !");
                   
                    // 중복 점검 체크 플래그 재설정
                    if (data.trim() == '사용할 수 있는 이메일입니다.') {
                       // 메시지 초기화 : 정상적일 경우는 메시지 표기 불필요할 경우
                       $("#memberEmail_err").text(data);
                       emailCheckFlag = true;
                    } else {
                       $("#memberEmail_err").text(data);
                       emailCheckFlag = false;
                    }
                   
                    // 플래그 인쇄
                    console.log("emailCheckFlag : "+ emailCheckFlag);
                    console.log("phoneCheckFlag : "+ phoneCheckFlag);
                   
                }, // success
                 
                 error : function(xhr, status) {
                    console.log(xhr+" : "+status); // 에러 코드
                }
     
            }); // ajax
   
        } else { // 정규식 점검 실패
           
            // 에러 메시징
            $("#memberEmail_err").text(($("#memberEmail").attr("title")));
            // 재입력 대기
            $("#memberEmail").focus();
        } //
       
    });
    
    $("[id^=memberPhone]").blur(function(){
    	
    	var phone = 
    	$("#memberPhone1").val()+"-"+
    	$("#memberPhone2").val()+"-"+
    	$("#memberPhone3").val();
    	
    	$("#memberPhone").val(phone.trim());
    });
   
    // 연락처 중복 점검
    $("[id^=memberCellphone]").blur(function() {
       
        console.log("연락처 중복점검");
        
        // 전화번호 병합 
        var cellphone = 
        $("#memberCellphone1").val()+"-"+
        $("#memberCellphone2").val()+"-"+
        $("#memberCellphone3").val();
        
        $("#memberCellphone").val(cellphone.trim());
        
        console.log("#### cellphone:"+cellphone+"#########");
        // 정규식 점검으로 유효 데이터 전송
        var regexPhone = new RegExp("01\\d{1}-\\d{3,4}-\\d{4}");
        
        if (regexPhone.test(cellphone)) { // 정규식 점검 통과
        	
           console.log("연락처 점검 통과 :");
            $.ajax({
                 url : rootPath + '/member/cellphone_check.do',
                 type : 'post',
                 dataType:'text',
                 data : {
                     memberId : $('#memberId').val(),
                     memberCellphone : cellphone
                 },
                 success : function(data) {
                   
                    console.log("연락처 중복 점검 수신 !");
                   
                    console.log("msg:"+data);
                    
                    // 중복 점검 체크 플래그 재설정
                    if (data.trim() == '사용할 수 있는 번호입니다.') {
                       // 메시지 초기화 : 정상적일 경우는 메시지 표기 불필요할 경우
                       $("#memberCellphone_err").text(data);
                       phoneCheckFlag = true;
                    } else {
                       $("#memberCellphone_err").text(data);
                       phoneCheckFlag = false;
                    }
                   
                    // 플래그 인쇄
                    console.log("emailCheckFlag : "+ emailCheckFlag);
                    console.log("phoneCheckFlag : "+ phoneCheckFlag);
                   
                }, // success
                 
                 error : function(xhr, status) {
                    console.log(xhr+" : "+status); // 에러 코드
                }
     
            });
       
        } else { // 정규식 점검 실패
           
            // 에러 메시징
            $("#memberCellphone_err").text("올바르지 않는 전화번호입니다.");
            // 재입력 대기
            //$("#memberCellphone3").focus();
           
        } //
       
    });
   
    // 폼 데이터 전송
    $("form#updateForm").submit(function(){
       
        //alert("폼 전송");
       
        if (emailCheckFlag == false || phoneCheckFlag == false) {
           
            if (emailCheckFlag == false) {
            	alert("이메일 오류")
                $("#memberEmail").focus();
            }
           
            if (phoneCheckFlag == false) {
            	alert("휴대폰 오류")
                $("#memberCellphone3").focus();
            }
            return false; // 전송금지
        }
       
        //////////////////////////////////////////////////////////////////
        // 신규 패쓰워드 비교 점검 : 동등 비교
        if ($("#memberPw").val().trim() != 
        	$("#memberPwCheck").val().trim()) {
        	
        	$("#memberPwCheck").focus();
        	$("#memberPwCheck_err").text("비밀번호가 일치하지 않습니다.");
           
        	return false;
        }
        
        // 신규 패쓰워드 비교 점검 : 정규식 점검
        // 신규 패쓰워드에 변경에 가해지면...
        if ($("#memberPw").val().trim() != "" ||
            $("#memberPwCheck").val().trim() != "")
        {  
            var regexPassword = new RegExp($("#memberPw").attr("pattern"));
            var memberPassword1 = $("#memberPw").val().trim();
            var memberPassword2 = $("#memberPwCheck").val().trim();
           
            if (!regexPassword.test(memberPassword1))
            { // 정규식 점검 실패
            	$("#memberPw").focus();
                return false;
            } // if
           
            if (!regexPassword.test(memberPassword2))
            { // 정규식 점검 실패
            	$("#memberPwCheck").focus();
                return false;
            } // if
        } //
        alert("회원정보가 수정되었습니다.");
        //////////////////////////////////////////////////////////////////
       
    }); //
   
});    

