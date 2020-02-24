<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 게시판 Best Review</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_best_review.css">

<script>
// 구매 후기 리스트 버튼
$(function() {
	
	reviewListBtn.onclick = function() {
		location.href = "${rootPath}/admin/admin_best_review_list.do";
	} //
	
});	
</script>

<style>

</style>
<body>
<div id="wrap">

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/board_left.jsp" %>
	
	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			| Best Review
		</header>
		
		<!-- 본문 제목 wrap -->
		<div id="title_wrap">
			
			<!-- 본문 제목 공통 -->
			<div class="title_common">
				<span class="material-icons" style="font-size: 48pt;">
					local_see
				</span>
			</div>
			<div class="title_common" style="padding-top: 15px; font-size: 15pt;">
				GetOutDoor PHOTO REVIEW
			</div>
			<div class="title_common" style="padding-top: 10px; font-size: 20pt; font-weight: bold;">
				BEST REVIEW
			</div>
			<div class="title_common">
				<span class="material-icons" style="font-size: 48pt;">
					keyboard_arrow_down
				</span>
			</div>
			
		</div>
		<!-- //본문 제목 wrap 끝 -->
		
		<!-- Best Review photo 영역 wrap -->
		<div id="photo_wrap">
		
			<div style="float: left; width: 10%; height: 100%;">
			</div>
			
			<!-- 1등 -->
			<div style="float: left; width: 20%; height: 100%;">
				<!-- review image -->
				<div class="review_image">
				
				</div>
				<!-- 리뷰 내용 -->
				<div class="review_content">
					<div style="float: left; width: 100%; height: 100px;">
						{후기내용}<br><br><br><br>
					</div>
					<div style="float: left; width: 100%; height: 40px;">
						{이름}{(아이디)}
					</div>
				</div>
				<!-- 리뷰 상품명 -->
				<div class="product_name">
					{상품명}
				</div>
				<!-- 리뷰 등수 -->
				<div class="review_grade">
					1등
				</div>
				<div style="float: left; width: 100%; height: 40px; margin-top: 10px; text-align: center;">
					BEST OF BEST!
				</div>
			</div>
			
			<div style="float: left; width: 10%; height: 100%;">
			</div>
			
			<!-- 2등 -->
			<div style="float: left; width: 20%; height: 100%;">
				<!-- review image -->
				<div class="review_image">
				
				</div>
				<!-- 리뷰 내용 -->
				<div class="review_content">
					<div style="float: left; width: 100%; height: 100px;">
						{후기내용}<br><br><br><br>
					</div>
					<div style="float: left; width: 100%; height: 40px;">
						{이름}{(아이디)}
					</div>
				</div>
				<!-- 리뷰 상품명 -->
				<div class="product_name">
					{상품명}
				</div>
				<!-- 리뷰 등수 -->
				<div class="review_grade">
					2등
				</div>
				<div style="float: left; width: 100%; height: 40px; margin-top: 10px; text-align: center;">
					GREAT!
				</div>			
			</div>
			
			<div style="float: left; width: 10%; height: 100%;">
			</div>

			<!-- 3등 -->
			<div style="float: left; width: 20%; height: 100%;">
				<!-- review image -->
				<div class="review_image">
				
				</div>
				<!-- 리뷰 내용 -->
				<div class="review_content">
					<div style="float: left; width: 100%; height: 100px;">
						{후기내용}<br><br><br><br>
					</div>
					<div style="float: left; width: 100%; height: 40px;">
						{이름}{(아이디)}
					</div>
				</div>
				<!-- 리뷰 상품명 -->
				<div class="product_name">
					{상품명}
				</div>
				<!-- 리뷰 등수 -->
				<div class="review_grade">
					3등
				</div>
				<div style="float: left; width: 100%; height: 40px; margin-top: 10px; text-align: center;">
					GOOD!
				</div>			
			</div>

			<div style="float: left; width: 10%; height: 100%;">
			</div>
						
		</div>
		<!-- //Best Review Photo 영역 wrap 끝 -->
		
		<!-- 구매후기 리스트 버튼 영역 -->
		<div id="review_list_btn">
			<button type="button" 
					id="reviewListBtn"
					name="reviewListBtn"
					class="btn btn-outline-secondary btn-sm" 
					onclick="" 
					style="width: 130px; font-size: 10pt;">구매 후기 리스트</button>
		</div>
		<!-- //구매후기 리스트 버튼 영역 끝 -->
		
	</div>
	<!-- //우측 본문 끝 -->
	
</div>
</body>
</html>