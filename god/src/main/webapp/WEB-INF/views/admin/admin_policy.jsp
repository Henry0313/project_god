<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 정책 관리</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_policy.css">

<script>
// 배너 추가하기 버튼 눌렀을 시 폼 생성
function add_form() {
    var af = document.createElement("div");
    af.innerHTML = document.getElementById("terms_form").innerHTML;
    document.getElementById("forms").appendChild(af);
}

// 에디터
$(document).ready(function() {
  $('.summernote').summernote({
      height: 200,
      placeholder: '내용을 작성해주세요...'
  });
});
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
            | 정책 관리
        </header>

        <!-- 분리선 -->
        <div id="sepa"></div>

        <!-- 서브 타이틀 -->
        <div class="sub_title">- 배송 정책</div>

        <div style="padding-left: 10px;">
            <div style="margin-bottom: 20px;">
                기본 배송료&nbsp; : &nbsp;
                <input type="text"
                		   value="2,500"
                       style="width: 70px; padding: 0 5px; text-align: right;"> 원
            </div>
            <div style="margin-bottom: 20px;">
                무료 배송&nbsp; : &nbsp;
                <input type="text"
                		   value="50,000"
                       style="width: 70px; margin-left: 15px; padding: 0 5px; text-align: right;">
                원 이상 구매 시 무료 배송
            </div>
            <div>
                * 배송 불가 지역
            </div>
            <div style="width: 700px; margin: 20px 0;">
                <input type="text"
                       id="memberZip"
                       name="memberZip"
                       maxlength="5"
                       pattern="\d{5}"
                       readonly>
                <button type="button" class="btn-outline-secondary btn-sm" onclick="" style="width: 110px;">우편번호 검색</button>
                <button type="button" class="btn-outline-secondary btn-sm" onclick="add_form()"
                style="float: right; width: 70px;">추가</button>
            </div>
            <textarea rows="4" readonly style="width: 700px; margin-bottom: 10px; padding: 10px;"></textarea>
            <div>
                <button type="button" class="btn-outline-secondary btn-sm" onclick="" style="width: 90px;">선택 삭제</button>
            </div>
        </div>

        <!-- 서브 타이틀 -->
        <div class="sub_title">- 포인트 정책</div>

        <div style="padding-left: 10px;">
            가입 포인트 : 회원 가입 시 &nbsp; <input type="text" style="width: 65px; margin-bottom: 10px; padding: 0 5px; text-align: right;"> 원 적립<br>
            구매 포인트 : 구매 금액의 &nbsp; <input type="text" value="1" style="width: 45px; padding: 0 5px; text-align: right;"> % 적립
        </div>

        <!-- 서브 타이틀 -->
        <div class="sub_title">- 주문 취소 정책</div>

        <div style="padding-left: 10px;">
            무통장 입금 시 : 무통장 입금 주문 후 &nbsp; <input type="text" style="width: 45px; padding: 0 5px; text-align: right;"> 일간 입금하지 않을 시 주문 자동 취소
        </div>

        <!-- 서브 타이틀 -->
        <div class="sub_title">- 공통 배송 안내 등록</div>

        <!-- 에디터 -->
        <div class="summernote"></div>

        <!-- 서브 타이틀 -->
        <div class="sub_title">- 공통 교환 및 반품 안내 등록</div>

        <!-- 에디터 -->
        <div class="summernote"></div>

        <div style="margin: 30px 0; text-align: right;">
            <button type="button" class="btn-outline-secondary btn-sm" onclick="" style="width: 70px; margin-right: 20px;">저장</button>
            <button type="button" class="btn-outline-secondary btn-sm" onclick="" style="width: 70px;">취소</button>
        </div>

    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>