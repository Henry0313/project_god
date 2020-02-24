<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 Q&A-상품문의 상세</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_qna_product_detail.css">

<script>
$(document).ready(function(){

	// 게시글 답글 처리
	$("button[id^=replySubmitBtn]").click(function (e) {

		/* alert("답글 쓰기 요청"); */

		var qnaProductId = ${qnaProductVO.qnaProductId}; 
		
		// $("#page").val(page);
		
		var form = $('form#qnaProductReplyForm')[0];
        var formData = new FormData(form);
        
		$.ajax ({

			url : rootPath + "/admin/reply_qna_write_proc.do",
			cache: false,
            async: false,
            cache: false,
            contentType: false,
            processData: false,

			type : "POST",
			data : formData,

			success : function (result) {
				
				/* alert("#############################"); */
				
				/*
				event.cancelBubble = true;
				if(event stopPropagation) {
					event.stopPropagation();	
				}
				*/
				
				history.go(-1);

				// location.href = "http://localhost:8181/god/admin/admin_board_qna_product.do/1";
				
				// $('#replyModal').modal('hide');

				// alert("####### result : "+result);
				/*
				if (result.trim() == "true") {
					alert("답글 저장 성공");
				} else {
					alert("답글 저장 실패");
				}

				alert("############");
				// location.reload(); // 페이지 리프레시(재설정)
				// location.href = rootPath+"/";
				
				*/
			},
            error : function(xhr, status) {
                alert(xhr+" : "+status);
                console.log(xhr+" : "+status); // 에러 코드
            }
		}); // ajax 
	
	}); // 전송 끝
	
});
//수정 팝업창
$(function() {

    //모달 초기 상태 : 은닉
    $("#modal").hide();

    //모달 출력
    $("#updateBtn").click(function() {
        $("#modal").show();
        $('body').css("overflow", "hidden");
    });

    // 모달 닫기
    $(".modal_close_btn").click(function() {
        $("#modal").hide();
        $('body').css("overflow", "hidden");
    });

});

//에디터
$(document).ready(function() {
	$('.qnaProductContent1').summernote({
		height: 400
	});
	$('#qnaProductContent2').summernote({
		height: 300
	});
});

// 삭제 및 수정
$(document).ready(function() {
	
	$("#deleteBtn").click(function() {
		
		if (confirm("삭제하시겠습니까?")) {
			document.form1.action = "${rootPath}/admin/qna_product_delete.do";
			document.form1.submit();
		}
	});
	
	$("#updateBtnSuccess").click(function() {
		
		var title = $(".qnaProductTitle1").val();
		var content = $(".qnaProductContent1").val();
		
		// alert("title : "+title);
		// alert("content : "+content);
		
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
		document.form1.action="${rootPath}/admin/admin_board_qna_product_update.do";
		document.form1.submit();
	});
	
});
</script>
</head>
<body>
<div id="wrap">

	<!-- 게시글 답글(댓글) 쓰기(팝업) 시작 -->
	<%@ include file="paging/reply_qna_product_popup.jspf" %>
	<!-- 게시글 답글(댓글) 쓰기(팝업) 끝 -->
		
	<form name="form1" method="POST" style="display: contents;">

		<!-- 글번호 -->
		<input id="qnaProductId" name="qnaProductId" value="${qnaProductVO.qnaProductId}" style="display: none;">

		<!-- update_btn modal -->
		<div id="modal">
			<div id="modal_">
				<!-- 팝업창 제목 -->
				<div id="modal_header">
					<div style="float: left; font-size: 14pt;">| Q&A 상품문의 수정하기</div>
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
							   id="qnaProductTitle"
							   name="qnaProductTitle"
							   class="qnaProductTitle1"
							   value="${qnaProductVO.qnaProductTitle}"
							   style="float: left; width: 85%;">
					</div>
					
					<!-- 에디터 -->
					<div style="float: left; width: 100%; padding-top: 15px; font-size:10pt">
						<textarea id="qnaProductContent" name="qnaProductContent" class="qnaProductContent1">
							${qnaProductVO.qnaProductContent}
						</textarea>
					</div>
					
				</div>
				<!-- //팝업창 본문 끝 -->
				
				<!-- 팝업창 하단부 버튼 -->
				<div id="modal_footer_btn">
					<button id="updateBtnSuccess" type="button" class="btn-secondary btn-sm" style="width: 80px;">
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
			<b>| Q&A > 상품문의 > 상세보기</b>
		</header>

		<!-- 게시판 전체 wrap -->
		<div id="board_wrap">

			<!-- 게시판 제목 -->
			<div>
				<div class="board_title1" style="border-top: 1px solid rgb(141, 141, 141);">
					SUBJECT
				</div>	
				<div class="board_title2" style="border-top: 1px solid rgb(141, 141, 141);">
					${qnaProductVO.qnaProductTitle}
				</div>
			</div>
			
			<!-- 게시판 작성자 -->
			<div>
				<div class="board_title1">
					WRITER
				</div>	
				<div class="board_title2">
					${qnaProductVO.memberId}
				</div>
			</div>
			
			<!-- 게시판 조회수 -->
			<div>
				<div class="board_title1">
					DATE
				</div>	
				<div class="board_title2">
					${qnaProductVO.qnaProductDate}
				</div>
			</div>
			
			<!-- 게시판 내용 -->
			<div id="board_content">
				${qnaProductVO.qnaProductContent}
			</div>

		</div>
		<!-- //게시판 전체 wrap 끝 -->

		<!-- 버튼 wrap1(LIST, 수정, 삭제)-->
		<div id="btn_wrap1">
			<div class="btn_wrap_left">
				<button id=""
						type="button" 
						onclick="location.href='${rootPath}/admin/admin_board_qna_product.do/1'"
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">LIST</button>
				<button type="button" 
		                id="replyContentBtn_"
		        		class="btn btn-outline-secondary btn-sm" 
	   				    data-toggle="modal" 
						data-target="#replyModal"
						style="width: 80px;">답변</button>
			<!-- data-dismiss="modal" -->
			</div>
			<div class="btn_wrap_right">
				<button id="updateBtn"
						name="updateBtn"
						type="button" 
						onclick=""
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
			<c:if test="${qnaProductVO.qnaProductReLev == 0}">
				
				<c:if test="${nextId != qnaProductVO.qnaProductId}">
					<div style="height: 50px;">
						<a href="${rootPath}/admin/admin_board_qna_product_detail.do?qnaProductId=${nextId}" id="nextBtn" style="margin: 0 20px;">다음글&nbsp;▲</a>
						<a href="${rootPath}/admin/admin_board_qna_product_detail.do?qnaProductId=${nextId}">${nextTitle.qnaProductTitle}</a>
					</div>
				</c:if>
				<c:if test="${preId != qnaProductVO.qnaProductId}">
					<div style="height: 50px;">
						<a href="${rootPath}/admin/admin_board_qna_product_detail.do?qnaProductId=${preId}" id="preBtn" style="margin: 0 20px;">이전글&nbsp;▼</a>
						<a href="${rootPath}/admin/admin_board_qna_product_detail.do?qnaProductId=${preId}">${preTitle.qnaProductTitle}</a>
					</div>
				</c:if>
				
			</c:if>
		</div>
		<!-- //버튼 wrap2(이전글, 다음글) 끝 -->

	</div>
	<!-- //게시판 우측 본문 끝 -->

</div>
<!-- //게시판 끝 -->
</body>
</html>
