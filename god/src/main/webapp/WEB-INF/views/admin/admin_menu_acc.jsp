<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 메뉴 접근 권한</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_menu_acc.css">

<script>
// 탭 메뉴
$(function() {
   $("#tabs").tabs();
});

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
            | 메뉴 접근 권한
        </header>

        <!-- 탭 메뉴 -->
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">회원</a></li>
                <li><a href="#tabs-2">고객 센터</a></li>
                <li><a href="#tabs-3">관리자</a></li>
            </ul>

            <!-- 탭 컨텐츠 1 -->
            <div id="tabs-1" class="tabs_position">
                <div class="tab_content">
                    <div class="sub_title">회원 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; 회원 리스트</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 탈퇴 회원 리스트</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 메일 관리</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 대량 메일 발송</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 관리자 메뉴 접근 권한</label>
                </div>
                <div class="tab_content">
                    <div class="sub_title">게시판 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; FAQ</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; Q&A</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 구매후기</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 등업신청</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; EVENT</label>
                </div>
                <div class="tab_content">
                    <div class="sub_title">주문 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; 주문 관리</label>
                </div>
                <div class="tab_content">
                    <div class="sub_title">취소/교환/환불 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; 취소/교환/환불 관리</label>
                </div>
            </div>

            <!-- 탭 컨텐츠 2 -->
            <div id="tabs-2" class="tabs_position">
                <div class="tab_content">
                    <div class="sub_title">회원 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; 회원 리스트</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 탈퇴 회원 리스트</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 메일 관리</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 대량 메일 발송</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 관리자 메뉴 접근 권한</label>
                </div>
                <div class="tab_content">
                    <div class="sub_title">게시판 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; FAQ</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; Q&A</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 구매후기</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 등업신청</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; EVENT</label>
                </div>
                <div class="tab_content">
                    <div class="sub_title">주문 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; 주문 관리</label>
                </div>
                <div class="tab_content">
                    <div class="sub_title">취소/교환/환불 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; 취소/교환/환불 관리</label>
                </div>
            </div>

            <!-- 탭 컨텐츠 3 -->
            <div id="tabs-3" class="tabs_position">
                <div class="tab_content">
                    <div class="sub_title">회원 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; 회원 리스트</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 탈퇴 회원 리스트</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 메일 관리</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 대량 메일 발송</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 관리자 메뉴 접근 권한</label>
                </div>
                <div class="tab_content">
                    <div class="sub_title">게시판 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; FAQ</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; Q&A</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 구매후기</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; 등업신청</label><br>
                    <label><input type="checkbox"> &nbsp; &nbsp; EVENT</label>
                </div>
                <div class="tab_content">
                    <div class="sub_title">주문 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; 주문 관리</label>
                </div>
                <div class="tab_content">
                    <div class="sub_title">취소/교환/환불 관리</div>
                    <label><input type="checkbox"> &nbsp; &nbsp; 취소/교환/환불 관리</label>
                </div>
            </div>

        </div>
        <!-- //탭 메뉴 -->

        <!-- 하단 버튼들 -->
        <div style="float: left; width: 50%;">
            <button type="button" class="update_btn btn-outline-secondary btn-sm" onclick="" style="width: 90px; margin-right: 20px;">등급 추가</button>
            <button type="button" class="btn-outline-secondary btn-sm" onclick="" style="width: 90px;">등급 삭제</button>
        </div>
        <div style="float: right; width: 50%; text-align: right;">
            <button type="button" class="btn-outline-secondary btn-sm" onclick="" style="width: 70px; margin-right: 20px;">저장</button>
            <button type="button" class="btn-outline-secondary btn-sm" onclick="" style="width: 70px;">취소</button>
        </div>

        <!-- 등급 추가하기 팝업창 폼 -->
        <div id="modal">
            <!-- 등급 추가하기 팝업창 -->
            <div id="modal_">
                <!-- 팝업창 제목 -->
                <div id="modal_header">
                    <div style="float: left; font-size: 16pt;">| 등급 추가 하기</div>
                    <a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px;">
                        close
                    </a>
                </div>

                <div id="modal_content">
                    <div>
                        - 등급명 <input type="text" style="width: 320px; margin: 0 0 20px 20px; padding: 5px;">
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

    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>
