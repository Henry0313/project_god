<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/member/login.css">

<script>
// modal
$(function() {
    //모달 초기 상태 : 은닉
    $("#modal").hide();

    //모달 출력
    $("#benefit").click(function() {
        $("#modal").show();
        $('body').css("overflow", "hidden");
    });

    // 모달 닫기
    $("#modal_close_btn").click(function() {
        $("#modal").hide();
        $('body').css("overflow", "scroll");
    });
});
</script>

</head>
<body>
<div id="wrap">
    <!-- 로그인 폼 -->
    <form id="login_form" method="POST" action="${rootPath}/login" >
        <h2>Login</h2>
		
		<div style="width:100%; height:20px;">
	        <c:if test="${error eq 'true'}">
	            <div class="msg">${msg.message}</div>
			</c:if>
		</div>
		
		<!-- csrf -->
		<input type="hidden"                        
	   		   name="${_csrf.parameterName}"
	   		   value="${_csrf.token}"/>
		
        <div class="lgn_pw">
            <!-- 아이디 -->
            <label>ID</label>
            <input type="text" 
				   id="memberId"
				   class="input_tag"
				   name="memberId"
				   pattern="[a-zA-Z]{1}\w{7,19}"
				   required
				   placeholder="&nbsp;USER ID"
				   value="" 
				   autocapitalize="off" />

            <!-- 패스워드 -->
            <label>Password</label>
            <input type="password"
				   id="memberPw"
				   class="input_tag"
				   name="memberPw"
				   required
				   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
				   placeholder="&nbsp;USER PW"
				   value=""
				   autocomplete="off" />
        </div>

        <!-- 아이디,패스워드 찾기 -->
        <div class="lost">
            <a class="benefit" href="${rootPath}/member/find_id.do">Forgot your ID or Password?</a>
        </div>

        <!-- 로그인 버튼 -->
        <div class="btn_area">
            <button type="submit" class="btn btn-dark">Login</button>
        </div>
    </form>
    <!-- //로그인 폼 -->

    <!-- Sepa -->
    <div id="sepa"></div>

    <!-- 회원가입 혜택  -->
    <div id="join_form" class="lost">
		<h4 class="benefit">⭐️ &nbsp; GetOutDoor 회원만을 위한 혜택  &nbsp; ⭐️</h4>
    
		<!-- content -->	
		<div id="benefit" class="benefit">
			<div class="ss">아직도 GetOutDoor 회원이 아니신가요?</div>
			<div class="ss">포토리뷰 작성시 최대 50,000원 지급</div>
			<div class="ss">5만원 이상 구매시 무료배송</div>
			<div class="ss">카카오톡 친구 추가시 쿠폰 증정</div>
			<div class="ss">신규회원 가입시 적립금 3,000원 즉시 적립</div>
			<div class="ss">회원등급에 따른 스페셜 할인혜택</div>
			<div class="ss">회원가입시 1,000원 당장 지급</div>
			<div class="ss">바로가기 설치시 적립금 1,000원 지급</div>
		</div>
		
		<!-- 회원가입 버튼 -->
		<div class="btn_area">
		    <button type="button" 
		    		class="btn btn-dark"
		    		onclick="location.href='${rootPath}/member/join.do'">Join</button>
		</div>
		
	</div>
</div>
</body>
</html>