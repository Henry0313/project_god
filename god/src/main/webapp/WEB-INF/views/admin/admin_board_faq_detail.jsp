<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 FAQ 상세</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_board_faq_detail.css">

<style>

</style>
<script>
//수정 팝업창
$(function() {

    //모달 초기 상태 : 은닉
    $("#modal").hide();

    //모달 출력
    $("#update_btn").click(function() {
        $("#modal").show();
        $('body').css("overflow", "hidden");
    });

    // 모달 닫기
    $(".modal_close_btn").click(function() {
        $("#modal").hide();
        $('body').css("overflow", "scroll");
    });

});

//에디터
$(document).ready(function() {
	$('#faqContent').summernote({
		height: 400,
		placeholder: '내용을 작성해주세요...'
    });
});

// 삭제 및 수정
$(document).ready(function() {
	
	$("#deleteBtn").click(function() {
		
		if (confirm("삭제하시겠습니까?")) {
			document.form1.action = "${rootPath}/admin/delete.do";
			document.form1.submit();
		}
	});
	
	$("#updateBtn").click(function() {
		
		var title = $("#faqTitle").val();
		var content = $("#faqContent").val();
		
		if (title == "") {
			alert("제목을 입력하세요.");
			document.form1.title.focus();
			return;
		}
		if (content == "") {
			alert("내용을 입력하세요.");
			document.form2.content.focus();
			return;
		}
		document.form1.action="${rootPath}/admin/update.do";
		document.form1.submit();
	});
});

</script>
</head>
<body>
<div id="wrap">

	<form name="form1" method="POST" style="display: contents;">
	
		<!-- 글번호 -->
		<input type="hidden" id="faqId" name="faqId" value="${dto.faqId}" />

		<!-- update_btn modal -->
		<div id="modal">
			<div id="modal_">
				<!-- 팝업창 제목 -->
				<div id="modal_header">
					<div style="float: left; font-size: 14pt;">| FAQ 수정하기</div>
						<a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px; color:black">
							close
						</a>
					</div>
				
				<!-- 팝업창 본문 -->
				<div id="modal_content">
					
					<!-- 제목 -->
					<div id="modal_content_title">
						<div style="float: left; width: 15%; text-align: center;">
							SUBJECT
						</div>	
						<input type="text"
							   id="faqTitle"
							   name="faqTitle"
							   value="${dto.faqTitle}"
							   style="float: left; width: 85%;">
					</div>
					
					<!-- 에디터 -->
					<div style="float: left; width: 100%; padding-top: 15px; font-size:10pt">
						<textarea id="faqContent" name="faqContent">
							<%-- <c:if test="${not empty dto.faqFile}">
								<img src="${rootPath}/image/${dto.faqFile}" style="width: 1000px; height: auto;"/>
							</c:if> --%>
							${dto.faqContent}
						</textarea>
					</div>
					
				</div>
				<!-- //팝업창 본문 끝 -->
				
				<!-- 팝업창 하단부 버튼 -->
				<div id="modal_footer_btn">
					<button id="updateBtn" type="button" class="btn-secondary btn-sm" style="width: 80px;">
						수정완료
					</button>&nbsp;
					<button type="button" class="modal_close_btn btn-outline-secondary btn-sm" style="width: 80px;">
						취소
					</button>
				</div>
			</div>
		</div>
		<!-- //update_btn modal 끝 -->
	</form>
	
	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/board_left.jsp" %>

	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			<b>| FAQ > 상세보기</b>
		</header>

		<!-- 게시판 전체 wrap -->
		<div id="board_wrap">
		
			<!-- 게시판 제목 -->
			<div>
				<div class="board_title1" style="border-top: 1px solid rgb(141, 141, 141);">
					SUBJECT
				</div>	
				<div class="board_title2" style="border-top: 1px solid rgb(141, 141, 141);">
					${dto.faqTitle}
				</div>
			</div>
			
			<!-- 게시판 작성자 -->
			<div>
				<div class="board_title1">
					WRITER
				</div>	
				<div class="board_title2">
					${dto.memberId}
				</div>
			</div>
			
			<!-- 게시판 조회수 -->
			<div>
				<div class="board_title1">
					VIEW
				</div>	
				<div class="board_title2">
					${dto.faqReadCount}
				</div>
			</div>
			
			<!-- 게시판 내용 -->
			<div id="board_content">
				<%-- <c:if test="${not empty dto.faqFile}">
					<img src="${rootPath}/image/${dto.faqFile}" style="width: 1000px; height: auto;"/>
				</c:if> --%>
				${dto.faqContent}
			</div>

		</div>
		<!-- //게시판 전체 wrap 끝 -->

		<!-- 버튼 wrap1(LIST, 수정, 삭제)-->
		<div id="btn_wrap1">
			<div class="btn_wrap_left">
				<button id="faqBtn"
						type="button" 
						onclick="location.href='${rootPath}/admin/admin_board_faq.do/1'"
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">LIST</button>
			</div>
			<div class="btn_wrap_right">
				<button id="update_btn"
						name="update_btn"
						type="button"
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">수정</button>
				<button id="deleteBtn"
						type="button" 
						class="btn btn-outline-secondary btn-sm"
						style="width: 80px;">삭제</button>
			</div>		
		</div>
		<!-- //버튼 wrap1(LIST, 수정, 삭제) 끝 -->

		<!-- 버튼 wrap2(이전글, 다음글)-->
		<div id="btn_wrap2">
			<c:if test="${nextId != dto.faqId}">
				<div style="height: 50px;">
					<a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${nextId}" id="nextBtn" style="margin: 0 20px;">다음글&nbsp;▲</a>
					<a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${nextId}">${nextTitle.faqTitle}</a>
				</div>
			</c:if>
			<c:if test="${preId != dto.faqId}">
				<div style="height: 50px;">
					<a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${preId}" id="preBtn" style="margin: 0 20px;">이전글&nbsp;▼</a>
					<a href="${rootPath}/admin/admin_board_faq_detail.do?faqId=${preId}">${preTitle.faqTitle}</a>
				</div>
			</c:if>
		</div>
		<!-- //버튼 wrap2(이전글, 다음글) 끝 -->

	</div>
	<!-- // 우측 본문 끝 -->
	
	

</div>
</body>
</html>