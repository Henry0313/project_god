<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : SMS 관리</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_sms.css">

</head>
<body>
<div id="wrap">
    <!-- 좌측 메뉴 -->
    <%@ include file="/resources/common/admin/member_left.jsp" %>
    
    <!-- 우측 본문 -->
    <div id="container">

        <!-- 현재창 title -->
        <header>
            | SMS 관리
        </header>

        <!-- sms 관리 테이블 폼 -->
        <div id="sms_tbl_form">
            <!-- sms 관리 테이블 -->
            <table id="sms_tbl">
                <tr style="height: 40px; background-color: rgb(203,203,203);">
                    <td>번호</td>
                    <td>발송 시점</td>
                    <td>발송 문구</td>
                    <td>자동 발송 설정</td>
                    <td>수신자</td>
                </tr>
                <tr style="height: 200px;">
                    <td>1</td>
                    <td>이용자 회원<br>가입 완료 시</td>
                    <td>
                        <textarea rows="6" cols="50" style="padding: 10px; font-size: 10pt;"
                        >안녕하세요?&#13;GetOutDoor의 회원이 되신 것을 축하드립니다.</textarea>
                    </td>
                    <td><label for="auto_send_yn">
                        <input type="checkbox" id="auto_send_yn">
                        자동 발송 여부
                    </label></td>
                    <td>이용자</td>
                </tr>
                <tr style="height: 200px;">
                    <td>2</td>
                    <td>이용자 결제<br>완료 시</td>
                    <td>
                        <textarea rows="6" cols="50" style="padding: 10px; font-size: 10pt;"
                        >신규 주문 접수&#13; - {주문 번호}</textarea>
                    </td>
                    <td><label for="auto_send_yn2">
                        <input type="checkbox" id="auto_send_yn2">
                        자동 발송 여부
                    </label></td>
                    <td>관리자</td>
                </tr>
            </table>
            <!-- //sms 관리 테이블 -->

            <!-- 수정 완료 버튼 -->
            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="search()" style="width: 80px;">수정 완료</button>
        </div>
        <!-- //sms 관리 테이블 폼 -->
    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>
