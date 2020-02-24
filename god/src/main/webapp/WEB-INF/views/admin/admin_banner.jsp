<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 배너관리</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_banner.css">

</head>
<body>
<div id="wrap">
    <!-- 좌측 메뉴 -->
    <div id="left">
        <h5>배너 관리</h5>
        <div id="sub_menu">
            &nbsp; <a href="${rootPath}/admin/admin_banner.do">- 메인</a>
        </div>
    </div>
    <!-- 우측 본문 -->
    <div id="container">

        <!-- 현재창 title -->
        <header>
            | 메인 배너 관리
        </header>

        <!-- 노출 방식 radio button -->
        <div style="margin: 30px 0;">
            | 자동 발송 여부 &nbsp;&nbsp;
            <label for="slide">
                <input type="radio" id="slide" name="method" checked>&nbsp;&nbsp;슬라이드
            </label>&nbsp;&nbsp;
            <label for="random">
                <input type="radio" id="random" name="method" >&nbsp;&nbsp;랜덤
            </label>&nbsp;&nbsp;
            <label for="not_view">
                <input type="radio" id="not_view" name="method" >&nbsp;&nbsp;노출하지 않음
            </label>
        </div>

        <!-- 등록된 배너 폼 -->
        <div style="margin-bottom: 30px;">
            <div style="float: left;">
                | 등록된 배너
            </div>
            <!-- 배너 추가 버튼 -->
            <button type="button" class="btn-outline-secondary btn-sm"
            onclick="add_form()" style="float: right; width: 100px;">배너 추가</button>
        </div>

        <!-- 배너 편집 -->
        <div id="banner_modify_form" style="margin: 20px 0;">
            <!-- 배너 편집 폼 -->
            <table style="width: 100%;">
                <colgroup>
                    <col width="13%">
                    <col width="89%">
                </colgroup>
                <tr>
                    <td style="float: right;">
                        <input type="checkbox" style="width: 30pt;">
                    </td>
                    <td>
                        <div style="width: 100%; height: 200px; padding: 85px 0; border: 1px solid rgb(141,141,141); text-align: center;">
                            등록된 배너가 없습니다.
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="float: right;">
                        <span style="color: red;">*</span> 배너 이미지
                    </td>
                    <td>
                        <input type="text" style="width: 600px; margin-right: 15px;">
                        <button type="button" class="btn-outline-secondary btn-sm"
                        style="width: 100px;">찾아보기</button>
                    </td>
                </tr>
                <tr>
                    <td style="float: right;">
                        링크 주소
                    </td>
                    <td>
                        <input type="text" style="width: 600px; margin-right: 15px;">
                        <label for="blank" style="margin-right: 10px;">
                            <input type="radio" id="blank" name="link"> 새 창(Blank)
                        </label>
                        <label for="self">
                            <input type="radio" id="self" name="link"> 본 창(Self)
                        </label>
                    </td>
                </tr>
            </table>
            <!-- //배너 편집 폼 -->
            <div style="width: 100%; margin: 20px 0; border: .5px solid rgb(141,141,141);"></div>
        </div>
        <!-- //배너 편집 -->

        <!-- 폼 추가되는 곳 -->
        <div id="forms"></div>

        <!-- 하단 버튼들 -->
        <div style="float: right;">
            <button type="button" class="btn-outline-secondary btn-sm"
            onclick="" style="width: 100px; margin-right: 20px;">선택 삭제</button>
            <button type="button" class="btn-outline-secondary btn-sm"
            onclick="" style="width: 100px;">수정하기</button>
        </div>

    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>
