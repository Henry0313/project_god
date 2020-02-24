<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 회원 리스트</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_member_list.css">

<script>
// 상세검색열기 버튼 누르면 옵션 출력
function view() {

    var con = document.getElementById("search_detail");
    if (con.style.display == 'none') {
        con.style.display = 'block';
    } else {
        con.style.display = 'none';
    }

    var info = document.getElementById("class_info");
    if (info.style.display == 'none') {
        info.style.display = 'block';
    } else {
        info.style.display = 'none';
    }
}

// 상세검색열기 버튼 열기/닫기 변경
function change() {

    var sbtn = document.getElementById("search_detail_btn");
    if (sbtn.innerHTML == '상세검색닫기▲') {
        sbtn.innerHTML = '상세검색열기▼';
    } else {
        sbtn.innerHTML = '상세검색닫기▲';
    }
}

// 검색버튼누르면 회원리스트 출력
function search() {
	var li = document.getElementById("list");
    if (li.style.display == 'none') {
        li.style.display = 'block';
    }
}

// 적립금 팝업창
$(function() {

    //모달 초기 상태 : 은닉
    $("#modal").hide();

    //모달 출력
    $(".point_btn").click(function() {
        $("#modal").show();
        $('body').css("overflow", "hidden");
    });

    // 모달 닫기
    $(".modal_close_btn").click(function() {
        $("#modal").hide();
        $('body').css("overflow", "scroll");
    });

});

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
    <%@ include file="/resources/common/admin/member_left.jsp" %>
    
    <!-- 우측 본문 -->
    <div id="container">

        <!-- 현재창 title -->
        <header>
            | 회원 리스트
        </header>

        <!-- 검색 전체 : 상세검색 버튼까지 포함  -->
        <div id="search_area">

            <!-- 검색 폼 -->
            <div id="search_form">

                <!-- 셀렉트 박스 -->
                <select id="select_box">
                    <option>&nbsp;&nbsp;&nbsp;&nbsp;이름</option>
                    <option>&nbsp;&nbsp;아이디</option>
                </select> &nbsp;

                <!-- 입력 박스 -->
                <input type="text" placeholder="내용을 입력해주세요."
                style="width: 230px; height: 30px; padding: 0 5px;
                border: 1px solid rgb(141,141,141); font-size: 12px;"> &nbsp;

                <!-- 검색 버튼 -->
                <button type="button" class="btn btn-outline-secondary btn-sm" onclick="search()" style="width: 80px;">검색</button>

            </div><br>
            <!-- //검색 폼 -->

            <!-- 상세 검색 열기 버튼 -->
            <a id="search_detail_btn" href="javascript:view();" onclick="change()">상세검색열기▼</a> <br><br>

            <!-- 분리 선 + 상세 검색 옵션 + 버튼 -->
            <div id="search_detail" style="display: none; text-align: center">

                <!-- 중간 분리 선 -->
                <div id="sepa"> </div> <br>

                <!-- 상세 검색 옵션 -->
                <table id="search_detail_op">
                    <tr class="detail_tr">
                        <!-- 가입일 -->
                        <td align = "right">
                            가입일 &nbsp;&nbsp;
                        </td>
                        <td align = "left">
                            <input type="text" id="sdate">
				            <i class="material-icons" style="font-size: 24px;">date_range</i> ~
				            <input type="text" id="edate">
				            <i class="material-icons" style="font-size: 24px;">date_range</i>
                        </td>
                        <!-- 공간띄우기용 셀 -->
                        <td style="width: 60px;"></td>
                        <!-- 구매 금액 -->
                        <td align = "right">
                            구매 금액 &nbsp;&nbsp;
                            <input type="text" class="text_box"> 원 &nbsp;~ &nbsp;
                            <input type="text" class="text_box"> 원
                        </td>
                    </tr>
                    <tr class="detail_tr">
                        <!-- 회원 등급 -->
                        <td align = "right">
                            회원 등급 &nbsp;&nbsp;
                        </td>
                        <td align = "left">
                            <select style="width: 50px;">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </td>
                        <td></td>
                        <!-- 적립금 -->
                        <td align = "right">
                            적립금 &nbsp;&nbsp;
                            <input type="text" class="text_box"> 원 &nbsp;~ &nbsp;
                            <input type="text" class="text_box"> 원
                        </td>
                    </tr>
                    <tr class="detail_tr">
                        <!-- 메일 수신 -->
                        <td align = "right">
                            메일 수신 &nbsp;&nbsp;
                        </td>
                        <td align = "left">
                            <label class="radio" for="yes">
                                <input type="radio" id="yes" name="mail_yn">
                                &nbsp;&nbsp;수신&nbsp;&nbsp;
                            </label>
                            <label class="radio" for="no">
                                <input type="radio" id="no" name="mail_yn">
                                &nbsp;&nbsp;거부
                            </label>
                        </td>
                    </tr>
                </table>
                <!-- //상세 검색 옵션 -->

                <!-- 상세 검색 버튼 -->
                <button type="button" onclick="search()" class="btn btn-outline-secondary btn-sm" style="width: 100px;">상세 검색</button>

            </div>
            <!-- //상세 검색 -->
        </div>
        <!-- //검색 전체 : 상세검색 버튼까지 포함 -->

       <!-- 회원등급 안내 -->
        <div id="class_info" style="display: none;">
            ▶ 회원 등급 : 1. 실버 회원({00}명), 2. 골드 회원({00})명, 3. VIP 회원({00})명, 4. 고객센터({00}명), 5. 관리자({00})명
        </div><br>

    	<!-- 검색 결과 -->
    	<div id="list" style="display: none;">
    	    <!-- 검색 결과 개수 표기 -->
    	    <div id="result_count">
    	        {000}건의 검색 결과가 있습니다.
    	    </div>

    	    <!-- 회원 리스트 -->
    	    <table id="member_list">
    	        <tr class="list1">
    	            <td>선택</td>
    	            <td>번호</td>
    	            <td>가입일</td>
    	            <td>이름</td>
    	            <td>아이디</td>
    	            <td>회원 등급</td>
    	            <td>방문수</td>
    	            <td>구매 금액</td>
    	            <td>적립금</td>
    	            <td>메일 수신 여부</td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
    	            <td>{ }</td>
    	            <td>{년-월-일}</td>
    	            <td>{이름}</td>
    	            <td><a href="${rootPath}/admin/admin_member_detail.do">{아이디}</a></td>
    	            <td>{회원 등급}</td>
    	            <td>{방문수}</td>
    	            <td>{구매 금액}원</td>
    	            <td>{적립금}원</td>
    	            <td>{메일 수신 여부}</td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
    	            <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td><td></td>
    	        </tr><tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
    	            <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td><td></td>
    	        </tr>
                <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td><td></td>
    	        </tr>
    	    </table>
    	    <!-- //회원 리스트 -->

    	    <!-- 하단 버튼들 -->
	        <button type="button" class="btn-outline-secondary btn-sm" style="width: 100px;">선택 탈퇴</button>
	        <button type="button" class="point_btn btn-outline-secondary btn-sm" style="width: 170px;">선택 회원 적립금 지급</button>
	        <button type="button" class="point_btn btn-outline-secondary btn-sm" style="width: 180px;">검색된 회원 적립금 지급</button>

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

            <!-- 적립금 팝업창 폼 -->
            <div id="modal">
                <!-- 적립금 팝업창 -->
                <div id="modal_">
                    <!-- 팝업창 제목 -->
                    <div id="modal_header">
                        <div style="float: left; font-size: 16pt;">| 적립금 추가/삭제</div>
                        <a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px;">
                            close
                        </a>
                    </div>
                    <!-- 팝업창 본문 -->
                    <div id="modal_content">
                        <div>- &nbsp;&nbsp;계정</div>
                        <!-- 계정 표시되는 박스 -->
                        <div id="modal_content_id">
                            {아이디}, ehddn3821, oioi1234
                        </div>
                        <div>
                            포인트 :
                            <input type="text" style="width: 100px;"> 원
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            내용 :
                            <input type="text" style="width: 280px;">&nbsp;&nbsp;
                            <button type="button" class="btn-outline-secondary btn-sm" style="float: right; width: 80px;">적립</button>
                        </div>
                    </div>
                    <!-- 팝업창 하단부 -->
                    <div id="modal_footer">
                        <button type="button" class="modal_close_btn btn-outline-secondary btn-sm" style="width: 80px;">닫기</button>
                    </div>
                </div>
                <!-- //적립금 팝업창 -->
            </div>
            <!-- //적립금 팝업창 폼 -->
    	</div>
        <!-- //검색 결과 -->
    </div>
    <!-- //우측 본문 -->
</div>

</body>
</html>
