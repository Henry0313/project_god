<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 상품 진열</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_display.css">

<script>
// 관리자 선택 시 수정 폼 출력
function view() {

    var con = document.getElementById("admin_choi_form");
    var btn = document.getElementById("admin_choi");

    if (btn.checked == true) {
        con.style.display = 'block';
    } else {
        con.style.display = 'none';
    }
}

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

// 팝업창 : 카테고리 선택 안했을 시 출력
function not_ctg() {

    var ctg = document.getElementById("select_box");

    if (ctg.options[ctg.selectedIndex].value == "") {
        alert("카테고리를 선택해 주세요.");
    } else {
        return false;
    }
}

// 팝업창 : 검색 버튼 누르면 결과 출력
function view_tbl() {

    var con = document.getElementById("modal_content");
    var val = document.getElementById("search_value");
    var zer = document.getElementById("search_zero");

    if (not_ctg() == false) {

        if (val.value == "") {
            con.style.display = 'none';
            zer.style.display = 'block';
        } else {
            zer.style.display = 'none';
            con.style.display = 'block';
        }
    } else {
        return false;
    }

}

</script>

</head>
<body>
<div id="wrap">

    <!-- 좌측 메뉴 -->
    <div id="left">
        <h5>메인 상품 관리</h5>
        <div id="sub_menu">
            &nbsp; <a href="${rootPath}/admin/admin_display.do">- 상품 진열</a>
        </div>
    </div>
    <!-- 우측 본문 -->
    <div id="container">

        <!-- 현재창 title -->
        <header>
            | 상품 진열
        </header>

        <!-- 중간 분리 선 -->
        <div id="sepa"> </div>

        <!-- 진열 방법 라디오 버튼 -->
        <div style="width: 220px; margin-top: 30px;">
            <label for="regi_order">
                <input type="radio" id="regi_order" name="display_way" checked
                       onclick="view()">
                &nbsp;상품 등록순
            </label>
            <label for="view_count">
                <input type="radio" id="view_count" name="display_way" onclick="view()">
                &nbsp;최근 7일간 조회수 높은순
            </label>
            <label for="admin_choi">
                <input type="radio" id="admin_choi" name="display_way" onclick="view()">
                &nbsp;관리자 선택
            </label>
        </div>

        <!-- 관리자 선택 수정 폼 -->
        <div id="admin_choi_form" style="display: none;">
            <!-- 관리자 선택 테이블 -->
            <table id="admin_choi_tbl">

                <colgroup>
                    <col width="5%">
                    <col width="8%">
                    <col width="42%">
                    <col width="25%">
                    <col width="10%">
                    <col width="10%">
                </colgroup>
                <tr class="list1">
                    <td>선택</td>
                    <td>자리 번호</td>
                    <td>카테고리와 상품명</td>
                    <td>판매 가격<br>(적립금)</td>
                    <td>조회수</td>
                    <td>수정</td>
                </tr>
                <tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>1</td>
                    <td>[{카테고리명}]<br>{제품명}</td>
                    <td>{가격}원<br>({적립금}원)</td>
                    <td>{조회수}</td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr>
                <tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>2</td>
                    <td>[Top]<br>반팔 티셔츠</td>
                    <td>25,000원<br>(500원)</td>
                    <td>126</td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr>
                <tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>3</td>
                    <td>선택된 상품이 없습니다.</td>
                    <td></td><td></td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr>
                <tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>4</td>
                    <td>선택된 상품이 없습니다.</td>
                    <td></td><td></td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr>
                <tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>5</td>
                    <td>선택된 상품이 없습니다.</td>
                    <td></td><td></td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr><tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>6</td>
                    <td>선택된 상품이 없습니다.</td>
                    <td></td><td></td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr>
                <tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>7</td>
                    <td>선택된 상품이 없습니다.</td>
                    <td></td><td></td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr>
                <tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>8</td>
                    <td>선택된 상품이 없습니다.</td>
                    <td></td><td></td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr>
                <tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>9</td>
                    <td>선택된 상품이 없습니다.</td>
                    <td></td><td></td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr>
                <tr class="list2">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>10</td>
                    <td>선택된 상품이 없습니다.</td>
                    <td></td><td></td>
                    <td>
                        <button type="button" class="update_btn btn-outline-secondary btn-sm" style="width: 60px;">수정</button>
                    </td>
                </tr>
            </table>
            <!-- //관리자 선택 테이블 -->

            <!-- 하단부 버튼들 -->
            <div id="bottom_btns">
                <div style="float: left; width: 47%;">
                    <button type="button"
                            class="bottom_btn1 btn-outline-secondary btn-sm">선택 삭제</button>
                    <button type="button" class="bottom_btn2 btn-outline-secondary btn-sm"
                            onclick="update()">저장</button>
                </div>
                <div style="float: right; width: 47%">
                    <button type="button"
                            class="bottom_btn1 btn-outline-secondary btn-sm">취소</button>
                </div>
            </div>
        </div>
        <!-- //관리자 선택 수정 폼 -->

        <!-- 상품 등록 팝업창 폼 -->
        <div id="modal">
            <!-- 상품 등록 팝업창 -->
            <div id="modal_">
                <!-- 팝업창 제목 -->
                <div id="modal_header">
                    <div style="float: left; font-size: 16pt;">| 메인 화면 상품 등록</div>
                    <a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px;">
                        close
                    </a>
                </div>

                <!-- 카테고리 셀렉트 박스 -->
                <select id="select_box" style="height: 30px;">
                    <option value="">카테고리 선택</option>
                    <option value="{카테고리 명}">{카테고리 명}</option>
                </select> &nbsp;
                <input type="text" id="search_value" value="" placeholder="상품명을 입력해주세요." style="width: 400px;">
                <button type="button" class="search_btn btn-outline-secondary btn-sm" onclick="view_tbl()" style="width: 90px;">검색</button>

                <!-- 팝업창 본문 -->
                <div id="modal_content" style="display: none;">

                    <!-- 메인 화면 상품 등록 테이블 -->
                    <div id="modal_tbl">
                        <!-- 테이블 헤더 -->
                        <table id="modal_tbl_header">
                            <colgroup>
                                <col width="10%">
                                <col width="10%">
                                <col width="40%">
                                <col width="20%">
                                <col width="20%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <td>선택</td>
                                    <td>번호</td>
                                    <td>카테고리와 상품명</td>
                                    <td>판매 가격<br>(적립금)</td>
                                    <td>조회수</td>
                                </tr>
                            </thead>
                        </table>
                        <!-- 테이블 안 스크롤용 div -->
                        <div id="modal_scroll">
                            <!-- 테이블 바디 -->
                            <table id="modal_tbl_body">
                                <colgroup>
                                    <col width="10%">
                                    <col width="10%">
                                    <col width="40%">
                                    <col width="20%">
                                    <col width="20%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="radio" name="choice">
                                        </td>
                                        <td>1</td>
                                        <td>[{카테고리}]<br>{상품명}</td>
                                        <td>{판매 가격}원<br>([적립금]원)</td>
                                        <td>{조회수}</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- //테이블 바디 -->
                        </div>
                        <!-- //테이블 안 스크롤용 div -->
                    </div>
                    <!-- //메인 화면 상품 등록 테이블 -->

                    <!-- Paging -->
            		<div id="pagination">
            			<a href="#">|처음|</a> &nbsp;&nbsp;&nbsp;
            			<a href="#">◀︎ 이전</a>&nbsp;
            			<a href="#">[1]</a>&nbsp;
            			<a href="#">[2]</a>&nbsp;
            			<a href="#">[3]</a>&nbsp;
            			<a href="#">[4]</a>&nbsp;
            			<a href="#">[5]</a>&nbsp;
            			<a href="#">다음 ▶︎</a> &nbsp;&nbsp;&nbsp;
            			<a href="#">|마지막|</a>
            		</div>
                    <button type="button" class="btn-outline-secondary btn-sm" style="width: 80px; margin-right: 10px;">상품 선택</button>
                    <button type="button" class="modal_close_btn btn-outline-secondary btn-sm" style="width: 80px; margin-left: 10px;">취소</button>
                </div>
                <!-- //팝업창 본문 -->

                <!-- 검색 결과 없을 시 -->
                <div id="search_zero">
                    검색 결과가 없습니다.
                </div>

            </div>
            <!-- //상품 등록 팝업창 -->
        </div>
        <!-- //상품 등록 팝업창 폼 -->

    </div>
    <!-- //우측 본문 -->
</div>
</body>
</html>
