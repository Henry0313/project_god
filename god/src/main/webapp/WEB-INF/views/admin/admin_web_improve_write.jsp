<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 웹 사이트 개선 글쓰기</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_notice_write.css">

<script>
// 에디터
$(document).ready(function() {
    $('#summernote').summernote({
        height: 460,
        placeholder: '내용을 작성해주세요...'
    });
});

</script>

</head>
<body>
<div id="wrap">

    <!-- 좌측 메뉴 -->
    <div id="left">
        <h5>사내 게시판</h5>
        <div id="sub_menu">
            &nbsp; <a href="${rootPath}/admin/admin_notice.do">- 공지사항</a><br>
            &nbsp; <a href="${rootPath}/admin/admin_web_improve.do">- 웹 사이트 개선</a>
        </div>
    </div>

    <!-- 우측 본문 -->
    <div id="container">

        <!-- 현재창 title -->
        <header>
            | 웹 사이트 개선 글쓰기
        </header>

        <div style="margin: 40px 0 20px 0; font-size: 10pt;">
            <label><input type="checkbox"> 중요 공지</label>
        </div>

        <div>
            <span style="margin-left: 10px; font-size: 10pt;">제목</span>
            <!-- 제목 입력 박스 -->
            <input type="text" id="input_text" placeholder="제목을 입력하세요!">

            <!-- 에디터 -->
            <div id="summernote"></div>
        </div>

	    <!-- 하단 버튼들 -->
        <div style="margin: 30px 0; text-align: center;">
            <button type="button" class="btn btn-outline-secondary btn-sm" 
            		style="width: 80px; margin-right: 10px;">작성 완료</button>
            <button type="button" class="btn btn-outline-secondary btn-sm" 
            		style="width: 80px; margin-left: 10px;">작성 취소</button>
        </div>

    </div>
    <!-- //우측 본문 -->
</div>

</body>
</html>
