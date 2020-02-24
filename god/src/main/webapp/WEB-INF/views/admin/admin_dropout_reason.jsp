<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 탈퇴 사유</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_dropout_reason.css">

<script>

// 보기 버튼 누르면 옵션 출력
window.onload = function() {

    var btns = document.querySelectorAll("[id^=content_view_btn]");

    var panels = document.querySelectorAll("[id^=dropout_content]");

    var btns_status = [0,0,0];

    for (var btn of btns) {

        btn.onclick = function(e) {

            var btn_id = e.currentTarget.id;

            var index = btn_id.substring("content_view_btn".length, btn_id.length);

            var panel_id = "dropout_content" + index;

            var panel = document.getElementById(panel_id);
            var sbtn = document.getElementById(btn_id);

            if (btns_status[index-1] == 0) {
                panel.style.display = "table-row";
                sbtn.innerHTML = '닫기 ▲';
                btns_status[index-1] = 1;
            } else {
                panel.style.display = "none";
                sbtn.innerHTML = '보기 ▼';
                btns_status[index-1] = 0;
            }
        }
    }
}

</script>

</head>
<body>
<div id="wrap">

    <!-- 좌측 메뉴 -->
    <%@ include file="/resources/common/admin/total_left.jsp" %>
    
    <!-- 우측 본문 -->
    <div id="container">

        <!-- 현재창 title -->
        <header>
            | 탈퇴 사유
        </header>

        <!-- 탈퇴사유 집계 -->
        <div id="dropout_total">
            <ul style="float: left; width: 220px; margin: 0;">
                <li>이용률 감소</li>
                <li>상품 저 품질</li>
                <li>상품 가격 불만</li>
                <li>구매 가능 상품 수 저조</li>
                <li>사기성 상품 과다</li>
            </ul>
            <div style="float: right; width: 100px; text-align: right;">
                {사유 수}건<br>
                {사유 수}건<br>
                {사유 수}건<br>
                {사유 수}건<br>
                {사유 수}건
            </div>
        </div>

        <!-- 탈퇴사유 테이블 -->
        <table id="dropout_tbl">
            <colgroup>
                <col width=5%>
                <col width=10%>
                <col width=45%>
                <col width=15%>
                <col width=15%>
                <col width=10%>
            </colgroup>
            <tr style="background-color: rgb(240,240,240);">
                <td>선택</td>
                <td>번호</td>
                <td>내용</td>
                <td>아이디</td>
                <td>작성일</td>
                <td>보기</td>
            </tr>
            <tr class="label">
                <td>
                    <input type="checkbox">
                </td>
                <td>1</td>
                <td style="text-align: left;">{내용의 앞 100자}</td>
                <td>{아이디}</td>
                <td>{yyyy-mm-dd}</td>
                <td>
                    <a id="content_view_btn1" href="#">보기 ▼</a>
                </td>
            </tr>
            <tr id="dropout_content1" class="elements" style="display: none;">
                <td></td>
                <td></td>
                <td style="text-align: left;">{탈퇴 사유 내용}</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="text-align: left;"></td>
                <td></td>
                <td></td>
                <td>
                    <a id="content_view_btn2" href="#">보기 ▼</a>
                </td>
            </tr>
            <tr id="dropout_content2" class="elements" style="display: none;">
                <td></td>
                <td></td>
                <td style="text-align: left;">{탈퇴 사유 내용}</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="text-align: left;"></td>
                <td></td>
                <td></td>
                <td>
                    <a id="content_view_btn3" href="#">보기 ▼</a>
                </td>
            </tr>
            <tr id="dropout_content3" class="elements" style="display: none;">
                <td></td>
                <td></td>
                <td style="text-align: left;">{탈퇴 사유 내용}</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="text-align: left;"></td>
                <td></td>
                <td></td>
                <td>
                    <a id="content_view_btn4" href="#">보기 ▼</a>
                </td>
            </tr>
            <tr id="dropout_content4" class="elements" style="display: none;">
                <td></td>
                <td></td>
                <td style="text-align: left;">{탈퇴 사유 내용}</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td style="text-align: left;"></td>
                <td></td>
                <td></td>
                <td>
                    <a id="content_view_btn5" href="#">보기 ▼</a>
                </td>
            </tr>
            <tr id="dropout_content5" class="elements" style="display: none;">
                <td></td>
                <td></td>
                <td style="text-align: left;">{탈퇴 사유 내용}</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <!-- //탈퇴사유 테이블 -->

        <button type="button" class="btn-outline-secondary btn-sm" style="width: 100px;">선택 삭제</button>

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

    </div>
    <!-- //우측 본문 -->
</div>

</body>
</html>
