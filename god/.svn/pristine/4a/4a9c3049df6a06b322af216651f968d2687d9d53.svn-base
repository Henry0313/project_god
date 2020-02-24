<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 : 교환/환불 신청 상세 보기</title>

<!-- contextPath -->
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!-- rootPath bootstrap, popper, jquery, jquery-ui, summernote -->
<%@ include file="/resources/common/rootPath-js.jsp" %>

<!-- css 외장화 -->
<link rel="stylesheet" href="${rootPath}/resources/css/admin/admin_order_change_detail.css">

<style>

</style>
</head>
<body>
<div id="wrap">

	<!-- 좌측 메뉴 -->
	<%@ include file="/resources/common/admin/order_left.jsp" %>
	
	<!-- 우측 본문 -->
	<div id="container">
	
		<!-- 현재창 title -->
		<header>
			| 교환/환불 신청 상세 보기
		</header>
		
		<!-- detail title -->
		<div id="detail_title">
		
			<!-- 접수일 -->
			<div style="float: left; width: 33%; height: 30px; padding-top: 5px">
				접수일 : {2020-01-02 18:00:00}
			</div>
			
			<!-- 처리 완료일 -->
			<div style="float: left; width: 33%; height: 30px; padding: 5px 0 0 100px">
				처리 완료일 : -
			</div>
			
			<!-- 처리 상태 -->
			<div style="float: left; width: 34%; height: 30px; text-align: right">
				<span>처리 상태</span>&nbsp;
				<select id="select_box">
					<option value="처리 전">처리 전</option>
					<option value="처리 완료">처리 완료</option>
				</select>
			</div>
			
		</div>
		<!-- //detail title 끝 -->
		
		<!-- detail content -->
		<div id="detail_content">
			
			<!-- 접수 번호 -->
			<div class="detail_content_layer1" style="border-top: 1px solid rgb(141,141,141);">
				<div class="detail_content_title1" style="float: left; width: 20%;">
					접수 번호
				</div>
				<div class="detail_content_content" style="float: left; width: 80%;">
					{접수 번호}
				</div>
			</div>
			
			<!-- 신청 ID -->
			<div class="detail_content_layer1">
				<div class="detail_content_title1" style="float: left; width: 20%;">
					신청 ID
				</div>
				<div class="detail_content_content" style="float: left; width: 30%;">
					{아이디}
				</div>
				<div class="detail_content_title1" style="float: left; width: 20%; border-left: 1px solid rgb(141,141,141);">
					신청자명
				</div>
				<div class="detail_content_content" style="float: left; width: 30%;">
					{이름}
				</div>
			</div>
			
			<!-- 휴대폰 번호 -->
			<div class="detail_content_layer1">
				<div class="detail_content_title1" style="width: 20%;">
					휴대폰 번호
				</div>
				<div class="detail_content_content" style="width: 80%;">
					{휴대폰 번호}
				</div>
			</div>
			
			<!-- 상품 -->
			<div class="detail_content_layer1">
				<div class="detail_content_title1" style="width: 20%;">
					상품
				</div>
				<div class="detail_content_content" style="width: 80%;">
					{상품명}
				</div>
			</div>
			
			<!-- 교환/환불 선택 -->
			<div class="detail_content_layer1">
				<div class="detail_content_title1" style="width: 20%;">
					교환/환불 선택
				</div>
				<div class="detail_content_content" style="width: 80%;">
					{선택 사항 표기}
				</div>
			</div>
			
			<div class="detail_content_layer1">
				<div class="detail_content_title1" style="width: 20%;">
					사유 선택
				</div>
				<div class="detail_content_content" style="width: 80%;">
					{선택 사항 표기}
				</div>
			</div>
			
			<div class="detail_content_layer2">
				<div class="detail_content_title2" style="border-bottom: 1px solid rgb(141,141,141);">
					내용 작성
				</div>
				<div style="float:left; width: 80%; height: 120px; margin: 0; border-bottom: 1px solid rgb(141,141,141); overflow-x: hidden; overflow-y: auto;">
					<input type="text"
						   id=""
						   name=""
						   class="form-control rounded-sm bg-light"
						   size="15"
						   style="width: 98%; height: 82%; margin: 10px 0 0 10px; font-size:10pt;;"
						   placeholder="{입력한 내용 표기}"
						   value=""/>
				</div>
			</div>
			
			<div class="detail_content_layer2">
				<div class="detail_content_title2">
					이미지
				</div>
				<div style="float: left; width: 80%; height: 120px;">	
					
					<div style="float: left; width: 70%; height:120px; padding: 10px 0 0 10px;">
						- 20170413_112309641.jpg<br>
						- 20170413_112309642.jpg<br>   
						- 20170413_112309643.jpg
					</div>
					<div style="float: left; width: 30%; height:120px; padding: 65px 0 0 30px;">
						<button id=""
								type="button" 
								class="btn btn-outline-secondary btn-sm" 
								onclick="search()" 
								style="width: 100px;">다운로드</button>
					</div>
					
				</div>
			</div>
			
			<div class="detail_content_layer1">
				<div class="detail_content_title1" style="width: 20%;">
					배송비 결제 금액
				</div>
				<div class="detail_content_content" style="width: 80%;">
					{결제된 금액 표기} 원
				</div>
			</div>
			
		</div>
		<!-- //detail content 끝 -->
		
		<!-- 처리사항 메모 -->
		<div class="detail_content_layer2" style="margin-top:20px; font-size:10pt; border-top: 1px solid rgb(141,141,141);">
			<div class="detail_content_title2">
				처리사항 메모
			</div>
			<div style="float:left; width:80%; height:120px;">	
				
				<div style="float:left; width:98%; height:80%; margin:10px 0 0 10px;">
					<input type="text"
						   id=""
						   name=""
						   class="form-control rounded-sm bg-light"
						   size="15"
						   style="font-size:10pt; width:100%; height:100%;"
						   placeholder="{처리 사항을 작성해 주세요!}"
						   value=""/>
				</div>
				
			</div>
		</div>
		<!-- //처리사항 메모 끝 -->
		
		<!-- 저장/취소 삭제하기 버튼 -->
		<div style="width:100%; height:30px; margin-top:20px;">
			<!-- 저장 버튼 -->
			<div style="float:left; width:50%; height:30px; padding-right:10px">
				<button id=""
						type="button" 
						onclick="" 
						class="btn btn-outline-secondary btn-sm" 
						style="width: 100px; float:right; font-size:13px;">저장</button>
			</div>
			<!-- 취소 버튼 -->
			<div style="float:left; width:30%; height:30px; padding-left:10px">
				<button id=""
						type="button" 
						onclick="" 
						class="btn btn-outline-secondary btn-sm" 
						style="width: 100px; font-size:13px;">취소</button>
			</div>
			<!-- 삭제하기 버튼 -->
			<div style="float:left; width:20%; height:30px;">
				<button id=""
						type="button" 
						onclick="" 
						class="btn btn-outline-secondary btn-sm" 
						style="width: 100px; float:right; font-size:13px;">삭제하기</button>
			</div>
		
		</div>
		<!-- //저장/취소 삭제하기 버튼 끝 -->

	</div>
	<!-- //우측 본문 끝 -->	
	
</div>
</body>
</html>