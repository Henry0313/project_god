<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 대량 메일 발송</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_all_mail.css">

<script>
// 검색버튼누르면 회원리스트 출력
function search() {
	var li = document.getElementById("list");
    if (li.style.display == 'none') {
        li.style.display = 'block';
    }
}

// 에디터
$(document).ready(function() {
    $('#summernote').summernote({
        height: 200,
        placeholder: '내용을 작성해주세요...'
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
            | 대량 메일 발송
        </header>

        <!-- 컨텐츠 title -->
        <div class="sub_title">
            - 발송 메일 주소
        </div>
        <input type="text" value="{최근에 입력한 메일 주소 자동 표기}" style="width: 250px; margin-bottom: 20px; padding: 5px; font-size: 11pt;">

        <!-- 컨텐츠 title -->
        <div class="sub_title">
            - 발송 내용
        </div>

        <!-- 메일 내용 작성 폼 -->
        <div id="mail_content">
            제목
            <!-- 제목 입력 박스 -->
            <input type="text" id="mail_title" value="" placeholder="제목을 입력하세요!">

            <!-- 에디터 -->
            <div id="summernote"></div>
        </div>

        <!-- 컨텐츠 title -->
        <div class="sub_title">
            - 수신 대상
        </div>

        <!-- 검색 전체 : 검색 버튼까지 포함  -->
        <div id="search_area">

            <!-- 검색 옵션 + 버튼 -->
            <div id="search_detail" style="text-align: center">

                <!-- 검색 옵션 -->
                <table id="search_op">
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
                            <label for="one">
                                <input type="checkbox" id="one"> 1 &nbsp;
                            </label>
                            <label for="two">
                                <input type="checkbox" id="two"> 2 &nbsp;
                            </label>
                            <label for="three">
                                <input type="checkbox" id="three"> 3 &nbsp;
                            </label>
                            <label for="four">
                                <input type="checkbox" id="four"> 4 &nbsp;
                            </label>
                            <label for="five">
                                <input type="checkbox" id="five"> 5
                            </label>
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
                            <label for="no">
                                <input type="radio" id="no" name="mail_yn">
                                &nbsp;&nbsp;거부
                            </label>
                        </td>
                    </tr>
                </table>
                <!-- //상세 검색 옵션 -->

                <!-- 상세 검색 버튼 -->
                <button type="button" onclick="search()" class="btn btn-outline-secondary btn-sm" style="width: 100px;">검색</button>

            </div>
            <!-- //상세 검색 -->
        </div>
        <!-- //검색 전체 : 검색 버튼까지 포함 -->

    	<!-- 검색 결과 -->
    	<div id="list" style="display: none;">

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
    	            <td>{아이디}</td>
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
    	        </tr>
    	    </table>
    	    <!-- //회원 리스트 -->

    	    <!-- 하단 버튼들 -->
            <button type="button" class="btn-outline-secondary btn-sm" style="width: 170px;">검색된 회원 모두 발송</button>
	        <button type="button" class="btn-outline-secondary btn-sm" style="width: 170px;">선택 회원만 발송</button>

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
        <!-- //검색 결과 -->
    </div>
    <!-- //우측 본문 -->
</div>

</body>
</html>
