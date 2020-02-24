<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/member/update.css">

<!-- js 외장화 -->
<script src="${rootPath}/resources/js/member/update.js" charset="UTF-8"></script>

<!-- daum 주소 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 일반전화번호 분할 -->
<c:set var="phoneNum" value="${fn:split(defaultMemberVO.memberPhone, '-')}"/>

<!-- 휴대전화번호 분할 -->
<c:set var="cellphoneNum" value="${fn:split(defaultMemberVO.memberCellphone, '-')}"/>

<!-- sms 체크 데이터 -->
<c:set var="smsCheck" value="${defaultMemberVO.smsCheck}" />

<!-- email 체크 데이터 -->
<c:set var="emailCheck" value="${defaultMemberVO.emailCheck}" />

<!-- forever 체크 데이터 -->
<c:set var="foreverCheck" value="${defaultMemberVO.foreverCheck}" />
	
<script>

function setFirstPhone(fld, phone) {
   
	console.log("###### setFirstPhone:"+phone);	
    var len = document.getElementById(fld).length;
    var selectedIdx = 0; // 선택된 항목의 index
    // 항목에 해당하는 순번(index)값 검색
    for (i=0; i<len; i++) {
    	// console.log(document.getElementById(fld)[i].text);
       if (document.getElementById(fld)[i].text == phone)
           selectedIdx = i;
   } // for
   
   // 선택항목 재설정(re-select)
   document.getElementById(fld).selectedIndex = selectedIdx;
   
   // console.log("선택index :"+selectedIdx);
}

function radioCheck1 (fld, val) {
	
	var radios = document.querySelectorAll("input[name="+fld+"]");
	// console.log(radios.length);
	
	//console.log("##### foreverCheck1 :"+radios[0].checked);
	//console.log("##### foreverCheck2 :"+radios[1].checked);
	
	if(val == 'Y') {
		
		document.getElementById("smsCheck1").checked = true;
		document.getElementById("smsCheck2").checked = false;
		
	}
	else {
		document.getElementById("smsCheck1").checked = false;
		document.getElementById("smsCheck2").checked = true;

	}
}

function radioCheck2 (fld, val) {
	
	var radios = document.querySelectorAll("input[name="+fld+"]");
	// console.log(radios.length);
	
	//console.log("##### foreverCheck1 :"+radios[0].checked);
	//console.log("##### foreverCheck2 :"+radios[1].checked);
	
	if(val == 'Y') {
		
		document.getElementById("emailCheck1").checked = true;
		document.getElementById("emailCheck2").checked = false;

	}
	else {

		document.getElementById("emailCheck1").checked = false;
		document.getElementById("emailCheck2").checked = true;

	}
}

function radioCheck3 (fld, val) {
	
	var radios = document.querySelectorAll("input[name="+fld+"]");
	// console.log(radios.length);
	
	//console.log("##### foreverCheck1 :"+radios[0].checked);
	//console.log("##### foreverCheck2 :"+radios[1].checked);
	
	if(val == 'Y') {
		
		document.getElementById("foreverCheck1").checked = true;
		document.getElementById("foreverCheck2").checked = false;
		
	}
	else {

		document.getElementById("foreverCheck1").checked = false;
		document.getElementById("foreverCheck2").checked = true;
	}
}

window.onload = function () {
	
	//일반/휴대 전화번호 첫자리 설정
	//memberPhone
	setFirstPhone("memberPhone1", "${phoneNum[0]}");
	console.log("#######phoneNum:"+"${phoneNum}");
	console.log("#######phoneNum:"+"${phoneNum[0]}"+"########");
	
	//memberCellphone
	setFirstPhone("memberCellphone1", "${cellphoneNum[0]}");
	console.log("#######cellphoneNum:"+"${cellphoneNum}");
	console.log("######cellphoneNum[0]:"+"${cellphoneNum[0]}"+"######");
	
	// 라디오 이메일 sms수신 평생회원 정보출력
	radioCheck1("smsCheck", "${smsCheck}");
	
	radioCheck2("emailCheck", "${emailCheck}");
	
	radioCheck3("foreverCheck", "${foreverCheck}");
	
}

$(document).ready(function(){
	
	$("#deleteMemberBtn").click(function() {
		
		// alert($("#delteMemberBtn"));
		
		if (confirm("정말 탈퇴하시겠습니까?")) {
			document.updateForm.action = "${rootPath}/member/delete.do";
			document.updateForm.submit();
		}
	})
});
</script>

</head>
<body>
	
	<%-- 기존정보 : ${defaultMemberVO}<br> --%>
	
	<div id="modify_wrap">

        <div id="modify_div">
            <div id="join_member_name_wrap">
                <p id="member_img_box"><img src="${rootPath}/resources/css/member/images/member_img.gif"></p>
                <div id="member_content_role">
                    <p>저희 쇼핑몰을 이용해주셔서 감사합니다.<span><b>${defaultMemberVO.memberName}</b></span>님은<span><b>${defaultMemberVO.memberClass}</b></span>회원이십니다.</p>
                </div>
            </div>

            <p style="text-align: right; margin: 20px 0 0;">*필수입력사항</p>

            <form id="updateForm" name="updateForm" method="POST" action="${rootPath}/member/update_proc.do">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width: 150px;">
                        <col style="width: 1300px;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>아이디*</th>
                            <td><input type="text"
                                       id="memberId"
                                       name="memberId"
                                       class="txt_input"
                                       size="15"
                                       readonly
                                       value="${defaultMemberVO.memberId}">
                            </td>
                        </tr>

                        <tr>
                            <th>비밀번호*</th>
                            <td><input type="password"
                                       id="memberPw"
                                       name="memberPw"
                                       class="txt_input"
                                       maxlength="20"
                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
                                       size="15">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~20자)
                            </td>
                        </tr>

                        <tr>
                            <th>비밀번호확인*</th>
                            <td><input type="password"
                                       id="memberPwCheck"
                                       name="memberPwCheck"
                                       class="txt_input"
                                       maxlength="20"
                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
                                       size="15">
                                <!-- 비밀번호 에러 메세지  -->  
								<span id="memberPwCheck_err" class="err_msg"></span> 
                            </td>
                        </tr>

                        <tr>
                            <th>이름*</th>
                            <td><input type="text"
                                       id="memberName"
                                       name="memberName"
                                       class="txt_input"
                                       size="15"
                                       readonly
                                       value="${defaultMemberVO.memberName}">
                            </td>
                        </tr>

                        <tr>
                            <th>주소*</th>
                            <td><input type="text"
                                       id="memberZip"
                                       name="memberZip"
                                       class="txt_input"
                                       pattern="\d{5}"
                                       size="8"
                                       readonly
                                       value="${defaultMemberVO.memberZip}">
                                
                                <a href="#" class="address" onClick="searchPost()">주소검색</a><br>
                                
                                <input type="text"
                                       id="memberAddr"
                                       name="memberAddr"
                                       class="txt_input"
                                       pattern="[\w | \W | 가-힣 | / | - | (  |  ) | ,]{2,200}"
                                       maxlength="100" 
                                       size="30"
                                       readonly
                                       value="${defaultMemberVO.memberAddr}">기본주소<br>
                                <input type="text"
                                       id="memberAddrDetail"
                                       name="memberAddrDetail"
                                       class="txt_input"
                                       pattern="[\w | \W | 가-힣 | / | -]{2,100}"
                                       maxlength="100" 
                                       size="30"
                                       value="${defaultMemberVO.memberAddrDetail}">상세주소
                            </td>
                        </tr>
                        <tr>
                            <th>일반전화</th>
                            <td><select id="memberPhone1"
                                        name="memberPhoneView"
                                        style="width:60px; margin: 4px;">
                                    <option>02</option>
                                    <option>032</option>
                                </select>-
                                <input type="text"
                                       id="memberPhone2"
                                       name="memberPhoneView"
                                       class="txt_input"
                                       pattern="\d{3,4}"
                                       maxlength="4" 
                                       size="4"
                                       value="${phoneNum[1]}">-
                                <input type="text"
                                       id="memberPhone3"
                                       name="memberPhoneView"
                                       class="txt_input"
                                       pattern="\d{4}"
                                       maxlength="4"
                                       size="4"
                                       value="${phoneNum[2]}">
                                       
                                <!-- memberCellphone hidden 합병 필드 -->
                                <input type="hidden"
                                	   id="memberPhone"
                                	   name="memberPhone"
                                	   readonly
                                	   size="15"
                                	   value="${defaultMemberVO.memberPhone}"/>

                            </td>
                        </tr>
                        <tr>
                            <th>휴대번호*</th>
                            <td><select type="text"
                                       id="memberCellphone1"
                                       name="memberCellphoneView"
                                       style="width:60px; margin: 4px;">
                                    <option>010</option>
                                    <option>011</option>
                                    <option>016</option>
                                    <option>017</option>
                                    <option>018</option>
                                    <option>019</option>
                                </select>-
                                <input type="text"
                                       id="memberCellphone2"
                                       name="memberCellphoneView"
                                       class="txt_input"
                                       pattern="\d{3,4}"
                                       maxlength="4"
                                       required
                                       size="4"
                                       value="${cellphoneNum[1]}">-
                                <input type="text"
                                       id="memberCellphone3"
                                       name="memberCellphoneView"
                                       class="txt_input"
                                       pattern="\d{4}"
                                       maxlength="4"
                                       required
                                       size="4"
                                       value="${cellphoneNum[2]}">
                                       
                                <!-- cellphone 에러 메세지  -->  
								<span id="memberCellphone_err" class="err_msg"></span> 
                                       
                                <!-- memberCellphone hidden 합병 필드 -->
                                <input type="hidden"
                                	   id="memberCellphone"
                                	   name="memberCellphone"
                                	   readonly
                                	   size="15"
                                	   value="${defaultMemberVO.memberCellphone}"/>
                            </td>
                        </tr>

                        <tr>
                            <th>SMS 수신여부*</th>
                            <td><input type="radio"
                                       id="smsCheck1"
                                       name="smsCheck"
                                       class="check_input"
                                       value="Y">동의함
                                <input type="radio"
                                       id="smsCheck2"
                                       name="smsCheck"
                                       class="check_input"
                                       checked
                                       value="N">동의안함
                            <p style="margin: 0;">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
                            </td>
                        </tr>

                        <tr>
                            <th>이메일*</th>
                            <td><input type="text"
                                       id="memberEmail"
                                       name="memberEmail"
                                       size="20"
                                       value="${defaultMemberVO.memberEmail}">
                                <!-- email 에러 메세지  -->  
								<span id="memberEmail_err" class="err_msg"></span>  
                            </td>
                        </tr>

                        <tr>
                            <th>이메일 수신여부*</th>
                            <td><input type="radio"
                                       id="emailCheck1"
                                       name="emailCheck"
                                       class="check_input"
                                       value="Y">동의함
                                <input type="radio"
                                       id="emailCheck2"
                                       name="emailCheck"
                                       class="check_input"
                                       checked
                                       value="N">동의안함
                            <p style="margin: 0;">쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
                            </td>
                        </tr>

                        <tr>
                            <th>생년원일*</th>
                            <td><input type="text"
                                       id="memberBrith"
                                       name="memberBrith"
                                       class="txt_input"
                                       style="text-align: center;"
                                       size="10"
                                       readonly
                                       value="${defaultMemberVO.memberBirth}">
                            </td>
                        </tr>

                        <tr>
                            <th>평생회원</th>
                            <td><input type="radio"
                                       id="foreverCheck1"
                                       name="foreverCheck"
                                       class="check_input"
                                       value="Y">동의함
                   				<input type="radio"
                                       id="foreverCheck2"
                                       name="foreverCheck"
                                       class="check_input"
                                       checked
                                       value="N">동의안함
                            <p style="margin: 0;">평생회원은 (주)00000 회원 탈퇴시까지 휴면회원으로 전환되지 않습니다</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <span id="memberOut">
                    <button type="button"
                    		id="deleteMemberBtn"
                    		name="deleteMemberBtn">
                    	회원탈퇴
                    </button>
                </span>

	            <!-- 회원수정/취소버튼 -->
	            <div style="text-align: center; padding-top: 30px;">
	                <input type="submit"
	                       id="updateMemberBtn"
	                       name="updateMembertBtn"
	                       value="회원수정">
	                <input type="reset"
	                       id="updateResetBtn"
	                       name="updateResetBtn"
	                       value="회원수정 취소">
	            </div>
	            <!-- //회원수정/취소버튼 -->
            
            </form><!-- //회원정보수정 끝 -->
        </div>

    </div>
</body>
</html>