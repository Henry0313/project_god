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
<link rel="stylesheet" href="${rootPath}/resources/css/member/find_result.css">

</head>
<body>
<div id="wrap">
    <div id="find_result_wrap">
        <div id="find_result_box">
            <div id="find_result_info">
	            <c:set var="member" value="${memberVO}"/>
	            
	            	<c:if test="${not empty member}">
	            		<div>
	                    <h6 style= "margin-top: 30px">고객님이 찾은 아이디 찾기가 완료되었습니다.</h6>
	                    <h5>저희 쇼핑몰을 이용해주셔서 감사합니다.</h5>
	                    <img src="${rootPath}/resources/css/member/images/member_img.gif">
		            </div>
		
	                <div id="member_info" style="margin-top: 14px;">
	                    <span>NAME:${member.memberName}</span>
	                    <span>EMAIL:${member.memberEmail}</span>
	                    <span>ID:${member.memberId}(${member.memberJoinDate})</span>
	                </div>
	                <div>
	                    <p>${member.memberName} 님 즐거운 쇼핑 하세요!</p>
	                </div>
	
	                <div id="login_or_pw_btn">
	                    <span>고객님의 아이디 찾기가 성공적으로 이루어졌습니다. 항상 고객님의
	                    즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다.</span>
	                    <a href="${rootPath}/login/login.do">Login</a>
	                    <a href="${rootPath}/member/find_pw.do">Password Find?</a>
	                </div>
	            	</c:if>
	            	<c:if test="${empty member}">
	               	<script>
						alert("검색결과 없습니다.");
						location.href="${rootPath}/member/find_id.do";
	               	</script>
	            </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>
