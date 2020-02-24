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
<link rel="stylesheet" href="${rootPath}/resources/css/member/find_pw_result.css">

<script>
$(function() {
	// 비밀번호 확인 점검 플래그
	var pwCheckFlag = false;
	
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
    	
	});
	
	$("#updateBtn").click(function(){
		
		if(pwCheckFlag == true){
			alert("패쓰워드 변경 성공하셨습니다.");
		}
		else {
			alert("패쓰워드 변경 실패하셨습니다.")
			return false;
		}
		
	});
});


</script>
</head>
<body>
<div id="wrap">
    <div id="find_result_wrap">
        <div id="find_result_box">
            <div id="find_result_info">
	            <c:set var="member" value="${memberVO}"/>
	            
	            <c:if test="${not empty member}">
	                <form id="pwForm" name="pwForm" action="${rootPath}/member/pwUpdate.do" method="POST">
	                    <div id="password_title">
	            			패쓰워드를 변경하십시오.
	                    </div>
	                    <div class="update_password">
	                        PW
	                    </div>
	                    <input type="password"
	                            id="memberPw"
	                            name="memberPw"
	                            class="input_password"
	                            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
	                            required>
	                    <div class="update_password">
	                        PW RECHECK
	                    </div>
	                    <input type="password"
	                            id="memberPwCheck"
	                            name="memberPwCheck"
	                            class="input_password"
	                            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
	                            required>
	                    	<!-- PwCheck 에러 메세지  --> 
                    	<div style="margin-bottom: 30px;">
                    		<span id="memberPwCheck_err"></span>
                    	</div>
	                    <div id="displaynone">
		                   	<input type="text" 
		                   		   id="memberId" 
		                   		   name="memberId" value="${member.memberId}">
	                   	</div>
	                
		                <div>
		                    <input type="submit" id="updateBtn" value="패스워드 변경">
		                </div>
	                </form>
	            </c:if>
	            	<c:if test="${empty member}">
	         		<script>
						alert("검색결과 없습니다.");
						location.href="${rootPath}/member/find_pw.do";
	              	</script>
	            </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>
