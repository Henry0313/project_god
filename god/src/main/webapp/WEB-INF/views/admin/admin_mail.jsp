<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 메일 관리</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_mail.css">

<script>
// 에디터
$(document).ready(function() {
  $('#summernote').summernote({
      height: 600,
      placeholder: '내용을 작성해주세요...'
  });
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
            | 메일 관리
        </header>

        <div style="margin: 30px 0 20px 0;">
            <!-- 셀렉트 박스 -->
            <select id="select_box">
                <option>회원 가입 완료 메일</option>
                <option>상품 주문 완료 메일</option>
                <option>상품 취소 완료 메일</option>
                <option>상품 배송완료 메일</option>
                <option>회원 탈퇴 완료 메일</option>
            </select>

            <!-- 자동 발송 여부 radio button -->
			<div id="mail_auto_yn" style="display: inline-block;">
				자동 발송 여부 &nbsp;:&nbsp;
                <label for="yes">
                    <input type="radio" id="yes" name="mail_auto_yn" checked>&nbsp;&nbsp;예
                </label>
                    &nbsp;&nbsp;
                <label for="no">
                    <input type="radio" id="no" name="mail_auto_yn" >&nbsp;&nbsp;아니오
                </label>
            </div>
        </div>

        <!-- 메일 내용 작성 폼 -->
        <div id="mail_content">

            제목
            <!-- 제목 입력 박스 -->
            <input type="text" id="mail_title" value="Get Out Door 회원 가입을 축하드립니다.">
            <!-- 수정 완료 버튼 -->
            <button type="button" class="btn-outline-secondary btn-sm" style="float: right; width: 100px;">수정 완료</button>

            <!-- 에디터 -->
            <div id="summernote">
                <div style="text-align: center;">
                    <br>
                    <h3>Get Out Door</h3><br>
                    <h5>트랜디한 남성 쇼핑몰</h5>
                    <!-- 분리 선 -->
                    <div id="sepa" style="width: 90%; margin: 30px 5%;
                    border: .5px solid rgb(141,141,141);"></div>
                    <div>
                        <p>
                            안녕하세요! {아이디} 고객님!<br>
                            저희 <b>Get Out Door</b>에 가입해 주셔서 감사합니다.<br><br>
                            <b>Get Out Door</b>는 트랜디한 2,30대 남성 쇼핑몰 입니다.<br>
                            고급 원단의 옷을 합리적인 가격에 구매해 보세요!
                        </p>
                        <!-- 바로가기 버튼 -->
                        <button type="button" class="btn btn-outline-secondary btn-sm"
                        style="width: 190px; margin: 20px 0;">Get Out Door 바로가기</button>
                    </div>
                </div>
            </div>
            <!-- //에디터 -->
    	</div>
        <!-- //메일 내용 작성 폼 -->
    </div>
    <!-- //우측 본문 -->
    
</div>

</body>
</html>
