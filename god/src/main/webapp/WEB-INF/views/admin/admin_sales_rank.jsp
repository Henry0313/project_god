<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 상품 판매 순위</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_product_view.css">

<script>
// 데이트피커
$(document).ready(function(){
    $( "#sdate,#edate" ).datepicker({
        changeMonth: true,
        changeYear: true,
        showMonthAfterYear: true,
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
        dateFormat:'yy-mm-dd',
    });

    $('#sdate').datepicker("option", "maxDate", 'today'); //오늘 이전만 선택할 수 있게
    $('#sdate').datepicker("option", "onClose", function (selectedDate){
        $("#edate").datepicker( "option", "minDate", selectedDate );
    });

    $('#edate').datepicker();
    $('#edate').datepicker("option", "minDate", $("#sdate").val()); //시작일 부터 선택할 수 있게
    $('#edate').datepicker("option", "maxDate", 'today'); //오늘까지만 선택할 수 있게

});
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
            | 상품 판매 순위
        </header>
        <!-- 컨텐츠 title -->
        <div class="sub_title">
            - 기간별 상품 판매수
        </div>
        <div>
            <!-- 셀렉트 박스 -->
            <select id="select_box">
                <option>전체</option>
                <option>{카테고리명}</option>
            </select>
            <input type="text" id="sdate">
            <i class="material-icons" style="font-size: 30px;">date_range</i> ~
            <input type="text" id="edate">
            <i class="material-icons" style="font-size: 30px;">date_range</i>
            <button type="button" class="btn-outline-secondary btn-sm"
                    style="width: 80px; margin-left: 20px;">검색</button>
        </div>
        <!-- 기간별 상품 판매순위 테이블 -->
        <table id="product_view_tbl">
            <colgroup>
                <col width=15%>
                <col width=65%>
                <col width=20%>
            </colgroup>
            <tr style="background-color: rgb(240,240,240);">
                <td>순위</td>
                <td>카테고리와 상품명</td>
                <td>조회수</td>
            </tr>
            <tr>
                <td>1</td>
                <td class="list1">[{카테고리명}]<br>{상품명}</td>
                <td>{조회수}</td>
            </tr>
            <tr>
                <td></td>
                <td class="list1"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="list1"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="list1"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="list1"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="list1"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="list1"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="list1"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="list1"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td class="list1"></td>
                <td></td>
            </tr>
        </table>
        <!-- //기간별 상품 판매순위 테이블 -->

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
