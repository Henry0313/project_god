<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 EVENT 상세</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_event_detail.css">

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
    });

    // 모달 닫기
    $(".modal_close_btn").click(function() {
        $("#modal").hide();
    });

});

//에디터
$(document).ready(function() {
	$('#summernote').summernote({
		height: 450
  });
});

//알림 팝업창
$(function() {

	//모달 초기 상태 : 은닉
	$("#update_modal").hide();
	$("#reply_modal").hide();
	
	//모달 출력
 	$("#update_btn").click(function() {
		$("#update_modal").show();
	});
 	$("#modify_btn").click(function() {
		$("#reply_modal").show();
	});
	
	// 모달 닫기
	$(".modal_close_btn").click(function() {
		$("#update_modal").hide();
		$("#reply_modal").hide();
	});

});

//리스트 버튼
$(function() {
	
	eventBtn.onclick = function() {
		location.href = "${rootPath}/admin/admin_event.do";
	} //
	
});	
</script>
<body>
<div id="wrap">

	<!-- update_btn modal -->
	<div id="update_modal">
		<div id="update_modal_">
			<!-- 팝업창 제목 -->
			<div id="update_modal_header">
				<div style="float: left; font-size: 14pt;">| EVENT 수정하기</div>
					<a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 36px; color:black">
						close
					</a>
				</div>
			
			<!-- 팝업창 본문 -->
			<div id="update_modal_content">
				
				<!-- 제목 -->
				<div id="update_modal_content_title">
					<div style="float: left; width: 15%; height:100%; padding: 5px 0 0 10px; border-right: 1px solid rgb(141,141,141);">
						SUBJECT
					</div>	
					<div style="float: left; width: 85%; padding: 5px 0 0 10px;">
						Happy new year! 새해맞이 3종 쿠폰 이벤트!
					</div>				
				</div>
				
				<!-- 에디터 -->
				<div style="float: left; width: 100%; padding-top: 15px; font-size:10pt">
					<div id="summernote">

					</div>
				</div>
				
			</div>
			<!-- //팝업창 본문 끝 -->
			
			<!-- 팝업창 하단부 버튼 -->
			<div id="update_modal_footer_btn">
				<button type="button" class="btn-secondary btn-sm" style="width: 80px;">수정완료</button>&nbsp;
				<button type="button" class="modal_close_btn btn-outline-secondary btn-sm" style="width: 80px;">취소</button>
			</div>
			
		</div>
	</div>
	<!-- //update_btn modal 끝 -->
	
	<!-- reply_btn modal -->
	<div id="reply_modal">
		<div id="reply_modal_">
			<!-- 팝업창 제목 -->
			<div id="reply_modal_header">
				<div style="float: left; font-size: 12pt;">| EVENT 댓글/수정 하기</div>
					<a href="#" class="modal_close_btn material-icons" style="float: right; font-size: 24px; color:black">
						close
					</a>
				</div>
			
			<!-- 팝업창 본문 -->
			<div id="reply_modal_content">
				
			</div>
          
			<!-- 팝업창 하단부 -->
			<div id="reply_modal_footer">
				<button type="button" class="btn-secondary btn-sm" style="width: 80px;">수정완료</button>&nbsp;
				<button type="button" class="modal_close_btn btn-outline-secondary btn-sm" style="width: 80px;">취소</button>
			</div>
		</div>
	</div>
	<!-- //reply_btn modal 끝 -->

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/board_left.jsp" %>
	
	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			| EVENT > 상세보기
		</header>
		
		<!-- 게시판 전체 wrap -->
		<div id="board_wrap">

			<!-- 게시판 제목 -->
			<div>
				<div class="board_title1" style="border-top: 1px solid rgb(141, 141, 141);">
					SUBJECT
				</div>	
				<div class="board_title2" style="border-top: 1px solid rgb(141, 141, 141);">
					Happy new year! 새해맞이 3종 쿠폰 이벤트!
				</div>
			</div>
			
			<!-- 게시판 작성자 -->
			<div>
				<div class="board_title1">
					WRITER
				</div>	
				<div class="board_title2">
					운영자
				</div>
			</div>
			
			<!-- 게시판 조회수 -->
			<div>
				<div class="board_title1">
					DATE
				</div>	
				<div class="board_title2">
					2020-01-01 18:00:00
				</div>
			</div>
			
			<!-- 게시판 내용 -->
			<div id="board_content">

			</div>

		</div>
		<!-- //게시판 전체 wrap 끝 -->

		<!-- 버튼 wrap1(LIST, 수정, 삭제)-->
		<div id="btn_wrap1">
			<div class="btn_wrap_left">
				<button id="eventBtn"
						type="button" 
						onclick=""
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">LIST</button>
			</div>
			<div class="btn_wrap_right">
				<button id="update_btn"
						name="update_btn"
						type="button" 
						onclick=""
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">수정</button>
				<button id=""
						type="button" 
						onclick=""
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">삭제</button>
			</div>		
		</div>
		<!-- //버튼 wrap1(LIST, 수정, 삭제) 끝 -->
		
		<!-- 댓글 wrap -->
		<div id="reply_wrap">
			<div style="float: left; width: 75%; height: 150px;">
				<div id="reply_title">
					<div style="float: left; width: 30%; height: 45px; padding: 10px 0 0 10px;">
						홍길*
					</div>
					<div style="float: left; width: 70%; height: 45px; padding: 10px 0 0 10px;">
						2020-01-01
					</div>
				</div>
				<div id="reply_content">
					자주 이용할께요 좋은 옷 감사합니다.
				</div>
			</div>
			<div style="float: left; width: 25%; height: 150px; padding: 20px; text-align: right;">
				<button id="modify_btn"
						name="modify_btn"
						type="button" 
						onclick=""
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">MODIFY</button>
				<button id="delete_btn"
						name="delete_btn"
						type="button" 
						onclick=""
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">DELETE</button>
			</div>
		</div>
		<!-- //댓글 wrap 끝 -->
		
		<!-- 댓글 달기 wrap -->
		<div id="reply_write_wrap">
			<div class="reply_write_title">
				댓글 달기
			</div>
			<div class="reply_write_title">
				<div style="float: left; width: 30%; height: 50px;">
					이름 : 
					<input type="text"
						   id=""
						   name=""
						   size="30"
						   style="height: 30px;font-size: 10pt;"
						   placeholder=""
						   value=""/>
				</div>
				<div style="float: left; height: 50px;">
					비밀번호 : 
					<input type="text"
						   id=""
						   name=""
						   size="30"
						   style="height: 30px; font-size: 10pt;"
						   placeholder=""
						   value=""/>
				</div>
			</div>
			<div class="reply_write_content">
				<div style="float: left; width: 85%; height: 80px; margin: 10px; border: 1px solid rgb(141,141,141);">
					<input type="text"
						   id=""
						   name=""
						   size="30"
						   style="width: 100%; height: 100%; font-size: 10pt; overflow-x: hidden; overflow-y: auto;"
						   placeholder=""
						   value=""/>
				</div>
				<div style="float: right; width: 10%; height: 80px; margin: 10px; padding-top: 50px; text-align: center;">
					<button id=""
							name=""
							type="button" 
							onclick=""
							class="btn btn-outline-secondary btn-sm" 
							style="width: 80px;">WRITE</button>
				</div>
			</div>
		</div>
		<!-- //댓글 달기 wrap 끝 -->
		
	</div>
	<!-- //우측 본문 끝 -->

</div>
</body>
</html>