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
		
	console.log("rootPath:"+rootPath);
	
	// 아이디 중복 점검 플래그
	var idCheckFlag = false;
	// 비밀번호 확인 점검 플래그
	var pwCheckFlag = false;
	// 이메일 중복 점검 플래그
	var emailCheckFlag = false;
	// 연락처 중복 점검 플래그
	var cellphoneCheckFlag = false;
	// 주소 점검 플래그(ex 우편번호/기본주소 미입력시, 상세주소	 미입력시)
	var addressCheckFlag = false;
	// 약관 동의 점검 플래그
	var agreementCheckFlag = false;
	
	$("#memberBirth").datepicker({
		showOn : "button",
		buttonImage : rootPath + "/css/member/images/date_range.png",
		buttonImageOnly : true,
		changeYear : true,
		changeMonth : true,
		dateFormat : "yy-mm-dd",
		yearRange: "c-70:c+1"
	});

	$.datepicker.regional['ko'] = {
		autoSize : true,
		closeText : '닫기',
		prevText : '이전달',
		nextText : '다음달',
		currentText : '오늘',
		// yearRange: "1930:2020", // 1930 ~ 2019
		// yearRange: "-36:-20", // 36년전부터 20년전까지
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		weekHeader : 'Wk',
		dateFormat : 'yy-mm-dd', // 날짜 포맷
		firstDay : 0,
		// minDate: new Date(1930, 1 - 1, 1),
		isRTL : false,
		showMonthAfterYear : true,
		yearSuffix : '년',
		// 버그 패치 : 컴포넌트 겹침 현상 해소 ex) 성별 필드와의 겹침
		beforeShow : function() {
			setTimeout(function() {
				$('.ui-datepicker').css('z-index', 10);
			}, 0);
		}
	};

	$.datepicker.setDefaults($.datepicker.regional['ko']);

	$("#memberBrith").datepicker({
		changeYear : true,
		changeMonth : true
	});
	
	$('#memberBirth').datepicker("option", "maxDate", 'today'); //오늘 이전만 선택할 수 있게

	// 최종 폼점검
	$("form#joinForm").submit(function() {

		// alert("최종 폼점검");

		// 우편번호/주소/상세주소 점검
		// 주소 성분이 필수 사항이 아닐지라도 입력할 경우 상세주소 누락되는지 최종적으로 점검
		var regexAddrDetail = new RegExp($("#memberAddrDetail").attr("pattern"));
		var memberAddrDetail = $("#memberAddrDetail").val();

		// alert("우편번호 : " + $("#memberZip").val());
		// alert("기본주소 : " + $("#memberAddr").val());
		// alert("상세주소 : " + $("#memberAddrDetail").val());

		// 우편번호 /기본주소 입력 + 상세주소 미입력시
		/* if ($("#memberZip").val() != ""
		 && $("#memberAddr").val() != ""
		 && !regexAddrDetail.test(memberAddrDetail)) {
			alert("상세주소를 입력하십시오");
			addressCheckFlag = false;
			$("#memberAddrDetail").focus();
		}*/

		// 우편번호, 기본주소 미입력시
		/* if ($("#memberZip").val().trim() == ""
		 && $("#memberAddr").val().trim() == ""
 		 && !regexAddrDetail.test(memberAddrDetail)) {
			if ($("#memberAddrDetail").val().trim() == "") {
				addressCheckFlag = true;
			} else {
				alert("기본주소를 입력하십시오");
				addressCheckFlag = false;
				$("#searchBtn").focus();
			}
		}
		*/
		
		// 우편번호 미입력시
		if ($("#memberZip").val() == "") {
			alert("우편번호를 입력하십시오");
			addressCheckFlag = false;
			$("#searchBtn").focus();
		}
		else {
			addressCheckFlag = true;
		}

		// 모두 미입력시
		/*
		 * if ($("#memberZip").val() == "" &&
		 * $("#memberAddressBasic").val()== "" &&
		 * $("#memberAddressDetail").val().trim() == "" ) {
		 * alert("모두 미입력"); addressCheckFlag=true; }
		 */
		
		
		// 모두 입력시
		/*
		if ($("#memberZip").val() != ""
		 && $("#memberAddr").val() != ""
		 && regexAddrDetail.test(memberAddrDetail)) {
			addressCheckFlag = true;
		}
		 */
		
		// /////////////////////////////////////////////////
		// 플래그 인쇄
		console.log("idCheckFlag : " + idCheckFlag);
		console.log("pwCheckFlag : " + pwCheckFlag);
		console.log("emailCheckFlag : " + emailCheckFlag);
		console.log("cellphoneCheckFlag : " + cellphoneCheckFlag);
		console.log("addressCheckFlag: " + addressCheckFlag);
		console.log("agreementCheckFlag: " + agreementCheckFlag);
		
		// return false;
		

		if (idCheckFlag == false ||
			pwCheckFlag == false ||
			emailCheckFlag == false || 
			cellphoneCheckFlag == false || 
			addressCheckFlag == false ||
			agreementCheckFlag == false) {
			// alert("폼 점검 실패");
			return false;
		} else {
			alert("회원가입 완료하였습니다.\n로그인페이지로 이동합니다.");
		}


	});

	//ID 중복점검
	$("#memberId").blur(function() {

		console.log("아이디 중복점검");

		var regexId = new RegExp($("#memberId").attr("pattern"));

		var memberId = $("#memberId").val();

		console.log("rootPath : " + rootPath);

		if (regexId.test(memberId)) { // 정규식 점검 통과

			$.ajax({
				// 주의사항) 외장화할 경우 코드 단절현상으로 인해 문제 발생 -> 광역 javascript 변수로 패치
				url : rootPath + '/member/id_check.do',
				type : 'post',
				dataType : 'text',
				data : {
					memberId : $('#memberId').val()
				},
				success : function(data) {

					console.log("아이디 중복 점검 수신 !");
					console.log("data :" + data);

					// 중복 점검 체크 플래그 재설정
					if (data.trim() == '사용할 수 있는 아이디입니다.') {
						// 메시지 초기화 : 정상적일 경우는 메시지 표기 불필요할 경우
						$("#memberId_err").text("사용할 수 있는 아이디입니다.");
						idCheckFlag = true;
					} else {
						$("#memberId_err").text(data);
						idCheckFlag = false;
					}

					// 플래그 인쇄
					console.log("idCheckFlag : " + idCheckFlag);
					console.log("pwCheckFlag : " + pwCheckFlag);
					console.log("emailCheckFlag : " + emailCheckFlag);
					console.log("cellphoneCheckFlag : " + cellphoneCheckFlag);
					console.log("agreementCheckFlag: " + agreementCheckFlag);

				}, // success

				error : function(xhr, status) {
					console.log(xhr + " : " + status); // 에러 코드
				}

			}); // ajax

		} else { // 정규식 통과 실패

			// 에러 메시징
			$("#memberId_err").text(($("#memberId").attr("title")));
			idCheckFlag = false;
			// 재입력 대기
			$("#memberId").focus();

		} //

	});

	// PW 확인점검
	$("#memberPwCheck").blur(function() {

		console.log("비밀번호 확인점검");

		var memberPw = $("#memberPw").val();
    	
    	var memberPwCheck = $("#memberPwCheck").val();

    	console.log("memberPw :"+memberPw);

    	console.log("memberPwCheck :"+memberPwCheck);
    	
    	if (memberPwCheck != "") { //
	    // 비밀번호 확인이 공백이 아닌 경우
			if (memberPw != memberPwCheck) { // 비밀번호와 비밀번호 확인이 일치하지 않을 경우
		    	$("#memberPwCheck_err").text("패쓰워드가 일치하지 않습니다.");
		    	pwCheckFlag = false;
			}
			else { // 비밀번호와 비밀번호 확인이 일치할 경우
				$("#memberPwCheck_err").text("");
				pwCheckFlag = true;
		    	console.log("비밀번호 확인 점검 수신 !");
			}
    	}
    	else if(memberPw == "" && (memberPw == "" || memberPwCheck == "") ) {
    	// 비밀번호가 공백인 경우
    		$("#memberPwCheck_err").text("");
    	}
    	else {
    	// 비밀번호 확인이 공백일 경우
    		$("#memberPwCheck_err").text("패쓰워드 확인을 입력하세요");
    	} 
    	
    	// 플래그 인쇄
		console.log("idCheckFlag : "+ idCheckFlag);
		console.log("pwCheckFlag : "+ pwCheckFlag);
		console.log("emailCheckFlag : "+ emailCheckFlag);
		console.log("cellphoneCheckFlag : "+ cellphoneCheckFlag);
		console.log("agreementCheckFlag: " + agreementCheckFlag);
		
	});
	
	// Email 중복점검
	$("#memberEmail").blur(function() {

		console.log("이메일 중복점검");

		var regexEmail = new RegExp($("#memberEmail").attr("pattern"));

		var memberEmail = $("#memberEmail").val();

		console.log("rootPath : " + rootPath);

		if (regexEmail.test(memberEmail)) { // 정규식 점검 통과

			$.ajax({
				// 주의사항) 외장화할 경우 코드 단절현상으로 인해 문제 발생 -> 광역 javascript 변수로 패치
				url : rootPath + '/member/email_check.do',
				type : 'post',
				dataType : 'text',
				data : {
					memberEmail : $('#memberEmail').val()
				},
				success : function(data) {

					console.log("이메일 중복 점검 수신 !");
					console.log("data:" + data);

					// 중복 점검 체크 플래그 재설정
					if (data.trim() == '사용할 수 있는 이메일입니다.') {
						// 메시지 초기화 : 정상적일 경우는 메시지 표기 불필요할 경우
						$("#memberEmail_err").text("사용할 수 있는 이메일입니다.");
						emailCheckFlag = true;
					} else {
						$("#memberEmail_err").text(data);
						emailCheckFlag = false;
					}

					// 플래그 인쇄
					console.log("idCheckFlag : " + idCheckFlag);
					console.log("pwCheckFlag : " + pwCheckFlag);
					console.log("emailCheckFlag : " + emailCheckFlag);
					console.log("cellphoneCheckFlag : " + cellphoneCheckFlag);
					console.log("agreementCheckFlag: " + agreementCheckFlag);

				}, // success

				error : function(xhr, status) {
					console.log(xhr + " : " + status); // 에러 코드
				}

			}); // ajax

		} else { // 정규식 통과 실패

			// 에러 메시징
			$("#memberEmail_err").text(($("#memberEmail").attr("title")));
			emailCheckFlag = false;
			// 재입력 대기
			$("#memberEmail").focus();

		} //

	});

	// 연락처 중복점검
	$("#memberCellphone").blur(function() {

		console.log("연락처 중복점검");

		var regexCellphone = new RegExp($("#memberCellphone").attr("pattern"));

		var memberCellphone = $("#memberCellphone").val();

		console.log("rootPath : " + rootPath);

		if (regexCellphone.test(memberCellphone)) { // 정규식 점검 통과

			$.ajax({
				// 주의사항) 외장화할 경우 코드 단절현상으로 인해 문제 발생 -> 광역 javascript 변수로 패치
				url : rootPath + '/member/cellphone_check.do',
				type : 'post',
				dataType : 'text',
				data : {
					memberCellphone : $('#memberCellphone').val()
				},
				success : function(data) {

					console.log("연락처 중복 점검 수신 !");
					console.log("data:" + data);

					// 중복 점검 체크 플래그 재설정
					if (data.trim() == '사용할 수 있는 번호입니다.') {
						// 메시지 초기화 : 정상적일 경우는 메시지 표기 불필요할 경우
						$("#memberCellphone_err").text("사용할 수 있는 번호입니다.");
						cellphoneCheckFlag = true;
					} else {
						$("#memberCellphone_err").text(data);
						cellphoneCheckFlag = false;
					}

					// 플래그 인쇄
					console.log("idCheckFlag : " + idCheckFlag);
					console.log("pwCheckFlag : " + pwCheckFlag);
					console.log("emailCheckFlag : " + emailCheckFlag);
					console.log("cellphoneCheckFlag : " + cellphoneCheckFlag);
					console.log("agreementCheckFlag: " + agreementCheckFlag);

				}, // success

				error : function(xhr, status) {
					console.log(xhr + " : " + status); // 에러 코드
				}

			}); // ajax

		} else { // 정규식 통과 실패

			// 에러 메시징
			$("#memberCellphone_err").text(($("#memberCellphone").attr("title")));
			phoneCheckFlag = false;
			// 재입력 대기
			$("#memberCellphone").focus();

		} //

	});
	
	// 약관 동의 점검
	// 회원가입 버튼을 눌렀을 경우
    $("#joinSubmitBtn").click(function() { 

		console.log("약관 동의 점검");
		
		var agreeCheckVal = false; // 이용약관동의 flag
		
		var infoCheckVal = false; // 개인정보 동의 flag 
		
		// 체크박스 값 가져오기 true = 체크o, false = 체크x
		agreeCheckVal = $("input:checkbox[name=agreeCheck]").is(":checked");
		infoCheckVal = $("input:checkbox[name=infoCheck]").is(":checked");
	     
		// 약관 2개 모두 체크 시 true
		if(agreeCheckVal && infoCheckVal) {
			agreementCheckFlag = true;
		} 
		// 약관 2개 모두 미 체크 시 or 한개만 체크한 경우 false
		else {
			
			agreementCheckFlag = false;
			
			// 둘다 동의 체크x
			if(!agreeCheckVal && !infoCheckVal){
				alert("모든약관 동의에 체크해주세요!");
			} 
			// 이용약관동의 체크x
			else if(!agreeCheckVal) {
				alert("이용약관 동의에 체크해주세요!");
			}
			// 개인정보동의 체크x			
			else {
				alert("개인정보 동의에 체크해주세요!");
			}
			
		} //
		
		/*
		// 이용약관과 개인정보 동의 모두 체크한 경우
		if($("input:checkbox[name=agreeCheck]").is(":checked") && 
		   $("input:checkbox[name=infoCheck]").is(":checked") == true) { 
			
			agreementCheckFlag = true; // 약관동의 점검 flag true 통과
			
		}
		// 이용약관 동의 or 개인정보 동의 한개만 체크하거나 둘다 체크 안한 경우
		else { 
			
			agreementCheckFlag = false; // 약관동의 점검 flag false 실패
			
			// 개인정보 동의 체크 안함
			if($("input:checkbox[name=agreeCheck]").is(":checked") == true) { 
				alert("개인정보 동의에 체크해주세요!");
			} 
			// 이용약관 동의 체크 안함
			else { 
				alert("이용약관 동의에 체크해주세요!");
			}
		}
		*/
    	
	});
    
          
});

$(document).ready(function(){

    $("#select_email").change(function() {
        $("#select_email option:selected").each(function() {
            console.log("test");
            if($(this).val()=='1'){//직접 입력일경우
                $("#member_email_domain").val('');
                $("#member_email_domain").attr("disabled", false); //활성화
            }
            else{
                $("#member_email_domain").val($(this).text()); //선택값 입력
                $("#member_email_domain").attr("disabled", true); //비활성화
            }
        });
    });

    $("#all_checkbox").click(function () {

        console.log("check");
        if($("#all_checkbox").prop("checked")) {
            $("[id$=Check]").prop("checked", true);
            $("#foreverCheckNot").prop("checked", false);
        }
        else{
            $("[id$=Check]").prop("checked", false);
            $("#foreverCheckNot").prop("checked", true);
        }

    });

});


