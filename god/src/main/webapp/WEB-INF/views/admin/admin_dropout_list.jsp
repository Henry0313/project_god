<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 탈퇴 회원 리스트</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_dropout_list.css">

<script>

// 검색버튼누르면 회원리스트 출력
function search() {
	var li = document.getElementById("list");
    if (li.style.display == 'none') {
        li.style.display = 'block';
    }
}

// 선택삭제 누르면 확인창
function remove() {
	if (confirm("선택한 회원을 삭제하시겠습니까?")==true) {
		alert("삭제되었습니다.");
	} else {
		return false;
	}
}

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
            | 탈퇴 회원 리스트
        </header>

        <!-- 검색 폼 -->
        <div id="search_form">

            <!-- 셀렉트 박스 -->
            <select id="select_box">
                <option>&nbsp;&nbsp;&nbsp;&nbsp;이름</option>
                <option>&nbsp;&nbsp;아이디</option>
            </select> &nbsp;

            <!-- 입력 박스 -->
            <input type="text" style="width: 230px; height: 30px; font-size: 12px; border: 1px solid rgb(141,141,141);"> &nbsp;

            <!-- 검색 버튼 -->
            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="search()" style="width: 80px;">검색</button>

        </div>
        <!-- //검색 폼 -->

    	<!-- 검색 결과 -->
    	<div id="list" style="display: none;">

    	    <!-- 탈퇴 회원 리스트 -->
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
    	            <td>삭제 예정일</td>
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
    	            <td>{년-월-일}<br>{남은 날}일 남음</td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
    	            <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td>
    	        </tr>
                <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
    	            <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td>
    	        </tr>
    	        <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td>
    	        </tr>
                <tr class="list2">
    	            <td>
    	                <input type="checkbox">
    	            </td>
                    <td></td><td></td><td></td><td></td><td></td>
    	            <td></td><td></td><td></td>
    	        </tr>
    	    </table>
    	    <!-- //탈퇴 회원 리스트 -->

    	    <!-- 선택 삭제 버튼 -->
	        <button type="button" class="btn-outline-secondary btn-sm"
					onclick="remove()"style="width: 100px;">선택 삭제</button>

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
