<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 글쓰기</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_qna_write.css">

<script>
// 에디터
$(document).ready(function() {
	$('#qnaProductContent').summernote({
		height: 550,
		placeholder: '내용을 작성해주세요...'
  });
});

$(document).ready(function() {
	
	// 비밀번호 점검 플래그
	var pwCheckFlag = false;
	
	$("#saveBtn").click(function() {
	
		var title = $("#qnaProductTitle").val();
		
		var content = $("#qnaProductContent").val();
		
		var regexPwCheck = new RegExp($("#qnaProductPw").attr("pattern"));
		
		var pw = $("#qnaProductPw").val();
		
		if (regexPwCheck.test(pw)) { // 정규식 점검 통과
			
			if (title == "") {
				alert("제목을 입력하세요.");
				document.form1.title.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요.");
				document.form1.content.focus();
				return;
			}
			document.form1.submit();
		}
		else {
			
			// 에러 메시징
			$("#qnaProductPw_err").text(($("#qnaProductPw").attr("title")));
			pwCheckFlag = false;
			// 재입력 대기
			$("#qnaProductPw").focus();

		}
	});
});
</script>
<style>

</style>
</head>
<body>
<div id="wrap">

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/board_left.jsp" %>
	
	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			| 글쓰기
		</header>
		<form name="form1" method="post" action="${rootPath}/admin/qna_product_write.do">
			<!-- 상단 타이틀 -->
			<div id="title_wrap">
				
				<!-- 중요공지 -->
				<div id="board_notice">
					<input type="checkbox" name="board_notice" value="">&nbsp;&nbsp;중요 공지
				</div>
				
				<!-- 게시판 종류 선택 -->
				<div id="board_choice">
					게시판 
					<select id="select_box">
						<option value="FAQ">FAQ</option>
						<option value="Q&A">Q&A</option>
						<option value="상품 문의">상품 문의</option>
						<option value="배송 문의">배송 문의</option>
						<option value="입금/기타 문의">입금/기타 문의</option>
						<option value="배송 전 변경/취소">배송 전 변경/취소</option>
						<option value="배송 후 교환/반품">배송 후 교환/반품</option>
						<option value="등업신청">등업신청</option>
						<option value="EVENT">EVENT</option>
					</select>
				</div>
				
				<!-- 글쓰기 타이틀 -->
				<div id="write_title">
					제목
					<input type="text"
						   id="qnaProductTitle"
						   name="qnaProductTitle"
						   size="60"
						   style="height: 30px; margin-left: 22px; font-size: 10pt;"
						   placeholder="제목을 입력해 주세요!"
						   value=""/>
				</div>
				
				<!-- 현재 접속한 아이디 -->
				<input type="text"
					   id="memberId"
					   name="memberId"
					   value="<sec:authentication property='name'/>"
					   style="display: none;"/>
				
			</div>
			<!-- //상단 타이틀 끝 -->
			
			<!-- 글쓰기 content -->
			<div id="write_content" style="width:100%;">
				<!-- 에디터 -->
	            <textarea id="qnaProductContent" name="qnaProductContent"></textarea>
	            <!-- //에디터 -->
	
			</div>
			<!-- //글쓰기 content 끝 -->
			
			<!-- 게시판 비밀번호 -->
			<div style="padding: 10px 0;">
				<div id="board_pw1">비밀번호</div>
				<input type="text" 
					   id="qnaProductPw" 
					   name="qnaProductPw"
					   pattern="[A-Za-z0-9]{5,10}"
					   required
					   title="비밀번호 영문 또는 숫자 5~10자 이내로 입력하십시오">
			</div>
			<!-- // 게시판 비밀번호 끝 -->
			
			<!-- Pw 에러 메세지  -->
			<div style="width: 100%; height: 30px;">  
				<span id="qnaProductPw_err" style="color: red;"></span>
			</div>
			
			<!-- 작성완료/취소 버튼 -->
			<div id="write_btn_wrap">
			
				<!-- 작성 완료 버튼 -->
				<div id="write_complete_btn">
					<button id="saveBtn"
							type="button" 
							class="btn btn-outline-secondary btn-sm" 
							style="width: 100px;">작성완료</button>
				</div>
				<!-- 작성 취소 버튼 -->
				<div id="write_cancel_btn">
					<button id=""
							type="button" 
							class="btn btn-outline-secondary btn-sm" 
							onclick="location.href='${rootPath}/admin/admin_board_qna_product.do/1'"
							style="width: 100px;">작성취소</button>
				</div>
				
			</div>
			<!-- //작성완료/취소 버튼 끝 -->
		</form>
	</div>
	<!-- //우측 본문 끝 -->	
	
</div>
</body>
</html>