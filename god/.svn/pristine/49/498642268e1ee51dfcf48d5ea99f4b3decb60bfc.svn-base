<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 결제 방법 설정</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_pay_method.css">

<script>
// 메인화면 상품등록 팝업창
$(function() {

    //모달 초기 상태 : 은닉
    $("#modal").hide();

    //모달 출력
    $(".update_btn").click(function() {
        $("#modal").show();
        $('body').css("overflow", "hidden");
    });

    // 모달 닫기
    $(".modal_close_btn").click(function() {
        $("#modal").hide();
        $('body').css("overflow", "scroll");
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
            | 결제 방법
        </header>

        <!-- 서브 타이틀 -->
        <div>- 결제 방법 선택</div>

        <table class="pay_tbl">
            <colgroup>
                <col width=80%>
                <col width=20%>
            </colgroup>
            <tr style="background-color: rgb(200, 200, 200);">
                <td>일반</td>
                <td>에스크로</td>
            </tr>
            <tr>
                <td style="">
                    <input type="checkbox"> &nbsp;무통장 입금 &nbsp;&nbsp;&nbsp;
                    <input type="checkbox"> &nbsp;카드 결제 &nbsp;&nbsp;&nbsp;
                    <input type="checkbox"> &nbsp;휴대폰 결제 &nbsp;&nbsp;&nbsp;
                    <input type="checkbox"> &nbsp;카카오페이(간편결제) &nbsp;&nbsp;&nbsp;
                    <input type="checkbox"> &nbsp;PAYCO(간편결제)
                </td>
                <td>
                    <input type="checkbox"> &nbsp;실시간 계좌이체
                </td>
            </tr>
        </table>

        <!-- 서브 타이틀 -->
        <div style="margin-bottom: 20px;">- 무통장 입금 선택</div>

        <button type="button" class="update_btn btn-outline-secondary btn-sm" onclick="" style="width: 130px;">은행 계좌 등록</button>

        <!-- 은행 계좌 등록 팝업창 폼 -->
        <div id="modal">
            <!-- 은행 계좌 등록 팝업창 -->
            <div id="modal_">
                <!-- 팝업창 제목 -->
                <div id="modal_header">
                    <div style="float: left; font-size: 16pt;">| 은행 계좌 등록</div>
                    <a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px;">
                        close
                    </a>
                </div>

                <div style="margin-bottom: 40px;padding: 0 20px;">
                    <div>
                        - 은행 이름 <input type="text" style="width: 300px; margin: 0 0 20px 20px; padding: 5px;">
                    </div>
                    <div>
                        - 계좌 번호 <input type="text" style="width: 300px; margin: 0 0 20px 20px; padding: 5px;">
                    </div>
                    <div>
                        - 예금주 명 <input type="text" style="width: 300px; margin: 0 0 20px 20px; padding: 5px;">
                    </div>
                    <div>
                        - 사용 설정
                        <label><input type="radio" name="bank_yn" style="margin-left: 20px;"> &nbsp;노출</label>
                        <label><input type="radio" name="bank_yn" style="margin-left: 10px;"> &nbsp;숨김</label>
                    </div>

                </div>
                <div align="center">
                    <button type="button" class="btn-outline-secondary btn-sm" style="width: 70px; margin-right: 5px;">확인</button>
                    <button type="button" class="modal_close_btn btn-outline-secondary btn-sm" style="width: 70px; margin-left: 5px;">취소</button>
                </div>


            </div>
            <!-- //은행 계좌 등록 팝업창 -->
        </div>
        <!-- //은행 계좌 등록 팝업창 폼 -->

        <!-- 계좌 정보 테이블 -->
        <table class="pay_tbl" style="width: 100%;">
            <colgroup>
                <col width=5%>
                <col width=60%>
                <col width=15%>
                <col width=20%>
            </colgroup>
            <tr style="background-color: rgb(200, 200, 200);">
                <td>번호</td>
                <td>계좌 정보</td>
                <td>노출 / 숨김</td>
                <td>수정 / 삭제</td>
            </tr>
            <tr>
                <td>5</td>
                <td>우리은행 0000-000-000-0000 (주) GetOutDoor</td>
                <td></td>
                <td>
                    <button type="button" class="btn-outline-secondary btn-sm" style="width: 60px; margin-right: 5px;">수정</button>
                    <button type="button" class="modal_close_btn btn-outline-secondary btn-sm" style="width: 60px; margin-left: 5px;">삭제</button>
                </td>
            </tr>
            <tr>
                <td>4</td>
                <td>국민은행 0000-000-000-0000 (주) GetOutDoor</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>3</td>
                <td>기업은행 0000-000-000-0000 (주) GetOutDoor</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>2</td>
                <td>하나은행 0000-000-000-0000 (주) GetOutDoor</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>1</td>
                <td>신한은행 0000-000-000-0000 (주) GetOutDoor</td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <!-- //계좌 정보 테이블 -->

        <div style="text-align: right;">
            <button type="button" class="btn-outline-secondary btn-sm" onclick="" style="width: 70px; margin-right: 20px;">확인</button>
            <button type="button" class="btn-outline-secondary btn-sm" onclick="" style="width: 70px;">취소</button>
        </div>
    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>
