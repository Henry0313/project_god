<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_board_write.css">

<script>
// 에디터
$(document).ready(function() {
	$('#faqContent').summernote({
		height: 450,
		placeholder: '내용을 작성해주세요...'
  });
});

$(document).ready(function() {
	$("#saveBtn").click(function() {
		var title = $("#faqTitle").val();
		var content = $("#faqContent").val();
		if (title == "") {
			alert("제목을 입력하세요.");
			document.faqForm.faqTitle.focus();
			return;
		}
		if (content == "") {
			alert("내용을 입력하세요.");
			document.faqForm.faqContent.focus();
			return;
		}
		document.faqForm.action="${rootPath}/admin/write_faq_proc.do";
		document.faqForm.submit();
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
			<b>| 글쓰기</b>
		</header>
		
		<form:form id="faqForm"
			  	   name="faqForm"
			  	   method="post"
			  	   enctype="multipart/form-data">
			  	   
			  <%-- action="${rootPath}/admin/insert.do" --%>
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
						   id="faqTitle"
						   name="faqTitle"
						   size="60"
						   style="height: 30px; margin-left: 22px; font-size: 10pt;"
						   placeholder="제목을 입력해 주세요!"/>
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
	            <textarea id="faqContent" name="faqContent"></textarea>
	            <!-- //에디터 -->
	
			</div>
			<!-- //글쓰기 content 끝 -->
			
			<!-- <div>
				<input type="file" 
					   id="faqFile" 
					   name="faqFile"
					   class="form-control" 
					   title="첨부 파일을 입력하십시오" />
			</div> -->
			
			<!-- 작성완료/취소 버튼 -->
			<div id="write_btn_wrap">
			
				<!-- 작성 완료 버튼 -->
				<div id="write_complete_btn">
					<input type="submit"
						   id="saveBtn"
						   class="btn btn-outline-secondary btn-sm"
						   value="작성완료" 
						   style="width: 100px;">
				</div>
				<!-- 작성 취소 버튼 -->
				<div id="write_cancel_btn">
					<button id=""
							type="button" 
							class="btn btn-outline-secondary btn-sm" 
							onclick="location.href='${rootPath}/admin/admin_board_faq.do/1'"
							style="width: 100px;">작성취소</button>
				</div>
				
			</div>
			<!-- //작성완료/취소 버튼 끝 -->
		</form:form>
	</div>
	<!-- //우측 본문 끝 -->	
	
</div>
</body>
</html>