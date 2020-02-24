<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 등업신청 상세</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_grade_detail.css">

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

//리스트 버튼
$(function() {
	
	gradeBtn.onclick = function() {
		location.href = "${rootPath}/admin/admin_grade.do";
	} //
	
});	
</script>
</head>
<body>
<div id="wrap">

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/board_left.jsp" %>

	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			| 등업신청 > 상세보기
		</header>

		<!-- 게시판 전체 wrap -->
		<div id="board_wrap">

			<!-- 게시판 제목 -->
			<div>
				<div class="board_title1" style="border-top: 1px solid rgb(141, 141, 141);">
					SUBJECT
				</div>	
				<div class="board_title2" style="border-top: 1px solid rgb(141, 141, 141);">
					GetOutDoor 등업신청합니다
				</div>
			</div>
			
			<!-- 게시판 작성자 -->
			<div>
				<div class="board_title1">
					WRITER
				</div>	
				<div class="board_title2">
					user1
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
				<등업신청><br>
				등업 신청 부탁드립니다<br>
				후기 잘 남길께요~
			</div>

		</div>
		<!-- //게시판 전체 wrap 끝 -->

		<!-- 버튼 wrap1(LIST)-->
		<div id="btn_wrap1">
			<div>
				<button id="gradeBtn"
						type="button" 
						onclick=""
						class="btn btn-outline-secondary btn-sm" 
						style="width: 80px;">LIST</button>
			</div>
		</div>
		<!-- //버튼 wrap1(LIST) 끝 -->

		<!-- 버튼 wrap2(이전글, 다음글)-->
		<div id="btn_wrap2">
			<div class="btn_before_wrap">
				<div style="float: left; width: 10%;">
					<button id=""
							type="button" 
							onclick=""
							class="btn btn-outline-secondary btn-sm" 
							style="width: 100%;">이전글&nbsp;▲</button>
				</div>
				<div style="float: left; width: 90%;">
					<button id=""
							type="button" 
							onclick=""
							class="btn btn-outline-secondary btn-sm" 
							style="width: 100%; padding-left: 20px; text-align: left;">GetOutDoor 등업신청합니다</button>
				</div>
			</div>
			<div class="btn_next_wrap">
				<div style="float: left; width: 10%;">
					<button id=""
							type="button" 
							onclick=""
							class="btn btn-outline-secondary btn-sm" 
							style="width: 100%;">다음글&nbsp;▼</button>
				</div>
				<div style="float: left; width: 90%;">
					<button id=""
							type="button" 
							onclick=""
							class="btn btn-outline-secondary btn-sm" 
							style="width: 100%; padding-left: 20px; text-align: left;">GetOutDoor 등업신청합니다</button>
				</div>
			</div>		
		</div>
		<!-- //버튼 wrap2(이전글, 다음글) 끝 -->

	</div>
	<!-- //게시판 우측 본문 끝 -->

</div>
<!-- //게시판 끝 -->

</body>
</html>
