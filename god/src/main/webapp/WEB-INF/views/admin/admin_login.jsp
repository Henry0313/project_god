<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>admin 로그인</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_login.css">

</head>
<body>
	
	<!-- 전체 wrap -->
	<div id="wrap" class="mx-auto">
		
		<!-- 로그인 wrap -->
		<div id="login_wrap">
			
			<!-- 로그인 section1 -->
			<div id="login_section1" class="container">
			
				<!-- 머리말 -->
				<div>
					<span>&nbsp;<b>Admin Login</b></span>
				</div>
				<!-- // 머리말 끝 -->
				
				<!-- 로그인  id/pw 필드 -->
				<div id="login_left">
					<form class="form-inline" action="${pageContext.request.contextPath}/admin/loginProc.do" method="POST">
					
						<!-- 로그인 아이디 아이콘 -->
						<div id="login_left_icon1">
							<span class="material-icons mt-1" style="color:black">
								account_box
							</span>
						</div>
						<!-- // 로그인 아이디 아이콘 끝 -->
						
						<!-- 로그인 아이디 입력필드 -->
						<div id="login_left_fld1">
							<input type="text"
								   id="memberId"
								   name="memberId"
								   title=""
								   class="inputfld"
								   maxlength="20"
								   size="25"
								   pattern="[a-zA-Z]{1}\w{7,19}"
								   required
								   placeholder="&nbsp;USER ID">				
						</div>
						<!-- // 로그인 아이디 입력필드 끝 -->
						
						<!-- 로그인 비밀번호 아이콘 -->
						<div id="login_left_icon2">
							<span class="material-icons mt-1" style="color:black">
								vpn_key
							</span>
						</div>
						<!-- // 로그인 비밀번호 아이콘 끝 -->
						
						<!-- 로그인 비밀번호 입력필드 -->
						<div id="login_left_fld2">
							<input type="password"
								   id="memberPw"
								   name="memberPw"
								   title=""
								   class="inputfld"
								   maxlength="20"
								   size="25"
								   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
								   required
								   placeholder="&nbsp;USER PW">				
						</div>
						<!-- // 로그인 비밀번호 입력필드 끝 -->
					</form>
				</div>
				<!-- // 로그인 id/pw필드 끝 -->
	
				<!-- 로그인 버튼 -->
				<div id="login_right">
					<button type="button" class="login_btn">
						보안<br>로그인
					</button>
				</div>	
				<!-- // 로그인 버튼 끝 -->

			</div>
			<!-- // 로그인 section1 끝 -->	
				
			<!-- 로그인 section2 -->
			<div id="login_section2">
				
				<!-- section2 title -->
				<div id="section2_title">
					관리자 계정 생성 안내	
				</div>
				<!-- // section2 title 끝 -->
				
				<!-- section2 content -->
				<div id="section2_content">
					- 이용자 화면에서 화원 가입한 후 아래의 정보로 연락해 주세요!<br>
					- 홍길동 과장 / 000-0000-0000 / admin@getoutdoor.co.kr<br>
					- 아이디와 비밀번호는 이용자 화면에서 찾을 수 있습니다.
				</div>
				<!-- // section2 content 끝 -->	    
					  
			</div>
			<!-- // 로그인 section2 끝 -->
			
		</div>
		<!-- // 로그인 wrap 끝 -->
	
	</div>	
	<!-- // 전체 wrap 끝 -->

</body>
</html>