<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 약관 관리</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_terms.css">

<script>

// 배너 추가하기 버튼 눌렀을 시 폼 생성
function add_form() {
    var af = document.createElement("div");
    af.innerHTML = document.getElementById("div[id^=terms_form]").innerHTML;
    document.getElementById("forms").appendChild(af);
}

</script>

</head>
<body>
<div id="wrap">
    <!-- 좌측 메뉴 -->
    <%@ include file="/resources/common/admin/policy_left.jsp" %>
    
    <!-- 우측 본문 -->
    <div id="container">
        <!-- 현재창 title -->
        <header>
            | 약관 관리
        </header>

        <!-- 분리선 -->
        <div id="sepa"></div>

        <!-- 약관 추가하기 버튼 -->
        <div style="display: flow-root;">
            <button type="button" class="btn-outline-secondary btn-sm" onclick="add_form()"
            style="float: right; width: 120px;">약관 추가하기</button>
        </div>

        <!-- 약관 작성 폼 -->
        <div id="terms_form1">
            <div style="display: flow-root; margin-bottom: 40px;">
                <input type="text" class="sub_title" placeholder="타이틀을 입력하세요!">
                <textarea rows="5" placeholder="내용을 입력하세요!"
                    style="width: 100%; padding: 10px;"></textarea>
                <div style="margin: 10px 0;">
                    <div style="float: left;">
                        <label><input type="radio" name="yn2" checked> &nbsp;사용함</label> &nbsp;&nbsp;
                        <label><input type="radio" name="yn2"> &nbsp;사용하지 않음</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input type="checkbox"> &nbsp;필수 동의</label>
                    </div>
                    <div style="float: right;">
                        <button type="button" class="btn-outline-secondary btn-sm"
                        style="width: 70px;">삭제</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 폼 추가되는 곳 -->
        <div id="forms"></div>

        <!-- 하단 버튼들 -->
        <div style="width: 100%; margin-bottom: 40px; text-align: center;">
            <button type="button" class="btn-outline-secondary btn-sm"
            style="width: 70px; margin-right: 20px;">저장</button>
            <button type="button" class="btn-outline-secondary btn-sm"
            style="width: 70px; margin-left: 20px;">취소</button>
        </div>
    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>